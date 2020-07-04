import 'package:digittodoapp/models/db_manager.dart';
import 'package:digittodoapp/models/task.dart';
import 'package:digittodoapp/screens/all_tasks.dart';
import 'package:digittodoapp/screens/completed.dart';
import 'package:digittodoapp/screens/insert.dart';
import 'package:digittodoapp/widgets/header.dart';
import 'package:digittodoapp/widgets/todo_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        canvasColor: Colors.white,
      ),
      home: MyHomePage(title: 'Todo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  int _selectedIndex = 0;
  final mainKey = GlobalKey<ScaffoldState>();

  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CompletedTask()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllTask()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainKey,
      body: Container(
        child: Column(
          children: <Widget>[
            Header(),
            TodoList(taskList: taskList, taskType: 0),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/bg.png'),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 40.0,
        width: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InserNewTask()),
            );
          },
          tooltip: 'New Todo',
          backgroundColor: Colors.grey[350],
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
    List maps = await dbManager.getPendingTasks();
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
