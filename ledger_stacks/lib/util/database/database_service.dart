import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/models/daily_report.dart';
import 'package:ledger_stacks/models/monthly_report.dart';
import 'package:ledger_stacks/models/transaction.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/my_list.dart';

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
'''); //Mylist

    await db.execute('''
CREATE TABLE transactions(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  amount DOUBLE,
  transactionType TEXT,
  date TEXT
)
'''); //transaction

    await db.execute('''
CREATE TABLE monthly_reports (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  date TEXT,
  monthlyIncome DOUBLE,
  monthlyExpense DOUBLE,
  monthlyBalance DOUBLE
)
'''); //monthly Report

    await db.execute('''
CREATE TABLE daily_reports (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  date TEXT,
  dailyIncome DOUBLE,
  dailyExpense DOUBLE,
  dailyBalance DOUBLE
)
'''); //Daily Report
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
      Get.snackbar(
        'Success',
        'List "${myList.name}" added successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to add list "${myList.name}"',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    return id;
  }

  Future<int> updateMylist(MyList myList) async {
    final db = await database;
    return await db.update('Mylist', myList.toMap(),
        where: 'id = ?', whereArgs: [myList.id]);
  }

  Future<int> deleteMylist(int id) async {
    final db = await database;
    return await db.delete('Mylist', where: 'id = ?', whereArgs: [id]);
  }

  //===============CRUD Transaction===============

  Future<List<TransactionModel>> getTransactions() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('transactions');
    return List.generate(maps.length, (i) {
      return TransactionModel.fromMap(maps[i]);
    });
  }

  Future<int> createTransaction(TransactionModel transaction) async {
    final Database db = await database;
    final int id = await db.insert('transactions', transaction.toMap());
    if (id > 0) {
      Get.snackbar(
        'Success',
        'Transaction "${transaction.name}" added successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to add transaction "${transaction.name}"',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    return id;
  }

  Future<int> updateTransaction(TransactionModel transaction) async {
    final Database db = await database;
    return await db.update(
      'transactions',
      transaction.toMap(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }

  Future<int> deleteTransaction(int id) async {
    final Database db = await database;
    return await db.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//===============CRUD Monthly Report===============

  Future<List<MonthlyReportModel>> getMonthlyReport() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('monthly report');
    return List.generate(maps.length, (i) {
      return MonthlyReportModel.fromMap(maps[i]);
    });
  }

  Future<int> createMonthlyReport(MonthlyReportModel monthlyReport) async {
    final Database db = await database;
    final int id = await db.insert('monthly_reports', monthlyReport.toMap());
    return id;
  }

  Future<int> deleteMonthlyReport(int id) async {
    final Database db = await database;
    return await db.delete(
      'monthly_reports',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//===============CRUD Daily Report===============

  Future<List<DailyReportModel>> getDailyReport() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('monthly report');
    return List.generate(maps.length, (i) {
      return DailyReportModel.fromMap(maps[i]);
    });
  }

  Future<int> createDailyReport(DailyReportModel report) async {
    final Database db = await database;
    final int id = await db.insert('daily_reports', report.toMap());
    return id;
  }

  Future<int> deleteDailyReport(int id) async {
    final Database db = await database;
    return await db.delete(
      'daily_reports',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
