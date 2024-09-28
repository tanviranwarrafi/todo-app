import 'package:app/models/task.dart';
import 'package:flutter/material.dart';

showSimpleDialog(BuildContext context, Task task) {
  SimpleDialog simpleDialog = SimpleDialog(
    title: Text(task.title),
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              task.status == 1 ? 'Completed' : 'Pending',
              style: TextStyle(color: task.status == 1 ? Colors.green[300] : Colors.orange[200]),
            ),
            const SizedBox(height: 15),
            Text('Deadline: ${task.date}'),
            const SizedBox(height: 15),
            Text(task.description)
          ],
        ),
      ),
    ],
  );

  // show the dialog
  showDialog(context: context, builder: (context) => simpleDialog);
}
