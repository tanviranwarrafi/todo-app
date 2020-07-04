import 'package:digittodoapp/main.dart';
import 'package:digittodoapp/models/db_manager.dart';
import 'package:digittodoapp/models/task.dart';
import 'package:digittodoapp/screens/completed.dart';
import 'package:digittodoapp/widgets/todo_list.dart';
import 'package:flutter/material.dart';
import '../widgets/header.dart';
import 'package:flutter/cupertino.dart';

class AllTask extends StatefulWidget {
  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  final DbManager dbManager = new DbManager();
  List<Task> taskList = List();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void setState(fn) {
    if (!mounted) {
      return;
    }
    super.setState(fn);
  }

  int _selectedIndex = 2;

  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });

    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CompletedTask()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Header(),
            TodoList(taskList: taskList, taskType: 2),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/bg.png'),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        selectedFontSize: 15,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timelapse,
              size: 30.0,
            ),
            title: Text(
              'Pending',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_box,
              size: 30.0,
            ),
            title: Text(
              'Completed',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.featured_play_list,
              size: 30.0,
            ),
            title: Text(
              'All',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
        onTap: onTapped,
      ),
    );
  }

  loadData() async {
    List<Task> tasks = [];
    List maps = await dbManager.getAllTasks();
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
