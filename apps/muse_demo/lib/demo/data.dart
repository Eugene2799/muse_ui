import 'package:flutter/material.dart';
import 'package:muse_demo/demo/button/button_page.dart';
import 'package:muse_demo/shared/mu_route.dart';
import 'package:muse_demo/shared/styles.dart';
import 'package:muse_demo/shared/types.dart';
import 'package:muse_ui/button/muse_button.dart';
import 'package:muse_ui/button/types.dart';

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

List<DemoList> indexData(BuildContext context) {
  return [
    (
      title: "基础组件",
      list: [
        _buildBtn(
          "Button 按钮",
          () => MuRoute.push(context, ButtonPage(title: 'Button')),
        ),
        _buildBtn("Cell 单元格", () => {}),
      ],
    ),
  ];
}
