import 'package:flutter/material.dart';
import 'package:muse_ui/button/types.dart';

import 'icon_text_button.dart';

class MuseButton extends StatefulWidget {
  const MuseButton({
    super.key,
    this.text,
    this.icon,
    this.type = ButtonType.normal,
    this.size = ButtonSize.normal,
    this.nativeType = ButtonNativeType.normal,
    this.borderType = ButtonBorderType.normal,
    this.colors,
    this.loading = false,
    this.hairline = false,
    this.disabled = false,
    this.autofocus = false,
    this.iconPrefix,
    this.loadingType = LoadingType.circular,
    this.iconPosition = IconAlignment.start,
    this.iconGap,
    this.click,
    this.longPress,
    this.slot,
  });

  final String? text;
  final IconData? icon;
  final ButtonType type;
  final ButtonSize size;
  final ButtonNativeType nativeType;
  final ButtonBorderType borderType;
  final ButtonColors? colors;
  final bool loading;
  final bool hairline;
  final bool disabled;
  final bool autofocus;
  final IconData? iconPrefix;
  final LoadingType loadingType;
  final IconAlignment iconPosition;
  final double? iconGap;

  final VoidCallback? click;
  final VoidCallback? longPress;
  final Widget? slot;

  @override
  State<StatefulWidget> createState() => _MuseButtonState();
}

class _MuseButtonState extends State<MuseButton> {
  ButtonIconStates? iconStates;

  IconData? getIconData() {
    if (widget.icon != null) return widget.icon!;
    if (widget.iconPrefix != null) return widget.iconPrefix!;
    if (widget.loading) return Icons.downloading;
    return null;
  }

  ButtonColors getColor(Color fontColor, Color bgColor, Color borderColor) {
    bool isNormal = widget.type == ButtonType.normal;
    Color realFontColor = fontColor;
    Color realBgColor = bgColor;
    if (isNormal) realFontColor = Color(0xFF969799);
    if (isNormal && widget.nativeType == ButtonNativeType.normal) {
      realBgColor = Color(0xFFFFFFFF);
    }

    if (widget.disabled) {
      return (
        fontColor: realFontColor.withAlpha(128),
        bgColor: realBgColor.withAlpha(128),
        borderColor: borderColor.withAlpha(128),
      );
    } else {
      return (
        fontColor: realFontColor,
        bgColor: realBgColor,
        borderColor: borderColor,
      );
    }
  }

  ButtonColors getButtonColors() {
    if (widget.colors != null) return widget.colors!;
    switch (widget.nativeType) {
      case ButtonNativeType.normal:
        return getColor(
          Color(0xFFFFFFFF),
          widget.type.color,
          widget.type.color,
        );
      case ButtonNativeType.plain:
        return getColor(
          widget.type.color,
          Color(0xFFFFFFFF),
          widget.type.color,
        );
      case ButtonNativeType.text:
        return getColor(
          widget.type.color,
          Color(0x00FFFFFF),
          Color(0x00FFFFFF),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final IconData? iconData = getIconData();
    final ButtonStates state = (
      text: widget.text,
      type: widget.type,
      loading: widget.loading,
      disabled: widget.disabled,
      autofocus: widget.autofocus,
      click: widget.disabled ? null : widget.click,
      longPress: widget.disabled ? null : widget.longPress,
      slot: widget.slot,
    );

    final ButtonStyles style = (
      size: widget.size,
      colors: getButtonColors(),
      borderType: widget.borderType,
      hairline: widget.hairline,
    );

    if (iconData != null) {
      iconStates = (
        icon: iconData,
        position: widget.iconPosition,
        gap: widget.iconGap,
      );
    }
    switch (widget.nativeType) {
      case ButtonNativeType.normal:
        return _normalButton(state, style, iconStates);
      case ButtonNativeType.plain:
        return _plainButton(state, style, iconStates);
      case ButtonNativeType.text:
        return _textButton(state, style, iconStates);
    }
  }
}

Widget? _getButtonChild(ButtonStates state, ButtonStyles style) {
  if (state.slot != null) return state.slot!;
  if (state.text != null) return Text(state.text!);
  return null;
}

Widget _normalButton(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  ButtonStyle bs = ButtonStyle(
    iconAlignment: icon?.position,
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

  return ElevatedButton.icon(
    style: bs,
    icon:
        icon == null
            ? null
            : Icon(
              icon.icon,
              size: style.size.size,
              color: style.colors.fontColor,
            ),
    onPressed: state.click,
    onLongPress: state.longPress,
    label: _getButtonChild(state, style) ?? Text(''),
  );
}

Widget _textButton(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  ButtonStyle bs = ButtonStyle(
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
    iconColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return style.colors.fontColor.withAlpha(55); // 按下时的颜色
      }
      return style.colors.fontColor; // 默认背景色
    }),
  );
  if (icon == null) {
    return TextButton(
      style: bs,
      onPressed: state.click,
      onLongPress: state.longPress,
      child: _getButtonChild(state, style)!,
    );
  } else {
    return IconTextButton(
      style: bs,
      iconAlignment: icon.position,
      gap: icon.gap,
      icon: Icon(
        icon.icon,
        size: style.size.size,
        color: style.colors.fontColor,
      ),
      onPressed: state.click,
      onLongPress: state.longPress,
      label: _getButtonChild(state, style),
    );
  }
}

Widget _plainButton(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  ButtonStyle bs = ButtonStyle(
    iconAlignment: icon?.position,
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

  return OutlinedButton.icon(
    style: bs,
    icon:
        icon == null
            ? null
            : Icon(
              icon.icon,
              size: style.size.size,
              color: style.colors.fontColor,
            ),
    onPressed: state.click,
    onLongPress: state.longPress,
    label: _getButtonChild(state, style) ?? Text(''),
  );
}
