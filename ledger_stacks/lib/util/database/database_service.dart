import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  //Header CRUD mylist
  Future _createDatabase(Database db, int version) async {
    await db.execute('''
CREATE TABLE mylist(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  amount DOUBLE,
  type TEXT,
  frequency TEXT
)
''');
  }

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
  //Footer CRUD mylist
}
