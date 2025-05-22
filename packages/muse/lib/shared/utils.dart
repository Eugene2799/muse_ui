import 'package:flutter/material.dart';

class Utils {
  static List<Widget> getLRList(Widget left, double gap, Widget right) {
    return gap == 0.0
        ? <Widget>[left, right]
        : <Widget>[left, SizedBox(width: gap), right];
  }
}
