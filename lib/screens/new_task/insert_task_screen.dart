import 'dart:async';

import 'package:app/components/buttons/elevate_button.dart';
import 'package:app/constants/date_formats.dart';
import 'package:app/di.dart';
import 'package:app/extensions/flutter_ext.dart';
import 'package:app/libraries/formatters.dart';
import 'package:app/libraries/toasts_popups.dart';
import 'package:app/models/task.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/service/db_manager.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/utils/keys.dart';
import 'package:app/widgets/core/input_field.dart';
import 'package:app/widgets/ui/nav_button_box.dart';
import 'package:flutter/material.dart';

class InsertNewTask extends StatefulWidget {
  @override
  _InsertNewTaskState createState() => _InsertNewTaskState();
}

class _InsertNewTaskState extends State<InsertNewTask> {
  var dbManager = DbManager();
  var formKey = GlobalKey<FormState>();
  var _title = TextEditingController();
  var _description = TextEditingController();
  var _datePicker = TextEditingController();

  // final format = DateFormat('yyyy-MM-dd');
  bool isButtonDisabled = true;

  void addTask() {
    Task task = Task(
      id: DateTime.now().millisecondsSinceEpoch,
      title: _title.text,
      description: _description.text,
      date: _datePicker.text,
      status: 0,
    );
    dbManager.insertTask(task).then((id) => {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var icon = const Icon(Icons.arrow_back, color: grey3);
    var pad = const EdgeInsets.symmetric(horizontal: 24);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: const Text('Add New Task'),
        leading: IconButton(onPressed: Navigator.of(context).pop, icon: icon),
      ),
      bottomNavigationBar: NavButtonBox(child: ElevateButton(height: 46, label: 'Add Task', onTap: _onAddTask)),
      body: Container(width: size.width, height: size.height, child: _screenView(context), padding: pad),
    );
  }

  Widget _screenView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        Text('Task Title', style: TextStyles.text15_400.copyWith(color: dark)),
        const SizedBox(height: 06),
        InputField(
          controller: _title,
          hintText: 'Write your task title',
        ),
        const SizedBox(height: 16),
        Text('Task Description', style: TextStyles.text15_400.copyWith(color: dark)),
        const SizedBox(height: 06),
        InputField(
          minLines: 3,
          maxLines: 5,
          controller: _description,
          hintText: 'Write your task description',
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Future<void> _onAddTask() async {
    if (_title.text.isEmpty) return ToastPopup.onWarning(message: 'Please write your task title', isTop: true);
    if (_description.text.isEmpty) return ToastPopup.onWarning(message: 'Please write your task description', isTop: true);
    var id = currentDate.millisecondsSinceEpoch;
    var date = sl<Formatters>().formatDate(DATE_FORMAT_4, '$currentDate');
    var task = Task(id: id, title: _title.text, description: _description.text, date: date, status: 0);
    await dbManager.insertTask(task);
    var context = navigatorKey.currentState!.context;
    unawaited(Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }
}
