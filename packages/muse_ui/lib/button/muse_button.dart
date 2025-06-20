import 'package:flutter/material.dart';
import 'package:muse_ui/shared/default.dart';

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
    this.axisSet,
    this.iconPosition,
    this.padding,
    this.gradient,
    this.boxShadow,
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
  final ButtonType type;
  final ButtonSize size;
  final ButtonNativeType nativeType;
  final ButtonBorderType borderType;
  final ButtonColors? colors;
  final bool hairline;
  final bool disabled;
  final bool autofocus;
  final MainAxisSet? axisSet;
  final IconAlignment? iconPosition;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;
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
  late final Widget btnWidget;

  @override
  void initState() {
    super.initState();
    btnWidget = _getButton(widget.nativeType);
  }

  @override
  Widget build(BuildContext context) => btnWidget;

  ButtonColors _getColor(ButtonColors colors) {
    bool isNormal = widget.type == ButtonType.normal;
    Color fontColor = isNormal ? Default.colorFont : colors.fontColor;
    Color bgColor =
        isNormal && widget.nativeType == ButtonNativeType.normal
            ? Colors.white
            : colors.bgColor;
    int alpha = widget.disabled ? Default.alphaDisable : Default.alphaEnable;
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
          colors: btnColors,
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
          colors: btnColors,
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
          colors: btnColors,
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
    if (widget.gradient == null && widget.boxShadow == null) {
      return SizedBox(height: boxHeight, width: boxWidth, child: child);
    } else {
      return SizedBox(
        height: boxHeight,
        width: boxWidth,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: widget.gradient, //背景渐变
            borderRadius: BorderRadius.circular(widget.borderType.radius),
            boxShadow: widget.boxShadow,
          ),
          child: child,
        ),
      );
    }
  }

  Widget _normalButton(ButtonStyle style) {
    return _createButton(
      MuseElevatedButton(
        style: style,
        axisSize: widget.axisSet?.size,
        alignment: widget.axisSet?.alignment,
        iconAlignment: widget.iconPosition,
        gap: widget.iconGap,
        iconData: widget.icon,
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
        axisSize: widget.axisSet?.size,
        alignment: widget.axisSet?.alignment,
        iconAlignment: widget.iconPosition,
        gap: widget.iconGap,
        iconData: widget.icon,
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
        axisSize: widget.axisSet?.size,
        alignment: widget.axisSet?.alignment,
        iconAlignment: widget.iconPosition,
        gap: widget.iconGap,
        iconData: widget.icon,
        onPressed: widget.disabled ? null : widget.click,
        onLongPress: widget.disabled ? null : widget.longPress,
        label: _getButtonChild(),
      ),
    );
  }
}
