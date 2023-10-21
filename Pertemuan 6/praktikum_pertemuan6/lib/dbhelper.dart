// ignore_for_file: prefer_conditional_assignment, unnecessary_null_comparison, unnecessary_this, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'model/item.dart';

class DbHelper {
  static DbHelper? _dbHelper_niken;
  static Database? _database_niken;

  DbHelper._createObject();

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    var itemDatabase =
        await openDatabase(path, version: 4, onCreate: _createDb);

    return itemDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE item (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        price INTEGER
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'name');
    return mapList;
  }

  Future<int> insert(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

  Future<int> update(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Item>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Item> itemList = [];
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  factory DbHelper() {
    if (_dbHelper_niken == null) {
      _dbHelper_niken = DbHelper._createObject();
    }
    return _dbHelper_niken!;
  }

  Future<Database> get database async {
    if (_database_niken == null) {
      _database_niken = await initDb();
    }
    return _database_niken!;
  }
}
