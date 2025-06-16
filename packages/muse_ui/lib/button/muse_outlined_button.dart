import 'package:flutter/material.dart';
import 'package:muse_ui/shared/default.dart';
import 'package:muse_ui/shared/utils.dart';

class MuseOutlinedButton extends OutlinedButton {
  MuseOutlinedButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    bool? autofocus,
    double? gap,
    super.clipBehavior,
    super.statesController,
    IconData? iconData,
    Widget? label,
    IconAlignment? iconAlignment,
  }) : super(
         autofocus: autofocus ?? false,
         child:
             iconData == null
                 ? label
                 : _MuseOutlinedButtonWithIconChild(
                   icon: Icon(iconData),
                   label: label,
                   gap: gap ?? Default.gap,
                   buttonStyle: style,
                   iconAlignment: iconAlignment,
                 ),
       );

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    if (!useMaterial3) {
      return super.defaultStyleOf(context);
    }
    final ButtonStyle buttonStyle = super.defaultStyleOf(context);
    final double fontSize =
        buttonStyle.textStyle?.resolve(const <WidgetState>{})?.fontSize ??
        Default.fontSize;
    final double effectiveTextScale =
        MediaQuery.textScalerOf(context).scale(fontSize) / Default.fontSize;
    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      const EdgeInsetsDirectional.fromSTEB(16, 0, 24, 0),
      const EdgeInsetsDirectional.fromSTEB(8, 0, 12, 0),
      const EdgeInsetsDirectional.fromSTEB(4, 0, 6, 0),
      effectiveTextScale,
    );
    return buttonStyle.copyWith(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(scaledPadding),
    );
  }
}

class _MuseOutlinedButtonWithIconChild extends StatelessWidget {
  const _MuseOutlinedButtonWithIconChild({
    required this.label,
    required this.icon,
    required this.buttonStyle,
    required this.iconAlignment,
    required this.gap,
  });

  final Widget? label;
  final Widget icon;
  final ButtonStyle? buttonStyle;
  final IconAlignment? iconAlignment;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonTheme.of(
      context,
    );
    final IconAlignment effectiveIconAlignment =
        iconAlignment ??
        outlinedButtonTheme.style?.iconAlignment ??
        buttonStyle?.iconAlignment ??
        IconAlignment.start;
    final Widget labelBox =
        label != null ? Flexible(child: label!) : SizedBox();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
          effectiveIconAlignment == IconAlignment.start
              ? Utils.getLRList(icon, gap, labelBox)
              : Utils.getLRList(labelBox, gap, icon),
    );
  }
}
