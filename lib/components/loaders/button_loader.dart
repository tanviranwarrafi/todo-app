import 'package:app/themes/colors.dart';
import 'package:flutter/material.dart';

class ButtonLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(color: offWhite1, backgroundColor: offWhite3, strokeWidth: 3),
    );
  }
}
