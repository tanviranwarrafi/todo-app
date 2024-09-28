import 'dart:async';

import 'package:app/models/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  Database? _database;

  Future<void> openDb() async {
    if (_database != null) return;
    var query = 'CREATE TABLE tasks(id INTEGER PRIMARY KEY autoincrement, title TEXT, description TEXT, date TEXT, status INTEGER)';
    _database = await openDatabase(join(await getDatabasesPath(), 'ss.db'), version: 1, onCreate: (db, version) => db.execute(query));
  }

  Future<int> insertTask(Task task) async {
    await openDb();
    return _database!.insert('tasks', task.toMap());
  }

  Future<int> updateTask(Task task) async {
    await openDb();
    return _database!.update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int> updateTaskStatus(int id) async {
    await openDb();
    return _database!.rawUpdate('''UPDATE tasks SET status = ? WHERE id = ? ''', [1, id]);
  }

  Future<void> deleteTask(int id) async {
    await openDb();
    await _database!.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Task>> fetchPendingTasks() async {
    await openDb();
    List<Map<String, dynamic>> mapList = await _database!.rawQuery('SELECT * FROM tasks WHERE status = 0');
    return mapList.isEmpty ? [] : _renderTaskList(mapList);
  }

  Future<List<Task>> fetchCompletedTasks() async {
    await openDb();
    List<Map<String, dynamic>> mapList = await _database!.rawQuery('SELECT * FROM tasks WHERE status = 1');
    return mapList.isEmpty ? [] : _renderTaskList(mapList);
  }

  Future<List<Task>> fetchTaskList() async {
    await openDb();
    List<Map<String, dynamic>> mapList = await _database!.query('tasks');
    return mapList.isEmpty ? [] : _renderTaskList(mapList);
  }

  List<Task> _renderTaskList(List<Map<String, dynamic>> mapList) {
    List<Task> taskList = [];
    mapList.forEach((item) {
      var task = Task(id: item['id'], title: item['title'], description: item['description'], date: item['date'], status: item['status']);
      taskList.add(task);
    });
    return taskList;
  }
}
