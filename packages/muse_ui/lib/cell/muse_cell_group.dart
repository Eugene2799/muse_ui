import 'package:flutter/material.dart';
import 'package:muse_ui/shared/default.dart';
import 'package:muse_ui/shared/utils.dart';

class MuseCellGroup extends StatelessWidget {
  const MuseCellGroup({
    super.key,
    this.children = const <Widget>[],
    this.isCard = false,
    this.border = true,
    this.radius,
    this.title,
    this.titlePadding = const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
    this.slotTitle,
  });

  final List<Widget> children;
  final bool isCard;
  final bool border;
  final double? radius;
  final String? title;
  final EdgeInsetsGeometry titlePadding;
  final Widget? slotTitle;

  @override
  Widget build(BuildContext context) {
    final Widget? titleWidget = Utils.renderText(
      slotTitle,
      title,
      Alignment.centerLeft,
      Default.textStyle(),
    );
    BoxBorder? borderStyle;
    Widget group = SizedBox();
    Widget cellGroup = SizedBox();

    if (border) {
      borderStyle = Border(
        top: BorderSide(color: Default.colorBorder),
        bottom: BorderSide(color: Default.colorBorder),
      );
    }
    if (isCard) {
      group = Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
            border: Border.all(color: Default.colorBorder),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
            child: Column(children: children),
          ),
        ),
      );
    } else {
      group = DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
          border: borderStyle,
        ),
        child: Column(children: children),
      );
    }

    if (titleWidget != null) {
      cellGroup = Column(
        children: [Padding(padding: titlePadding, child: titleWidget), group],
      );
    } else {
      cellGroup = group;
    }

    return cellGroup;
  }
}
