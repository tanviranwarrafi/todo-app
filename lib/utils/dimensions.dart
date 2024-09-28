import 'package:flutter/material.dart';

abstract class Dimensions {
  // static double dialog_width = SizeConfig.width - 48;
  static double dialog_padding = 24;
  static double leading_width = 56;
  static double screen_padding = 20;
}

/// Radius
var _RADIUS_16 = const Radius.circular(16);
var SHEET_RADIUS = BorderRadius.only(topLeft: _RADIUS_16, topRight: _RADIUS_16);
var DIALOG_RADIUS = BorderRadius.circular(20);

/// SHAPE
var DIALOG_SHAPE = RoundedRectangleBorder(borderRadius: DIALOG_RADIUS);
var BOTTOM_SHEET_SHAPE = RoundedRectangleBorder(borderRadius: SHEET_RADIUS);
var TOAST_SHAPE = RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));

/// Durations
var DIALOG_DURATION = const Duration(milliseconds: 700);
var POP_DURATION = const Duration(milliseconds: 300);

/// Sizes
var ACTION_SIZE = 20.0;
var DIALOG_PADDING = 24.0;
// var dialogWidth = SizeConfig.width - 48;
