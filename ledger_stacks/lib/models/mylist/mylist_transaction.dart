import 'dart:async';
import 'package:ledger_stacks/models/MyList/mylist.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyListTable {
  MyListTable._(); //การสร้างคลาสแบบGlobal
  static MyListTable of = MyListTable._();

  late final Database database;

  /*MyListTable() {
    initializeDatabase();
  }*/

  Future<void> initializeDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'MyList_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE MyList(itemName TEXT PRIMARY KEY, amount REAL, listType TEXT, listFreq TEXT)',
        );
      },
      version: 1,
    );
    print('initializeDatabase');
  }

  Future<void> insertMyList(MyList myList) async {
    await database.insert(
      'MyList',
      myList.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<MyList>> getMyList() async {
    final List<Map<String, Object?>> myListMaps =
        await database.query('MyList');
    return myListMaps.map((map) => MyList.fromMap(map)).toList();
  }

  Future<void> updateMyList(MyList myList) async {
    await database.update(
      'MyList',
      myList.toMap(),
      where: 'itemName = ?',
      whereArgs: [myList.itemName],
    );
  }

  Future<void> deleteMyList(String itemName) async {
    await database.delete(
      'MyList',
      where: 'itemName = ?',
      whereArgs: [itemName],
    );
  }
}
