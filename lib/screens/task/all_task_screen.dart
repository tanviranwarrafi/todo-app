import 'package:app/components/loaders/screen_loader.dart';
import 'package:app/models/task.dart';
import 'package:app/screens/task/components/task_list.dart';
import 'package:app/service/db_manager.dart';
import 'package:app/widgets/error/not_found.dart';
import 'package:flutter/material.dart';

class AllTask extends StatefulWidget {
  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  var _loader = true;
  var _taskList = <Task>[];
  var _dbManager = DbManager();

  @override
  void initState() {
    super.initState();
    fetchTaskList();
  }

  Future<void> fetchTaskList() async {
    _taskList.clear();
    _taskList = await _dbManager.fetchTaskList();
    _loader = false;
    setState(() {});
  }

  @override
  void setState(fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    if (_loader) return ScreenLoader();
    return _taskList.isEmpty ? NotFound() : TaskList(taskList: _taskList, taskType: 1, onComplete: _onComplete, onDelete: _onDelete);
  }

  Future<void> _onComplete(int index) async {
    var task = _taskList[index];
    await _dbManager.updateTaskStatus(task.id);
    _taskList[index].status = 1;
    setState(() {});
  }

  Future<void> _onDelete(int index) async {
    var task = _taskList[index];
    await _dbManager.deleteTask(task.id);
    _taskList.removeAt(index);
    setState(() {});
  }
}
