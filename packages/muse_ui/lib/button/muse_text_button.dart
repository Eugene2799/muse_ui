import 'package:flutter/material.dart';
import 'package:muse_ui/button/styles.dart';
import 'package:muse_ui/shared/utils.dart';

class MuseTextButton extends TextButton {
  ///
  /// [icon] and [label] cannot both null.
  ///
  MuseTextButton({
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
                 ? label!
                 : _MuseTextButtonWithIconChild(
                   icon: Icon(iconData),
                   label: label,
                   gap: gap ?? defaultGap,
                   buttonStyle: style,
                   iconAlignment: iconAlignment,
                 ),
       );

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final ButtonStyle buttonStyle = super.defaultStyleOf(context);
    final double defaultFontSize =
        buttonStyle.textStyle?.resolve(const <WidgetState>{})?.fontSize ?? 14.0;
    final double effectiveTextScale =
        MediaQuery.textScalerOf(context).scale(defaultFontSize) / 14.0;
    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      useMaterial3
          ? const EdgeInsetsDirectional.fromSTEB(12, 8, 16, 8)
          : const EdgeInsets.all(8),
      const EdgeInsets.symmetric(horizontal: 4),
      const EdgeInsets.symmetric(horizontal: 4),
      effectiveTextScale,
    );
    return buttonStyle.copyWith(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(scaledPadding),
    );
  }
}

class _MuseTextButtonWithIconChild extends StatelessWidget {
  const _MuseTextButtonWithIconChild({
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
    final TextButtonThemeData textButtonTheme = TextButtonTheme.of(context);
    final IconAlignment effectiveIconAlignment =
        iconAlignment ??
        textButtonTheme.style?.iconAlignment ??
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
