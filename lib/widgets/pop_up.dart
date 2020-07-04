import 'package:digittodoapp/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showSimpleDialog(BuildContext context, Task task) {
  SimpleDialog simpleDialog = SimpleDialog(
    title: Text(task.title),
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              task.status == 1 ? 'Completed' : 'Pending', 
              style: TextStyle(
                color: task.status == 1 ? Colors.green[300] : Colors.orange[200]
              ),
            ),
            SizedBox(height: 15,),
            Text('Deadline: ${task.date}'),
            SizedBox(height: 15,),
            Text(task.description)
          ],
        ),
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return simpleDialog;
    },
  );
}
