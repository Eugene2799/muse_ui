import 'package:flutter/material.dart';
import 'package:muse_ui/button/types.dart';

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
    this.iconPosition = ButtonIconPosition.left,
    this.click,
    this.longPress,
    this.slot,
  });

  final String? text;
  final String? icon;
  final ButtonType type;
  final ButtonSize size;
  final ButtonNativeType nativeType;
  final ButtonBorderType borderType;
  final FullButtonColors? colors;
  final bool loading;
  final bool hairline;
  final bool disabled;
  final bool autofocus;
  final String? iconPrefix;
  final LoadingType loadingType;
  final ButtonIconPosition iconPosition;

  final VoidCallback? click;
  final VoidCallback? longPress;
  final Widget? slot;

  @override
  State<StatefulWidget> createState() => _MuseButtonState();
}

class _MuseButtonState extends State<MuseButton> {
  ButtonIconStates? iconStates;

  String getIconName() {
    if (widget.icon?.isNotEmpty ?? false) return widget.icon!;
    if (widget.iconPrefix?.isNotEmpty ?? false) return widget.iconPrefix!;
    if (widget.loading) return 'loading';
    return '';
  }

  ButtonColors getButtonColors() {
    final FullButtonColors colors = widget.colors ?? widget.type.colors;
    if (widget.disabled) {
      return (
        fontColor: colors.disabledFontColor,
        bgColor: colors.disabledBgColor,
        borderColor: colors.disabledBorderColor,
      );
    } else {
      return (
        fontColor: colors.fontColor,
        bgColor: colors.bgColor,
        borderColor: colors.borderColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconName = getIconName();
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

    if (iconName.isNotEmpty) {
      iconStates = (name: iconName, position: widget.iconPosition);
    }
    switch (widget.nativeType) {
      case ButtonNativeType.normal:
        return _normalButton(state, style, iconStates);
      case ButtonNativeType.plain:
        return _normalButton(state, style, iconStates);
      case ButtonNativeType.text:
        return _normalButton(state, style, iconStates);
    }
  }
}

Widget _getButtonChild(ButtonStates state, ButtonStyles style) {
  if (state.slot != null) return state.slot!;
  if (state.text != null) {
    return Text(
      state.text!,
      style: TextStyle(
        fontSize: style.size.size,
        color: style.colors.fontColor,
      ),
    );
  }
  return SizedBox();
}

Widget _normalButton(
  ButtonStates state,
  ButtonStyles style, [
  ButtonIconStates? icon,
]) {
  ButtonStyle bs = ButtonStyle(
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(style.borderType.radius),
        side: BorderSide(
          color: style.colors.borderColor,
          width: style.hairline ? 0.5 : 1.0,
        ), // 设置边框颜色和宽度
      ),
    ),
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return style.colors.bgColor.withAlpha(128); // 按下时的颜色
      }
      return style.colors.bgColor; // 默认背景色
    }),
  );
  if (icon == null) {
    return ElevatedButton(
      style: bs,
      onPressed: state.click,
      onLongPress: state.longPress,
      child: _getButtonChild(state,style),
    );
  } else {
    return ElevatedButton.icon(
      style: bs,
      icon: Icon(Icons.send),
      onPressed: state.click,
      onLongPress: state.longPress,
      label: _getButtonChild(state,style),
    );
  }
}
