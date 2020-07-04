import 'package:digittodoapp/models/db_manager.dart';
import 'package:digittodoapp/models/task.dart';
import 'package:digittodoapp/widgets/pop_up.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final List<Task> taskList;
  final int taskType;

  TodoList({this.taskList, this.taskType});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DbManager dbManager = new DbManager();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.taskList.length,
            itemBuilder: (BuildContext context, int index) {
              final Task task = widget.taskList[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  dbManager.deleteTask(task.id);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: InkWell(
                    onLongPress: () {
                      showSimpleDialog(context, task);
                    },
                    child: ListTile(
                      title: Text(
                        task.title,
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        task.date,
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Checkbox(
                          value: task.status == 1 ? true : false,
                          activeColor: task.status == 1
                              ? Colors.green[300]
                              : Colors.orange[200],
                          onChanged: (newValue) async {
                            if (task.status != 1 && widget.taskType != 1) {
                              await dbManager.updateTaskStatus(task.id);
                              setState(() {
                                if (widget.taskType == 2) {
                                  task.status = 1;
                                } else {
                                  widget.taskList.removeAt(index);
                                }
                              });
                            }
                          }),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
