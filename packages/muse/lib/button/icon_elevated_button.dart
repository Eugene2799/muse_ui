import 'package:flutter/material.dart';
import 'package:muse_ui/button/styles.dart';
import 'package:muse_ui/shared/utils.dart';

class IconElevatedButton extends ElevatedButton {
  IconElevatedButton({
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
    Widget? icon,
    Widget? label,
    IconAlignment? iconAlignment,
  }) : super(
         autofocus: autofocus ?? false,
         child:
             icon == null
                 ? label
                 : _MuseElevatedButtonWithIconChild(
                   icon: icon,
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

    final EdgeInsetsGeometry scaledPadding =
        useMaterial3
            ? ButtonStyleButton.scaledPadding(
              const EdgeInsetsDirectional.fromSTEB(16, 0, 24, 0),
              const EdgeInsetsDirectional.fromSTEB(8, 0, 12, 0),
              const EdgeInsetsDirectional.fromSTEB(4, 0, 6, 0),
              effectiveTextScale,
            )
            : ButtonStyleButton.scaledPadding(
              const EdgeInsetsDirectional.fromSTEB(12, 0, 16, 0),
              const EdgeInsets.symmetric(horizontal: 8),
              const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
              effectiveTextScale,
            );
    return buttonStyle.copyWith(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(scaledPadding),
    );
  }
}

class _MuseElevatedButtonWithIconChild extends StatelessWidget {
  const _MuseElevatedButtonWithIconChild({
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
    final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonTheme.of(
      context,
    );
    final IconAlignment effectiveIconAlignment =
        iconAlignment ??
        elevatedButtonTheme.style?.iconAlignment ??
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
