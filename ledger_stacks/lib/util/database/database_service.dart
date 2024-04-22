import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/my_list.dart';
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

  //Header CRUD mylist
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
      SuccessSnackbar.show(
        title: 'Success',
        message: '"${myList.name}" added successfully',
      );
    } else {
      ErrorSnackbar.show(
        title: 'Error',
        message: 'Failed to add list "${myList.name}"',
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
    } else {
      ErrorSnackbar.show(
        title: 'Error',
        message: 'Failed to update "${myList.name}"',
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
    } else {
      ErrorSnackbar.show(
        title: 'Error',
        message: 'Failed to delete',
      );
    }
    return rowsDeleted;
  }

  //Footer CRUD mylist
}
