// ignore_for_file: avoid_print

import "dart:io";
import "package:calculator_app/ui/history/history_class.dart";
import "package:path_provider/path_provider.dart";
import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._();

  DatabaseManager._();

  static DatabaseManager get instance {
    return _instance;
  }

  static Database? _database;

  static String tableName = "History_table";
  static String colId = "id";
  static String colExp = "exp";
  static String colRes = "res";

  static String databaseName = "History.db";

  Future<Database> get database async {
    _database ??= await initializeDatabase();

    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);

    var testDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return testDatabase;
  }

  Future<void> _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colExp TEXT, $colRes TEXT)");
  }

  Future<void> addHistory(History history) async {
    final db = await database;

    int index = await db.insert(tableName, history.toMap());
    print("data added successfully at $index");
  }

  Future<List<History>> getHistoryList() async {
    final db = await database;
    List<Map<String, dynamic>> jsonList = await db.query(tableName);

    List<History> historyList =
        jsonList.map((json) => History.fromJson(json)).toList();

    return historyList;
  }

  Future<int> updateHistory(int id, History updatedHistory) async {
    final db = await database;
    return await db.update(tableName, updatedHistory.toMap(),
        where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteHistory(int id) async {
    final db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);
    await deleteDatabase(path);

    print("Database deleted successfully!");
  }
}
