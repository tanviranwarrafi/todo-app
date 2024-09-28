import 'dart:io';

import 'package:app/themes/colors.dart';
import 'package:flutter/material.dart';

class NavButtonBox extends StatelessWidget {
  final bool loader;
  final Widget? child;
  final double padding;
  final Color background;

  const NavButtonBox({this.child, this.loader = false, this.background = offWhite1, this.padding = 20});

  @override
  Widget build(BuildContext context) {
    var top = child == null ? 0.0 : 16.0;
    var bottom = Platform.isIOS ? 24.0 : 16.0;
    return Opacity(
      opacity: loader ? 0.7 : 1,
      child: Container(
        child: child,
        width: double.infinity,
        decoration: BoxDecoration(color: background),
        padding: EdgeInsets.only(left: 24, right: 24, top: top, bottom: bottom),
      ),
    );
  }
}
