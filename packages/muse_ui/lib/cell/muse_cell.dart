import 'package:flutter/material.dart';
import 'package:muse_ui/cell/types.dart';
import 'package:muse_ui/shared/default.dart';
import 'package:muse_ui/shared/utils.dart';

class MuseCell extends StatelessWidget {
  const MuseCell({
    super.key,
    this.icon,
    this.iconSize,
    this.rightIconSize,
    this.iconColor,
    this.rightIconColor,
    this.size = CellSize.normal,
    this.title,
    this.value,
    this.label,
    this.slotIcon,
    this.slotRightIcon,
    this.slotTitle,
    this.slotValue,
    this.slotLabel,
    this.center = false,
    this.clickable = false,
    this.isLink = false,
    this.border = true,
    this.required = false,
    this.arrowDirection = ArrowDirection.right,
    this.click,
  });

  final IconData? icon;
  final CellSize size;
  final double? iconSize;
  final double? rightIconSize;
  final Color? iconColor;
  final Color? rightIconColor;
  final String? title;
  final String? value;
  final String? label;
  final Widget? slotIcon;
  final Widget? slotRightIcon;
  final Widget? slotTitle;
  final Widget? slotValue;
  final Widget? slotLabel;
  final bool center;
  final bool isLink;
  final bool clickable;
  final bool border;
  final bool required;
  final ArrowDirection arrowDirection;
  final VoidCallback? click;

  Widget? _renderTitle() => Utils.renderText(
    slotTitle,
    title,
    Alignment.centerLeft,
    size == CellSize.normal
        ? Default.textStyle()
        : Default.textStyle(size: Default.fontSizeLarge),
  );

  Widget? _renderValue() => Utils.renderText(
    slotValue,
    value,
    Alignment.centerRight,
    Default.textStyle(color: Default.colorFontGray),
  );

  Widget? _renderIcon() {
    return slotIcon ??
        (icon != null
            ? Icon(
              icon!,
              size: iconSize ?? Default.fontSize,
              color: iconColor ?? Default.colorFont,
            )
            : null);
  }

  Widget? _renderRightIcon() {
    return slotRightIcon ??
        (isLink
            ? Align(
              alignment: Alignment.centerRight,
              child: Icon(
                arrowDirection.icon,
                size: rightIconSize ?? Default.fontSize + 10,
                color: rightIconColor ?? Default.colorFontGray,
              ),
            )
            : null);
  }

  Widget? getTitle() => Utils.horizontalRow(_renderIcon(), _renderTitle());

  Widget? getValue() => Utils.horizontalRow(
    _renderValue(),
    _renderRightIcon(),
    axisAlignment: MainAxisAlignment.end,
  );

  Widget? getLabel() => Utils.renderText(
    slotLabel,
    label,
    Alignment.centerLeft,
    Default.textStyle(
      size: size == CellSize.normal ? Default.fontSizeSmall : Default.fontSize,
      color: Default.colorFontGray,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final bool getClickable = clickable || isLink;
    final titleWidget = getTitle() ?? SizedBox();
    final valueWidget = getValue() ?? SizedBox();
    final labelWidget = getLabel();
    final Widget divider = Divider(height: 1, color: Default.colorBorder);

    Widget cellCenterBox() {
      final tlWidget =
          labelWidget == null
              ? titleWidget
              : Column(
                mainAxisSize: MainAxisSize.min,
                children: [titleWidget, labelWidget],
              );
      if (getValue() == null) {
        return tlWidget;
      } else {
        return Row(
          spacing: 5,
          children: [
            Expanded(flex: 1, child: tlWidget),
            Expanded(flex: 1, child: valueWidget),
          ],
        );
      }
    }

    Widget cellNormalBox() {
      final tvWidget = Row(
        children: [
          Expanded(flex: 1, child: titleWidget),
          Expanded(flex: 1, child: valueWidget),
        ],
      );
      if (labelWidget == null) {
        return tvWidget;
      } else {
        return Column(spacing: 5, children: [tvWidget, labelWidget]);
      }
    }

    Widget cellBox = center ? cellCenterBox() : cellNormalBox();
    Widget clickableWidget = getClickable ? InkWell(child: cellBox) : cellBox;
    Widget museCell =
        border
            ? Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Column(
                children: [clickableWidget, SizedBox(height: 10), divider],
              ),
            )
            : Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: clickableWidget,
            );

    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: museCell,
    );
  }
}
