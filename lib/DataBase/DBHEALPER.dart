import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import '../model/category.dart';

class DBHelper {
  // database name
  static final String _dbName = 'shoppio.db';

  // database version
  static int _dbVersion = 1;

  // table name
  static final String _tableCategory = 'category';

  // Column names
  static final String _id = 'id';
  static final String _title = 'title';
  static final String _desc = 'description';
  static final String _image = 'image_path';
  static final String _date = 'date';

  static Database? _database;

  Future<Database?> getDatabase() async {
    if (_database == null) {
      _database = await createDatabase();
    }
    return _database;
  }

  Future<Database> createDatabase() async {

    var path = join(await getDatabasesPath(), _dbName);
    print('database path : $path');
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $_tableCategory ('
            '$_id INTEGER PRIMARY KEY AUTOINCREMENT, '
            '$_title TEXT, '
            '$_desc TEXT, '
            '$_image TEXT, '
            '$_date INTEGER'
            ')');
      },
    );
  }

  Future<int> insert(Category category) async {
    final db = await getDatabase();
    return await db!.insert(_tableCategory, category.toMap());
  }

  Future<int> update(Category category) async {
    final db = await getDatabase();
      return await db!.update(_tableCategory, category.toMap(),where : 'id = ?',whereArgs : [category.id]);
  }

  Future<int> delete(int? id) async {
    final db = await getDatabase();
     return await db!.delete(_tableCategory,where: 'id = ?',whereArgs: [id]);
  }

  Future<List<Category>> read() async {

    var categoryList = <Category>[];
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db!.rawQuery('select * from $_tableCategory');
    categoryList = List.generate(maps.length, (index) => Category.fromMap(maps[index]));
    return categoryList;
  }
}
