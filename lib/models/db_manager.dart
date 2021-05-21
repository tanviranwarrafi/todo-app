import 'dart:async';

import 'package:digittodoapp/models/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  Database _database;

  List<Task> todoList = [];

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(join(await getDatabasesPath(), "ss.db"), version: 1, onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY autoincrement, title TEXT, description TEXT, date TEXT, status INTEGER)",
        );
      });
    }
  }

  Future<int> insertTask(Task task) async {
    await openDb();
    return await _database.insert('tasks', task.toMap());
  }

  Future<List> getPendingTasks() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.rawQuery('SELECT * FROM tasks WHERE status = 0');
    return maps;
  }

  Future<List> getCompletedTasks() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.rawQuery('SELECT * FROM tasks WHERE status = 1');
    return maps;
  }

  Future<List> getAllTasks() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('tasks');
    return maps;
  }

  Future<int> updateTask(Task task) async {
    await openDb();
    return await _database.update('tasks', task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }

  Future<int> updateTaskStatus(int id) async {
    await openDb();
    return await _database.rawUpdate('''UPDATE tasks SET status = ? WHERE id = ? ''', [1, id]);
  }

  Future<void> deleteTask(int id) async {
    await openDb();
    await _database.delete('tasks', where: "id = ?", whereArgs: [id]);
  }
}
