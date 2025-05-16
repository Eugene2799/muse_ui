import 'package:flutter/material.dart';
import 'package:muse_ui/button/styles.dart';
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
    this.hairline = false,
    this.disabled = false,
    this.autofocus = false,
    this.iconPrefix,
    this.iconPosition = IconAlignment.start,
    this.iconGap,
    this.click,
    this.longPress,
    this.slot,
  });

  final String? text;
  final IconData? icon;
  final IconData? iconPrefix;
  final ButtonType type;
  final ButtonSize size;
  final ButtonNativeType nativeType;
  final ButtonBorderType borderType;
  final ButtonColors? colors;
  final bool hairline;
  final bool disabled;
  final bool autofocus;
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
    return widget.icon ?? widget.iconPrefix;
  }

  ButtonColors getColor(Color font, Color bg, Color border) {
    bool isNormal = widget.type == ButtonType.normal;
    Color fontColor = isNormal ? const Color(0xFF969799) : font;
    Color bgColor =
        isNormal && widget.nativeType == ButtonNativeType.normal
            ? Colors.white
            : bg;
    int alpha = widget.disabled ? 128 : 255;
    return (
      fontColor: fontColor.withAlpha(alpha),
      bgColor: bgColor.withAlpha(alpha),
      borderColor: border.withAlpha(alpha),
    );
  }

  ButtonColors getButtonColors() {
    if (widget.colors != null) return widget.colors!;
    switch (widget.nativeType) {
      case ButtonNativeType.normal:
        return getColor(Colors.white, widget.type.color, widget.type.color);
      case ButtonNativeType.plain:
        return getColor(widget.type.color, Colors.white, widget.type.color);
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
      nativeType: widget.nativeType,
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

    return _buttonWidgetHandler(state, style, iconStates);
  }
}

Widget _buttonWidgetHandler(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  switch (state.nativeType) {
    case ButtonNativeType.normal:
      return _normalButton(state, style, icon);
    case ButtonNativeType.plain:
      return _plainButton(state, style, icon);
    case ButtonNativeType.text:
      return _textButton(state, style, icon);
  }
}

Widget? _getButtonChild(ButtonStates state, ButtonStyles style) {
  return state.slot ?? (state.text != null ? Text(state.text!) : null);
}

Widget? _getIcon(ButtonStyles style, [ButtonIconStates? icon]) {
  return icon == null ? null : Icon(icon.icon);
}

Widget _normalButton(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  ButtonStyle bs = normalBtnStyle(state, style, icon);

  return ElevatedButton.icon(
    style: bs,
    icon: _getIcon(style, icon),
    onPressed: state.click,
    onLongPress: state.longPress,
    label: _getButtonChild(state, style) ?? const Text(''),
  );
}

Widget _textButton(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  ButtonStyle bs = textBtnStyle(state, style, icon);
  if (icon == null) {
    return TextButton(
      style: bs,
      onPressed: state.click,
      onLongPress: state.longPress,
      child: _getButtonChild(state, style)!,
    );
  }
  return IconTextButton(
    style: bs,
    iconAlignment: icon.position,
    gap: icon.gap,
    icon: _getIcon(style, icon)!,
    onPressed: state.click,
    onLongPress: state.longPress,
    label: _getButtonChild(state, style),
  );
}

Widget _plainButton(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  ButtonStyle bs = plainBtnStyle(state, style, icon);

  return OutlinedButton.icon(
    style: bs,
    icon: _getIcon(style, icon),
    onPressed: state.click,
    onLongPress: state.longPress,
    label: _getButtonChild(state, style) ?? const Text(''),
  );
}
