import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Meaasge.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('messages.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE messages (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      body TEXT NOT NULL,
      isRead INTEGER NOT NULL
    )
    ''');
  }

  Future<void> insertMessage(MessageFcm message) async {
    final db = await instance.database;
    await db.insert('messages', message.toMap());
  }

  Future<List<MessageFcm>> fetchAllMessages() async {
    final db = await instance.database;
    final result = await db.query('messages');

    return result.map((json) => MessageFcm.fromMap(json)).toList();
  }

  Future<void> deleteMessage(int id) async {
    final db = await instance.database;
    await db.delete('messages', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> markMessageAsRead(int id) async {
    final db = await instance.database;
    await db.update('messages', {'isRead': 1}, where: 'id = ?', whereArgs: [id]);
  }
}