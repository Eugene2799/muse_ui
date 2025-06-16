import 'package:flutter/material.dart';

class Utils {
  static List<Widget> getLRList(Widget left, double gap, Widget right) {
    return gap == 0.0
        ? <Widget>[left, right]
        : <Widget>[left, SizedBox(width: gap), right];
  }

  static WidgetStateProperty<Color?> getColorPressed(Color color) {
    return WidgetStateProperty.resolveWith<Color?>((states) {
      return states.contains(WidgetState.pressed)
          ? color.withAlpha(55)
          : color;
    });
  }
}
