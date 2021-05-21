import 'package:digittodoapp/screens/home-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(primarySwatch: Colors.grey, canvasColor: Colors.white),
      home: HomeScreen(title: 'Todo'),
    );
  }
}
