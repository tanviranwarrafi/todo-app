import 'package:app/extensions/flutter_ext.dart';
import 'package:app/themes/colors.dart';
import 'package:flutter/material.dart';

extension ParseStrngs1 on String {
  DateTime get parseDate => DateTime.parse(this);
  String get removeHtml => replaceAll(RegExp('<[^>]*>', multiLine: true), '');
}

extension ParseStrngs2 on String? {
  int get stringToInt => this == null ? 0 : int.parse(this!);
  double get parseDouble => this == null ? 0 : double.parse(this!);
}

extension ParseStrngs3 on String? {
  String get trim => this == null ? '' : this!.trim();
  String get toLower => this == null ? '' : this!.toLowerCase();
  String get toUpper => this == null ? '' : this!.toUpperCase();
  String get toKey => this == null ? '' : this!.trim().toLower;
  String get name_initial => this != null && this!.isNotEmpty ? this!.substring(0, 1).toUpper : '';
}

extension ParseStrngs4 on String? {
  DateTime get dateToKey => this == null ? currentDate : this!.parseDate;
  bool get isCurrentDay => this == null ? true : DateUtils.isSameDay(this!.parseDate, currentDate);
}

extension ParseString4 on String? {
  Color get background_color {
    var primary_color = primary.withOpacity(0.2);
    if (this == null) return primary_color;
    if (this!.isEmpty || this!.length != 1 || !RegExp(r'^[A-Z]$').hasMatch(this!)) return primary_color;
    switch (this!.toUpper) {
      case 'A':
      case 'B':
      case 'C':
      case 'D':
        return initial_AD;
      case 'E':
      case 'F':
      case 'G':
      case 'H':
        return initial_EH;
      case 'I':
      case 'J':
      case 'K':
      case 'L':
        return initial_IL;
      case 'M':
      case 'N':
      case 'O':
      case 'P':
        return initial_MP;
      case 'Q':
      case 'R':
      case 'S':
      case 'T':
        return initial_QT;
      case 'U':
      case 'V':
      case 'W':
        return initial_UW;
      case 'X':
      case 'Y':
      case 'Z':
        return initial_XZ;
      default:
        return primary_color;
    }
  }
}
