import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/myledger/ledger_controller.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/latest_date.dart';
import '../../models/my_list.dart';
import '../../models/transaction.dart';
import '../../pages/mylist/mylist_controller.dart';
import '../../widgets/snackbar.dart';

class LedgetStackDB extends GetxService {
  static final LedgetStackDB instance = LedgetStackDB._internal();
  factory LedgetStackDB() => instance;
  LedgetStackDB._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'LedgetStackDB.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  //mylist
  Future _createDatabase(Database db, int version) async {
    await db.execute('''
CREATE TABLE mylist(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  amount DOUBLE,
  isIncome TEXT,
  type TEXT,
  frequency TEXT
)
''');

    await db.execute('''
CREATE TABLE transactions(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  amount DOUBLE,
  isIncome TEXT,
  date DATE
)
'''); //transaction

    await db.execute('''
CREATE TABLE latestdate(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  latestdate DATE
)
''');

    await db.execute('''
CREATE TABLE dailyReport(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  date DATE,
  dailyIncome TEXT,
  dailyExpense TEXT,
  dailyBalance TEXT
)
'''); //Daily_Report
  }

  //===============CRUD mylist===============
  Future<List<MyList>> getMylist() async {
    final Database db = await database;
    final maps = await db.query('mylist');
    return List.generate(maps.length, (i) {
      return MyList.fromMap(maps[i]);
    });
  }

  Future<int> createMylist(MyList myList) async {
    final MyListController myListController = Get.put(MyListController());
    myListController.updateList();
    final db = await database;
    final id = await db.insert('mylist', myList.toMap());
    if (id > 0) {
      SuccessSnackbar.show(
        title: 'Success',
        message: '"${myList.name}" added successfully',
      );
    }
    return id;
  }

  Future<int> updateMylist(MyList myList, [MyListController? myListController]) async {
    final db = await database;
    final rowsAffected = await db.update('mylist', myList.toMap(), where: 'id = ?', whereArgs: [myList.id]);

    // Check if myListController is not null before calling updateList()
    if (myListController != null) {
      myListController.updateList();
    }

    if (rowsAffected > 0) {
      SuccessSnackbar.show(
        title: 'Success',
        message: '"${myList.name}" updated successfully',
      );
    }
    return rowsAffected;
  }

  Future<int> deleteMyList(int id, MyListController myListController) async {
    final db = await database;
    final rowsDeleted = await db.delete('mylist', where: 'id = ?', whereArgs: [id]);
    myListController.updateList();
    if (rowsDeleted > 0) {
      SuccessSnackbar.show(
        title: 'Success',
        message: 'deleted successfully',
      );
    }
    return rowsDeleted;
  }

  //===============CRUD Transaction===============

  Future<List<TransactionModel>> getTransactions() async {
    final Database db = await database;
    final maps = await db.query('transactions');
    return List.generate(maps.length, (i) {
      return TransactionModel.fromMap(maps[i]);
    });
  }

  Future addTransactionFromMylist(TransactionModel transactionModel) async {
    final Database db = await database;
    final int id = await db.insert('transactions', transactionModel.toMap());
    if (id > 0) {
      debugPrint("Auto Transaction Added");
    }
    return id;
  }

  Future<int> createTransaction(TransactionModel transaction) async {
    final LedgerController ledgerController = Get.put(LedgerController());
    final Database db = await database;
    final int id = await db.insert('transactions', transaction.toMap());
    ledgerController.fetchMyLedger();
    if (id > 0) {
      SuccessSnackbar.show(
        title: 'Success',
        message: '"${transaction.name}" added successfully',
      );
    }
    return id;
  }

  Future<int> updateTransaction(TransactionModel transaction, LedgerController ledgerController) async {
    final LedgerController ledgerController = Get.put(LedgerController());
    final Database db = await database;
    final rowsAffected = await db.update('transactions', transaction.toMap(), where: 'id = ?', whereArgs: [transaction.id]);
    ledgerController.fetchMyLedger();
    if (rowsAffected > 0) {
      SuccessSnackbar.show(
        title: 'Success',
        message: '"${transaction.name}" updated successfully',
      );
    }
    return rowsAffected;
  }

  Future<int> deleteTransaction(int id, LedgerController ledgerController) async {
    final Database db = await database;
    final rowsDeleted = await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
    ledgerController.fetchMyLedger();
    if (rowsDeleted > 0) {
      SuccessSnackbar.show(
        title: 'Success',
        message: 'deleted successfully',
      );
    }
    return rowsDeleted;
  }

  //=============== Query Daily Report ===============

  Future<double> calculateDailyAmount(String dateTime, String type) async {
    double dailyAmount = 0.0;

    // Open the database connection
    Database db = await openDatabase('LedgetStackDB.db');

    // Query for transactions on the specified date and type
    List<Map<String, dynamic>> transactions = await db.query(
      'transactions',
      where: 'isIncome = ? AND DATE(date) = ?',
      whereArgs: [type, dateTime],
    );

    // Check if any transactions were found
    if (transactions.isNotEmpty) {
      // Iterate through transactions and accumulate amount
      for (var transaction in transactions) {
        var amount = transaction['amount'];
        var datedate = transaction['date'];

        debugPrint("$datedate");

        // Validate amount before adding
        if (amount is double && amount > 0.0) {
          dailyAmount += amount;
        }
      }
    }

    return dailyAmount;
  }

  Future<double> calculateDailyIncome(String dateTime) async {
    return await calculateDailyAmount(dateTime, 'income');
  }

  Future<double> calculateDailyExpense(String dateTime) async {
    return await calculateDailyAmount(dateTime, 'expense');
  }

//=============== Query MonthlyReport ===============

  Future<double> calculateMonthlyAmount(String dateTime, String type) async {
    double monthlyAmount = 0.0;

    // Open the database connection
    Database db = await openDatabase('LedgetStackDB.db');

    // Extract year and month from the provided dateTime string
    String date = dateTime.substring(0, 7);

// Query for transactions on the specified month, year, and type
    List<Map<String, dynamic>> transactions = await db.query(
      'transactions',
      where: 'isIncome = ? AND strftime("%Y-%m", date) = ?',
      whereArgs: [type, date],
    );

    // Check if any transactions were found
    if (transactions.isNotEmpty) {
      // Iterate through transactions and accumulate amount
      for (var transaction in transactions) {
        var amount = transaction['amount'];
        debugPrint("amount : $amount");
        // Validate amount before adding
        if (amount is double && amount > 0.0) {
          monthlyAmount += amount;
        }
      }
    }
    debugPrint("$monthlyAmount");

    return monthlyAmount;
  }

  Future<double> calculateMonthlyIncome(String dateTime) async {
    return await calculateMonthlyAmount(dateTime, 'income');
  }

  Future<double> calculateMonthlyExpense(String dateTime) async {
    return await calculateMonthlyAmount(dateTime, 'expense');
  }

//=====Function Auto add Transaction=====
  Future<List<LatestDate>> getLatestDate() async {
    final Database db = await database;
    final maps = await db.query('latestdate');
    return List.generate(maps.length, (i) {
      return LatestDate.fromMap(maps[i]);
    });
  }

  Future<void> createLatestDate(String latestDate) async {
    final Database db = await database;
    await db.insert('latestdate', {'latestdate': latestDate});
  }

  Future<void> updateLatestDate(String latestDate) async {
    final Database db = await database;
    await db.rawUpdate(
      'UPDATE latestdate SET latestdate = ?',
      [latestDate],
    );
  }
}
