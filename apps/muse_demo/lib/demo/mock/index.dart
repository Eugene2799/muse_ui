import 'package:flutter/material.dart';
import 'package:muse_demo/demo/demo_page.dart';
import 'package:muse_demo/shared/mu_route.dart';
import 'package:muse_demo/shared/styles.dart';
import 'package:muse_demo/shared/types.dart';
import 'package:muse_ui/button/muse_button.dart';
import 'package:muse_ui/button/types.dart';

import 'button.dart';
import 'cell.dart';

Widget _btnText(String title) {
  return Text(title, style: TextStyle(fontWeight: FontWeight.bold));
}

Widget _buildBtn(String title, VoidCallback? onClick) {
  return MuseButton(
    slot: _btnText(title),
    width: double.infinity,
    colors: listButtonColors,
    borderType: ButtonBorderType.round,
    icon: Icons.arrow_forward_ios,
    axisSet: (
      size: MainAxisSize.max,
      alignment: MainAxisAlignment.spaceBetween,
    ),
    iconPosition: IconAlignment.end,
    click: onClick,
  );
}

List<DemoList> mockIndex(BuildContext context) {
  VoidCallback? goTo(String title, List<DemoList> list, {double? padding}) {
    return () => MuRoute.push(
      context,
      DemoPage(title: title, list: list, padding: padding),
    );
  }

  return [
    (
      title: "基础组件",
      list: [
        _buildBtn("Button 按钮", goTo('Button', mockButton)),
        _buildBtn("Cell 单元格", goTo('Cell', mockCell, padding: 0)),
      ],
    ),
  ];
}
