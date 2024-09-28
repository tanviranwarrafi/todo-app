import 'dart:io';

import 'package:app/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenLoader extends StatelessWidget {
  final double gap;
  final double radius;
  final Color background;
  ScreenLoader({this.gap = 0, this.radius = 0, this.background = offWhite1});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: background.withOpacity(0.6), borderRadius: BorderRadius.circular(radius)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [_loader(context), SizedBox(height: gap)]),
    );
  }

  Widget _loader(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoActivityIndicator(color: primary, radius: 20);
    } else {
      var circleLoader = CircularProgressIndicator(color: primary, backgroundColor: primary.withOpacity(0.3));
      return SizedBox(height: 36, width: 36, child: circleLoader);
    }
  }
}
