import 'package:flutter/material.dart';
import 'default.dart';

class Utils {
  static List<Widget> getLRList(Widget left, double gap, Widget right) {
    return gap == 0.0
        ? <Widget>[left, right]
        : <Widget>[left, SizedBox(width: gap), right];
  }

  static Widget? horizontalRow(
    Widget? w1,
    Widget? w2, {
    MainAxisAlignment axisAlignment = MainAxisAlignment.start,
  }) {
    if (w1 != null && w2 != null) {
      return Row(mainAxisAlignment: axisAlignment, children: [w1, w2]);
    } else {
      return w1 ?? w2;
    }
  }

  static Widget? renderText(
    Widget? slotWidget,
    String? text,
    AlignmentGeometry alignment,
    TextStyle? textStyle,
  ) {
    return slotWidget ??
        (text != null
            ? Align(
              alignment: alignment,
              child: Text(text, style: textStyle, textAlign: Default.textAlign),
            )
            : null);
  }

  static WidgetStateProperty<Color?> getColorPressed(Color color) {
    return WidgetStateProperty.resolveWith<Color?>((states) {
      return states.contains(WidgetState.pressed)
          ? color.withAlpha(Default.alphaPressed)
          : color;
    });
  }
}
