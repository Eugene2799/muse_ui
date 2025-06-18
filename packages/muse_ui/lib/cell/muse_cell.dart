import 'package:flutter/material.dart';
import 'package:muse_ui/cell/types.dart';
import 'package:muse_ui/shared/default.dart';

class MuseCell extends StatelessWidget {
  const MuseCell({
    super.key,
    this.icon,
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

  static const _defaultTextStyle = TextStyle(fontSize: Default.fontSize);
  static const _defaultTextAlign = TextAlign.justify;

  Widget _renderTextWidget(Widget? slotWidget, String? text) {
    return slotWidget ??
        (text != null
            ? Text(text, style: _defaultTextStyle, textAlign: _defaultTextAlign)
            : SizedBox());
  }

  Widget _buildIconText(Widget? optionalWidget, Widget mainWidget) {
    return optionalWidget != null
        ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [optionalWidget, mainWidget],
        )
        : mainWidget;
  }

  Widget _renderLabel() => _renderTextWidget(slotLabel, label);

  Widget _renderTitle() => _renderTextWidget(slotTitle, title);

  Widget _renderValue() => _renderTextWidget(slotValue, value);

  Widget? _renderIcon() {
    return slotIcon ?? (icon != null ? Icon(icon!) : null);
  }

  Widget? _renderRightIcon() {
    return slotRightIcon ?? (isLink ? Icon(arrowDirection.icon) : null);
  }

  Widget getTitle() => _buildIconText(_renderIcon(), _renderTitle());

  Widget getValue() => _buildIconText(_renderRightIcon(), _renderValue());

  @override
  Widget build(BuildContext context) {
    final bool getClickable = clickable || isLink;
    Widget cellCenterBox = Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(children: [getTitle(), _renderLabel()]),
        ),
        Expanded(flex: 1, child: getValue()),
      ],
    );
    Widget cellNormalBox = Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: getTitle()),
            Expanded(flex: 1, child: getValue()),
          ],
        ),
        _renderLabel(),
      ],
    );
    Widget cellBox = center ? cellCenterBox : cellNormalBox;
    Widget museCell = getClickable ? InkWell(child: cellBox) : cellBox;

    return museCell;
  }
}
