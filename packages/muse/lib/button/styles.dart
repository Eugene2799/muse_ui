import 'package:flutter/material.dart';
import 'package:muse_ui/button/types.dart';

Color? _getPressedColor(Color color) {
  return color.withAlpha(55);
}

ButtonStyle normalBtnStyle(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  return ButtonStyle(
    iconAlignment: icon?.position,
    iconColor: WidgetStateProperty.resolveWith<Color?>((states) {
      return states.contains(WidgetState.pressed)
          ? _getPressedColor(style.colors.fontColor)
          : style.colors.fontColor;
    }),
    padding: WidgetStateProperty.all(EdgeInsets.all(20)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(style.borderType.radius),
        side: BorderSide(
          color: style.colors.borderColor,
          width: style.hairline ? 0.5 : 1.0,
        ),
      ),
    ),
    textStyle: WidgetStateProperty.all(TextStyle(fontSize: style.size.size)),
    foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      return states.contains(WidgetState.pressed)
          ? _getPressedColor(style.colors.fontColor)
          : style.colors.fontColor;
    }),
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      return states.contains(WidgetState.pressed)
          ? _getPressedColor(style.colors.bgColor)
          : style.colors.bgColor;
    }),
  );
}

ButtonStyle textBtnStyle(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  return ButtonStyle(
    iconAlignment: icon?.position,
    iconColor: WidgetStateProperty.resolveWith<Color?>((states) {
      return states.contains(WidgetState.pressed)
          ? _getPressedColor(style.colors.fontColor)
          : style.colors.fontColor;
    }),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    ),
    textStyle: WidgetStateProperty.all(TextStyle(fontSize: style.size.size)),
    foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      return states.contains(WidgetState.pressed)
          ? _getPressedColor(style.colors.fontColor)
          : style.colors.fontColor;
    }),
  );
}

ButtonStyle plainBtnStyle(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  return ButtonStyle(
    iconAlignment: icon?.position,
    iconColor: WidgetStateProperty.resolveWith<Color?>((states) {
      return states.contains(WidgetState.pressed)
          ? _getPressedColor(style.colors.fontColor)
          : style.colors.fontColor;
    }),
    padding: WidgetStateProperty.all(EdgeInsets.all(20)),
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
    textStyle: WidgetStateProperty.all(TextStyle(fontSize: style.size.size)),
    foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      return states.contains(WidgetState.pressed)
          ? _getPressedColor(style.colors.fontColor)
          : style.colors.fontColor;
    }),
  );
}
