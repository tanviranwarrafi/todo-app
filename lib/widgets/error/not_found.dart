import 'package:app/themes/colors.dart';
import 'package:app/themes/text_styles.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 150),
          Icon(Icons.task, color: dark.withOpacity(0.8), size: 80),
          const SizedBox(height: 08),
          Text('No Task Available', style: TextStyles.text18_500.copyWith(color: dark)),
        ],
      ),
    );
  }
}
