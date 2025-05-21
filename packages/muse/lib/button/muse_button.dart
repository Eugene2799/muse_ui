import 'package:flutter/material.dart';
import 'package:muse_ui/button/styles.dart';
import 'package:muse_ui/button/types.dart';

import 'icon_elevated_button.dart';
import 'icon_outlined_button.dart';
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
    this.width,
    this.height,
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
  final double? width;
  final double? height;
  final double? iconGap;

  final VoidCallback? click;
  final VoidCallback? longPress;
  final Widget? slot;

  @override
  State<StatefulWidget> createState() => _MuseButtonState();
}

class _MuseButtonState extends State<MuseButton> {
  ButtonIconStates? iconStates;
  ButtonColors? btnColors;

  static const int disabledAlpha = 128;
  static const int enabledAlpha = 255;
  late final IconData? iconData;
  late final ButtonStates btnState;
  late final ButtonStyles btnStyle;
  late final Widget btnWidget;

  ButtonColors getColor(Color font, Color bg, Color border) {
    bool isNormal = widget.type == ButtonType.normal;
    Color fontColor = isNormal ? const Color(0xFF969799) : font;
    Color bgColor =
        isNormal && widget.nativeType == ButtonNativeType.normal
            ? Colors.white
            : bg;
    int alpha = widget.disabled ? disabledAlpha : enabledAlpha;
    return (
      fontColor: fontColor.withAlpha(alpha),
      bgColor: bgColor.withAlpha(alpha),
      borderColor: border.withAlpha(alpha),
    );
  }

  Widget _getButton(ButtonNativeType nativeType) {
    if (widget.colors != null) {
      btnColors = widget.colors!;
    }
    switch (nativeType) {
      case ButtonNativeType.normal:
        btnColors ??= getColor(
          Colors.white,
          widget.type.color,
          widget.type.color,
        );
        btnStyle = (
          size: widget.size,
          width: widget.width,
          height: widget.height,
          colors: btnColors!,
          borderType: widget.borderType,
          hairline: widget.hairline,
        );
        return _normalButton(btnState, btnStyle, iconStates);
      case ButtonNativeType.plain:
        btnColors ??= getColor(
          widget.type.color,
          Colors.white,
          widget.type.color,
        );
        btnStyle = (
          size: widget.size,
          width: widget.width,
          height: widget.height,
          colors: btnColors!,
          borderType: widget.borderType,
          hairline: widget.hairline,
        );
        return _plainButton(btnState, btnStyle, iconStates);
      case ButtonNativeType.text:
        btnColors ??= getColor(
          widget.type.color,
          Color(0x00FFFFFF),
          Color(0x00FFFFFF),
        );
        btnStyle = (
          size: widget.size,
          width: widget.width,
          height: widget.height,
          colors: btnColors!,
          borderType: widget.borderType,
          hairline: widget.hairline,
        );
        return _textButton(btnState, btnStyle, iconStates);
    }
  }

  @override
  void initState() {
    super.initState();
    iconData = widget.icon ?? widget.iconPrefix;
    if (iconData != null) {
      iconStates = (
        icon: iconData!,
        position: widget.iconPosition,
        gap: widget.iconGap,
      );
    }

    btnState = (
      text: widget.text,
      type: widget.type,
      nativeType: widget.nativeType,
      disabled: widget.disabled,
      autofocus: widget.autofocus,
      click: widget.disabled ? null : widget.click,
      longPress: widget.disabled ? null : widget.longPress,
      slot: widget.slot,
    );

    btnWidget = _getButton(widget.nativeType);
  }

  @override
  Widget build(BuildContext context) {
    return btnWidget;
  }
}

late ButtonStyle bs;

Widget? _getButtonChild(ButtonStates state, ButtonStyles style) {
  return state.slot ?? (state.text != null ? Text(state.text!) : null);
}

Widget? _getIcon(ButtonStyles style, [ButtonIconStates? icon]) {
  return icon == null ? null : Icon(icon.icon);
}

Widget _createButton({required ButtonStyles style, required Widget child}) {
  return SizedBox(
    height: style.height ?? style.size.height,
    width: style.width,
    child: child,
  );
}

Widget _normalButton(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  ButtonStyle bs = normalBtnStyle(style, icon);
  Widget btn = _createButton(
    style: style,
    child: IconElevatedButton(
      style: bs,
      iconAlignment: icon?.position,
      gap: icon?.gap,
      icon: _getIcon(style, icon),
      onPressed: state.click,
      onLongPress: state.longPress,
      label: _getButtonChild(state, style),
    ),
  );

  return btn;
}

Widget _textButton(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  ButtonStyle bs = textBtnStyle(style, icon);
  Widget btn = _createButton(
    style: style,
    child: IconTextButton(
      style: bs,
      iconAlignment: icon?.position,
      gap: icon?.gap,
      icon: _getIcon(style, icon),
      onPressed: state.click,
      onLongPress: state.longPress,
      label: _getButtonChild(state, style),
    ),
  );

  return btn;
}

Widget _plainButton(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  ButtonStyle bs = plainBtnStyle(style, icon);
  Widget btn = _createButton(
    style: style,
    child: IconOutlinedButton(
      style: bs,
      iconAlignment: icon?.position,
      gap: icon?.gap,
      icon: _getIcon(style, icon),
      onPressed: state.click,
      onLongPress: state.longPress,
      label: _getButtonChild(state, style),
    ),
  );

  return btn;
}
