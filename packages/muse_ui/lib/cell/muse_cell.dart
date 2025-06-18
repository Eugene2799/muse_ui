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

  static const _titleStyle = TextStyle(fontSize: Default.fontSize);
  static const _valueStyle = TextStyle(
    fontSize: Default.fontSize,
    color: Default.colorFontGray,
  );
  static const _labelStyle = TextStyle(
    fontSize: Default.fontSizeSmall,
    color: Default.colorFontGray,
  );
  static const _defaultTextAlign = TextAlign.justify;

  Widget? _renderTextWidget(
    Widget? slotWidget,
    String? text,
    AlignmentGeometry alignment,
    TextStyle? textStyle,
  ) {
    return slotWidget ??
        (text != null
            ? Align(
              alignment: alignment,
              child: Text(text, style: textStyle, textAlign: _defaultTextAlign),
            )
            : null);
  }

  Widget? _buildIconText(Widget? w1, Widget? w2) {
    if (w1 != null && w2 != null) {
      return Row(mainAxisSize: MainAxisSize.min, children: [w1, w2]);
    } else {
      return w1 ?? w2;
    }
  }

  Widget? _renderTitle() =>
      _renderTextWidget(slotTitle, title, Alignment.centerLeft, _titleStyle);

  Widget? _renderValue() =>
      _renderTextWidget(slotValue, value, Alignment.centerRight, _valueStyle);

  Widget? _renderIcon() {
    return slotIcon ?? (icon != null ? Icon(icon!) : null);
  }

  Widget? _renderRightIcon() {
    return slotRightIcon ?? (isLink ? Icon(arrowDirection.icon) : null);
  }

  Widget? getTitle() => _buildIconText(_renderIcon(), _renderTitle());

  Widget? getValue() => _buildIconText(_renderRightIcon(), _renderValue());

  Widget? getLabel() =>
      _renderTextWidget(slotLabel, label, Alignment.centerLeft, _labelStyle);

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
              : Column(children: [titleWidget, labelWidget]);
      if (getValue() == null) {
        return tlWidget;
      } else {
        return Row(
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
    Widget museCell = getClickable ? InkWell(child: cellBox) : cellBox;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
      ),
      child: museCell,
    );
  }
}
