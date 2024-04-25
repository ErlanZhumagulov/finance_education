import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:finance_education/models/GuideModel.dart';
import 'package:sqflite/sqflite.dart';


class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Guide ("
              "id INTEGER PRIMARY KEY,"
              "title TEXT,"
              "content TEXT,"
              "blocked BIT,"
              "status TEXT"
              ")");
        });
  }
  newGuide(Guide newGuide) async {
    final db = await database;
    var res = await db.insert("Guide", newGuide.toMap());
    return res;
  }
  // blockOrUnblock(Guide guide) async {
  //   final db = await database;
  //   Guide blocked = Guide(
  //       id: Guide.id,
  //       firstName: guide.firstName,
  //       lastName: guide.lastName,
  //       blocked: !guide.blocked);
  //   var res = await db.update("Guide", blocked.toMap(),
  //       where: "id = ?", whereArgs: [Guide.id]);
  //   return res;
  // }

  updateGuide(Guide newGuide) async {
    final db = await database;
    var res = await db.update("Guide", newGuide.toMap(),
        where: "id = ?", whereArgs: [newGuide.id]);
    return res;
  }

  getGuide(int id) async {
    final db = await database;
    var res = await db.query("Guide", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Guide.fromMap(res.first) : null;
  }

  Future<List<Guide>> getAllGuides() async {
    final db = await database;
    var res = await db.query("Guide");
    List<Guide> list =
    res.isNotEmpty ? res.map((c) => Guide.fromMap(c)).toList() : [];
    return list;
  }
}