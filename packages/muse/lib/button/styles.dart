import 'package:flutter/material.dart';
import 'package:muse_ui/button/types.dart';

ButtonStyle normalBtnStyle(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  return ButtonStyle(
    iconAlignment: icon?.position,
    iconColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return style.colors.fontColor.withAlpha(55); // 按下时的颜色
      }
      return style.colors.fontColor; // 默认背景色
    }),
    padding: WidgetStateProperty.all(EdgeInsets.all(20)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(style.borderType.radius),
        side: BorderSide(
          color: style.colors.borderColor,
          width: style.hairline ? 0.5 : 1.0,
        ), // 设置边框颜色和宽度
      ),
    ),
    textStyle: WidgetStateProperty.all(TextStyle(fontSize: style.size.size)),
    foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return style.colors.fontColor.withAlpha(55); // 按下时的颜色
      }
      return style.colors.fontColor;
    }),
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return style.colors.bgColor.withAlpha(55); // 按下时的颜色
      }
      return style.colors.bgColor;
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
      if (states.contains(WidgetState.pressed)) {
        return style.colors.fontColor.withAlpha(55); // 按下时的颜色
      }
      return style.colors.fontColor; // 默认背景色
    }),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    ),
    textStyle: WidgetStateProperty.all(TextStyle(fontSize: style.size.size)),
    foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return style.colors.fontColor.withAlpha(55); // 按下时的颜色
      }
      return style.colors.fontColor;
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
      if (states.contains(WidgetState.pressed)) {
        return style.colors.fontColor.withAlpha(55); // 按下时的颜色
      }
      return style.colors.fontColor; // 默认背景色
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
      if (states.contains(WidgetState.pressed)) {
        return style.colors.fontColor.withAlpha(55); // 按下时的颜色
      }
      return style.colors.fontColor;
    }),
  );
}
