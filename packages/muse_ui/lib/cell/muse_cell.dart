import 'package:flutter/material.dart';
import 'package:muse_ui/cell/types.dart';
import 'package:muse_ui/shared/default.dart';

class MuseCell extends StatelessWidget {
  const MuseCell({
    super.key,
    this.icon,
    this.size = CellSize.normal,
    this.title,
    this.slotTitle,
    this.value,
    this.slotValue,
    this.label,
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
  final Widget? slotTitle;
  final String? value;
  final Widget? slotValue;
  final String? label;
  final Widget? slotLabel;
  final bool center;
  final bool isLink;
  final bool clickable;
  final bool border;
  final bool required;
  final ArrowDirection arrowDirection;
  final VoidCallback? click;

  Widget? _renderLabel() {
    if (slotLabel != null) return slotLabel;
    final currentLabel = label;
    if (currentLabel != null) {
      return Text(
        currentLabel,
        style: TextStyle(fontSize: Default.fontSize),
        textAlign: TextAlign.justify,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
