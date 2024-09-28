import 'package:app/components/loaders/screen_loader.dart';
import 'package:app/themes/colors.dart';
import 'package:flutter/material.dart';

class PositionedLoader extends StatelessWidget {
  final double gap;
  final double radius;
  final Color background;
  PositionedLoader({this.gap = 0, this.radius = 0, this.background = offWhite2});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: ScreenLoader(gap: gap, radius: radius, background: background),
    );
  }
}
