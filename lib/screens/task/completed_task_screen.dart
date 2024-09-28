import 'package:app/components/loaders/screen_loader.dart';
import 'package:app/models/task.dart';
import 'package:app/screens/task/components/task_list.dart';
import 'package:app/service/db_manager.dart';
import 'package:app/widgets/error/not_found.dart';
import 'package:flutter/material.dart';

class CompletedTask extends StatefulWidget {
  @override
  _CompletedTaskState createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  var _loader = true;
  var _taskList = <Task>[];
  var _dbManager = DbManager();

  @override
  void initState() {
    fetchCompletedTasks();
    super.initState();
  }

  @override
  void setState(fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  Future<void> fetchCompletedTasks() async {
    _taskList.clear();
    _taskList = await _dbManager.fetchCompletedTasks();
    _loader = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_loader) return ScreenLoader();
    return _taskList.isEmpty ? NotFound() : TaskList(taskList: _taskList, taskType: 1, onDelete: _onDelete);
  }

  Future<void> _onDelete(int index) async {
    var task = _taskList[index];
    await _dbManager.deleteTask(task.id);
    _taskList.removeAt(index);
    setState(() {});
  }
}
