import 'package:app/constants/date_formats.dart';
import 'package:app/di.dart';
import 'package:app/libraries/formatters.dart';
import 'package:app/models/task.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/text_styles.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final int taskType;
  final List<Task> taskList;
  final Function(int)? onComplete;
  final Function(int)? onDelete;
  TaskList({this.onComplete, this.onDelete, this.taskList = const [], this.taskType = 0});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      clipBehavior: Clip.antiAlias,
      itemCount: taskList.length,
      itemBuilder: _taskItemCard,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
    );
  }

  Widget _taskItemCard(BuildContext context, int index) {
    var task = taskList[index];
    var popupList = [if (task.status == 0) 'Complete', 'Delete'];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: EdgeInsets.only(bottom: index == taskList.length - 1 ? 24 : 10),
      decoration: BoxDecoration(
        color: primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(08),
        border: Border.all(color: primary.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.task_alt, color: grey3, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title, style: TextStyles.text15_500.copyWith(color: dark)),
                const SizedBox(height: 02),
                Text(task.description, style: TextStyles.text14_400.copyWith(color: dark)),
                const SizedBox(height: 08),
                Text(sl<Formatters>().formatDate(DATE_FORMAT_14, task.date), style: TextStyles.text13_500.copyWith(color: grey2)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          PopupMenuButton(
            offset: const Offset(0, 40),
            elevation: 5,
            child: const Icon(Icons.more_vert, color: grey3, size: 24),
            onSelected: (value) => _onPopup(value, index),
            itemBuilder: (context) => List.generate(popupList.length, (index) => _popupItem(popupList[index])).toList(),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _popupItem(String item) => PopupMenuItem(value: item, child: Text(item));

  void _onPopup(String value, int index) {
    if (value == 'Complete') {
      if (onComplete != null) onComplete!(index);
    } else {
      if (onDelete != null) onDelete!(index);
    }
  }
}
