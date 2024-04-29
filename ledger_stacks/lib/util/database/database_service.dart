import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/myledger/ledger_controller.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/my_list.dart';
import '../../models/transaction.dart';
import '../../pages/myledger/show_ledger/ledger_list_controller.dart';
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

  Future<int> updateMylist(MyList myList,
      [MyListController? myListController]) async {
    final db = await database;
    final rowsAffected = await db.update('mylist', myList.toMap(),
        where: 'id = ?', whereArgs: [myList.id]);

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
    final rowsDeleted =
        await db.delete('mylist', where: 'id = ?', whereArgs: [id]);
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

  Future<int> createTransaction(TransactionModel transaction) async {
    final Database db = await database;
    final int id = await db.insert('transactions', transaction.toMap());
    if (id > 0) {
      SuccessSnackbar.show(
        title: 'Success',
        message: '"${transaction.name}" added successfully',
      );
    }
    return id;
  }

  Future<int> updateTransaction(TransactionModel transaction,
      [LedgerController? ledgerController]) async {
    final Database db = await database;
    final rowsAffected = await db.update('transactions', transaction.toMap(),
        where: 'id = ?', whereArgs: [transaction.id]);
    if (ledgerController != null) {
      ledgerController.fetchMyLedger();
    }

    if (rowsAffected > 0) {
      SuccessSnackbar.show(
        title: 'Success',
        message: '"${transaction.name}" updated successfully',
      );
    }
    return rowsAffected;
  }

  Future<int> deleteTransaction(
      int id, LedgerListController ledgerController) async {
    final Database db = await database;
    final rowsDeleted =
        await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
    ledgerController.fetchLedgerList();
    if (rowsDeleted > 0) {
      SuccessSnackbar.show(
        title: 'Success',
        message: 'deleted successfully',
      );
    }
    return rowsDeleted;
  }

  //=============== Query Daily Report ===============
  
  Future<double> calculateDailyIncome(String dateTime) async {
  double dailyIncome = 0.0;

 {
    // Open the database connection
    Database db = await openDatabase('LedgetStackDB.db');

    // Query for transactions on the specified date
    List<Map<String, dynamic>> transactions = await db.query(
      'transactions',
      where: 'isIncome = ? AND DATE(date) = ?',
      whereArgs: ['income', dateTime],
    );

    debugPrint('time : $dateTime');

    // Check if any transactions were found
    if (transactions.isNotEmpty) {
      // Iterate through transactions and accumulate income
      for (var transaction in transactions) {
        var amount = transaction['amount'];
        debugPrint('amount : $amount');

        // Validate amount before adding
        if (amount is double && amount > 0.0) {
          dailyIncome += amount;
        } else {
          debugPrint('Warning: Invalid amount encountered: $amount');
        }
      }
    } else {
      debugPrint('No income transactions found for $dateTime');
    }

    return dailyIncome;
  } 
}

}
