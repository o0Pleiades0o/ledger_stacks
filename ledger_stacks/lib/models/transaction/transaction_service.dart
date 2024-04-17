import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/models/transaction/transaction.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TransactionService extends GetxController {

  TransactionService._();
  static TransactionService of = TransactionService._();

  final String nameDatabase = 'ledgerStrack.db';
  final int version = 1;
  final String tableDatabase = 'tableTransaction';
  final String columnName = 'name';
  final String columnAmount = 'amount';
  final String columnTransactionType = 'transactionType';
  final String columnDate = 'date';

  late final Database _database;
  //Default unnamed constructor
  TransactionService();

  @override
  void onInit() {
    super.onInit();
    initialDatabase();
  }

  Future<Null> initialDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), nameDatabase),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE $tableDatabase ($columnName TEXT PRIMARY KEY, $columnAmount INTEGER, $columnTransactionType TEXT, $columnDate DATE)'),
      version: version,
    );
  }

  Future<List<TransactionModel>> readSQLite() async {
    List<TransactionModel> transactionData = [];
    List<Map<String, dynamic>> maps = await _database.query(tableDatabase);
    for (var item in maps) {
      TransactionModel model = TransactionModel.fromMap(item);
      transactionData.add(model);
    }
    return transactionData;
  }

  Future<Null> insertValueTransaction(TransactionModel transactionModel, {required TextEditingController controller}) async {
    await _database.insert(tableDatabase, transactionModel.toMap());
    debugPrint('### insert Value name ==>> ${transactionModel.name}');
  }
}
