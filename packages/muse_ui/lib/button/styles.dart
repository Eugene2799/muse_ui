import 'package:flutter/material.dart';
import 'package:muse_ui/button/types.dart';

const double defaultGap = 4.0;

ButtonStyle _baseBtnStyle(ButtonStyles style) {
  return ButtonStyle(
    iconAlignment: style.iconPosition,
    iconColor: _getColorProperty(style.colors.fontColor),
    padding: WidgetStateProperty.all(style.size.padding),
    textStyle: WidgetStateProperty.all(TextStyle(fontSize: style.size.size)),
    foregroundColor: _getColorProperty(style.colors.fontColor),
  );
}

ButtonStyle normalBtnStyle(ButtonStyles style) {
  return _baseBtnStyle(style).copyWith(
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(style.borderType.radius),
        side: BorderSide(
          color: style.colors.borderColor,
          width: style.hairline ? 0.5 : 1.0,
        ),
      ),
    ),
    backgroundColor: _getColorProperty(style.colors.bgColor),
  );
}

ButtonStyle textBtnStyle(ButtonStyles style) {
  return _baseBtnStyle(
    style,
  ).copyWith(overlayColor: WidgetStateProperty.all(Colors.transparent));
}

ButtonStyle plainBtnStyle(ButtonStyles style) {
  return _baseBtnStyle(style).copyWith(
    side: WidgetStateProperty.all<BorderSide>(
      BorderSide(
        color: style.colors.borderColor,
        width: style.hairline ? 0.5 : 1.0,
      ),
    ),
    shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(style.borderType.radius),
      ),
    ),
  );
}

Color? _getPressedColor(Color color) {
  return color.withAlpha(55);
}

WidgetStateProperty<Color?> _getColorProperty(Color color) {
  return WidgetStateProperty.resolveWith<Color?>((states) {
    return states.contains(WidgetState.pressed)
        ? _getPressedColor(color)
        : color;
  });
}
