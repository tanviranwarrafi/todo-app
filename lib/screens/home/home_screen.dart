import 'package:app/screens/new_task/insert_task_screen.dart';
import 'package:app/screens/task/all_task_screen.dart';
import 'package:app/screens/task/completed_task_screen.dart';
import 'package:app/screens/task/pending_task_screen.dart';
import 'package:app/themes/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _index = 0;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void setState(fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Text(_label),
      ),
      body: Builder(
        builder: (context) {
          if (_index == 1) {
            return PendingTaskScreen();
          } else if (_index == 2) {
            return CompletedTask();
          } else {
            return AllTask();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        elevation: 1,
        tooltip: 'New Todo',
        backgroundColor: primary,
        child: const Icon(Icons.add, color: white, size: 24),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InsertNewTask())),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: primary,
        unselectedItemColor: offWhite4,
        selectedItemColor: white,
        iconSize: 22,
        unselectedFontSize: 14,
        currentIndex: _index,
        onTap: (value) => setState(() => _index = value),
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(label: 'Pending', icon: Icon(Icons.timelapse)),
          BottomNavigationBarItem(label: 'Completed', icon: Icon(Icons.check_box)),
        ],
      ),
    );
  }

  String get _label {
    if (_index == 1) {
      return 'Pending Tasks';
    } else if (_index == 2) {
      return 'Completed Tasks';
    } else {
      return 'All Tasks';
    }
  }
}
