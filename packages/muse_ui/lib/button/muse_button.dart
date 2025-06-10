import 'package:flutter/material.dart';

import 'muse_elevated_button.dart';
import 'muse_outlined_button.dart';
import 'muse_text_button.dart';
import 'styles.dart';
import 'types.dart';

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
    this.padding,
    this.width,
    this.height,
    this.fontSize,
    this.iconSize,
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
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? iconSize;
  final double? iconGap;

  final VoidCallback? click;
  final VoidCallback? longPress;
  final Widget? slot;

  @override
  State<StatefulWidget> createState() => _MuseButtonState();
}

class _MuseButtonState extends State<MuseButton> {
  static const int disabledAlpha = 128;
  static const int enabledAlpha = 255;
  late final IconData? iconData;
  late final Widget btnWidget;

  @override
  void initState() {
    super.initState();
    iconData = widget.icon ?? widget.iconPrefix;
    btnWidget = _getButton(widget.nativeType);
  }

  @override
  Widget build(BuildContext context) => btnWidget;

  ButtonColors _getColor(ButtonColors colors) {
    bool isNormal = widget.type == ButtonType.normal;
    Color fontColor = isNormal ? const Color(0xFF969799) : colors.fontColor;
    Color bgColor =
        isNormal && widget.nativeType == ButtonNativeType.normal
            ? Colors.white
            : colors.bgColor;
    int alpha = widget.disabled ? disabledAlpha : enabledAlpha;
    return (
      fontColor: fontColor.withAlpha(alpha),
      bgColor: bgColor.withAlpha(alpha),
      borderColor: colors.borderColor.withAlpha(alpha),
      iconColor: fontColor.withAlpha(alpha),
    );
  }

  Widget _getButton(ButtonNativeType nativeType) {
    final EdgeInsetsGeometry padding = widget.padding ?? widget.size.padding;
    final double fontSize = widget.fontSize ?? widget.size.size;
    final double iconSize = widget.iconSize ?? fontSize;
    ButtonColors? btnColors = widget.colors;
    switch (nativeType) {
      case ButtonNativeType.normal:
        btnColors ??= _getColor((
          fontColor: Colors.white,
          bgColor: widget.type.color,
          borderColor: widget.type.color,
          iconColor: null,
        ));
        ButtonStyle bs = normalBtnStyle((
          fontSize: fontSize,
          iconSize: iconSize,
          padding: padding,
          colors: btnColors!,
          borderType: widget.borderType,
          hairline: widget.hairline,
          iconPosition: widget.iconPosition,
        ));
        return _normalButton(bs);
      case ButtonNativeType.plain:
        btnColors ??= _getColor((
          fontColor: widget.type.color,
          bgColor: Colors.white,
          borderColor: widget.type.color,
          iconColor: null,
        ));
        ButtonStyle bs = plainBtnStyle((
          fontSize: fontSize,
          iconSize: iconSize,
          padding: padding,
          colors: btnColors!,
          borderType: widget.borderType,
          hairline: widget.hairline,
          iconPosition: widget.iconPosition,
        ));
        return _plainButton(bs);
      case ButtonNativeType.text:
        btnColors ??= _getColor((
          fontColor: widget.type.color,
          bgColor: Color(0x00FFFFFF),
          borderColor: Color(0x00FFFFFF),
          iconColor: null,
        ));
        ButtonStyle bs = textBtnStyle((
          fontSize: fontSize,
          iconSize: iconSize,
          padding: padding,
          colors: btnColors!,
          borderType: widget.borderType,
          hairline: widget.hairline,
          iconPosition: widget.iconPosition,
        ));
        return _textButton(bs);
    }
  }

  Widget? _getButtonChild() {
    return widget.slot ?? (widget.text != null ? Text(widget.text!) : null);
  }

  Widget _createButton(Widget child) {
    double boxHeight = widget.height ?? widget.size.height;
    double? boxWidth = widget.width;
    if (widget.borderType == ButtonBorderType.circle) boxWidth = boxHeight;
    return SizedBox(height: boxHeight, width: boxWidth, child: child);
  }

  Widget _normalButton(ButtonStyle style) {
    return _createButton(
      MuseElevatedButton(
        style: style,
        iconAlignment: widget.iconPosition,
        gap: widget.iconGap,
        iconData: iconData,
        onPressed: widget.disabled ? null : widget.click,
        onLongPress: widget.disabled ? null : widget.longPress,
        label: _getButtonChild(),
      ),
    );
  }

  Widget _textButton(ButtonStyle style) {
    return _createButton(
      MuseTextButton(
        style: style,
        iconAlignment: widget.iconPosition,
        gap: widget.iconGap,
        iconData: iconData,
        onPressed: widget.disabled ? null : widget.click,
        onLongPress: widget.disabled ? null : widget.longPress,
        label: _getButtonChild(),
      ),
    );
  }

  Widget _plainButton(ButtonStyle style) {
    return _createButton(
      MuseOutlinedButton(
        style: style,
        iconAlignment: widget.iconPosition,
        gap: widget.iconGap,
        iconData: iconData,
        onPressed: widget.disabled ? null : widget.click,
        onLongPress: widget.disabled ? null : widget.longPress,
        label: _getButtonChild(),
      ),
    );
  }
}
