import 'package:ledger_stacks/models/transaction/transaction.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TransactionService {
  final String nameDatabase = 'ledgerStrack.db';
  final int version = 1;
  final String tableDatabase = 'tableTransaction';
  final String columnName = 'name';
  final String columnAmount = 'amount';
  final String columnTransactionType = 'transactionType';
  final String columnDate = 'date';

  TransactionService() {
    initialDatabase();
  }

  Future<Null> initialDatabase() async {
    await openDatabase(
      join(await getDatabasesPath(), nameDatabase),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE $tableDatabase ($columnName TEXT PRIMARY KEY, $columnAmount INTEGER, $columnTransactionType TEXT, $columnDate DATE'),
      version: version,
    );
  }

  Future<Database> connectedDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), nameDatabase));
  }

  Future<List<TransactionModel>> readSQLite() async {
    Database database = await connectedDatabase();
    List<TransactionModel> transactionData = [];
    List<Map<String, dynamic>> maps = await database.query(tableDatabase);
    //print('### maps on TransactionService ==>> $maps');
    for (var item in maps) {
      TransactionModel model = TransactionModel.fromMap(item);
      transactionData.add(model);
    }
    return transactionData;
  }

  Future<Null> insertValueTransaction(TransactionModel transactionModel) async {
    Database database = await connectedDatabase();
    await database.insert(tableDatabase, transactionModel.toMap()).then(
        (value) => print('### insert Value name ==>> ${transactionModel.name}'));
  }

  /*Future<void> deleateValueTransaction(int id) async {
    Database database = await connectedDatabase();
    await database
        .delete(tableDatabase, where: '$columnId = $id')
        .then((value) => print('### Success Delete id ==> $id'));
  }*/

}