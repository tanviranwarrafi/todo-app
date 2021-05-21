import 'package:digittodoapp/models/db_manager.dart';
import 'package:digittodoapp/models/task.dart';
import 'package:digittodoapp/screens/all-task-screen.dart';
import 'package:digittodoapp/screens/home-screen.dart';
import 'package:digittodoapp/widgets/todo_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/header.dart';

class CompletedTask extends StatefulWidget {
  @override
  _CompletedTaskState createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  final DbManager dbManager = new DbManager();
  List<Task> taskList = List();
  int selectedIndex = 1;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void setState(fn) {
    if (!mounted) {
      return;
    }
    super.setState(fn);
  }

  void onTapped(int value) {
    setState(() => selectedIndex = value);
    if (selectedIndex == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else if (selectedIndex == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AllTask()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/bg.png')),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(),
            TodoList(taskList: taskList, taskType: 1),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        selectedFontSize: 15,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse, size: 30.0),
            title: Text('Pending', style: TextStyle(color: Colors.black)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box, size: 30.0),
            title: Text('Completed', style: TextStyle(color: Colors.black)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list, size: 30.0),
            title: Text('All', style: TextStyle(color: Colors.black)),
          ),
        ],
        onTap: onTapped,
      ),
    );
  }

  loadData() async {
    List<Task> tasks = [];
    List maps = await dbManager.getCompletedTasks();
    List.generate(maps.length, (i) {
      Task taskModel = Task(
          id: maps[i]['id'],
          title: maps[i]['title'],
          description: maps[i]['description'],
          date: maps[i]['date'],
          status: maps[i]['status']);
      tasks.add(taskModel);
    });

    setState(() {
      taskList.clear();
      taskList.addAll(tasks);
    });
  }
}
