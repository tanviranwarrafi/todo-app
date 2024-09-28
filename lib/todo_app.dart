import 'package:app/constants/app_constants.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/themes/colors.dart';
import 'package:app/utils/keys.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: primary,
      title: APP_NAME,
      home: HomeScreen(),
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
