import 'package:app/themes/colors.dart';
import 'package:flutter/material.dart';

class LoaderBox extends StatelessWidget {
  final Size boxSize;
  final Widget child;
  final Color background;
  final Color border;
  final double radius;

  LoaderBox({
    required this.child,
    this.boxSize = const Size(48, 48),
    this.background = transparent,
    this.border = transparent,
    this.radius = 04,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: child),
      width: boxSize.width,
      height: boxSize.height,
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: border),
      ),
    );
  }
}
