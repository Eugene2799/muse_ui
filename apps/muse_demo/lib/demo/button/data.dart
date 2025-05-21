import 'package:flutter/material.dart';
import 'package:muse_demo/types.dart';
import 'package:muse_ui/button/muse_button.dart';
import 'package:muse_ui/button/types.dart';

List<DemoList> demoButton = [
  (
    title: "按钮类型",
    list: [
      MuseButton(text: "主要按钮", type: ButtonType.primary, click: () => {}),
      MuseButton(text: "信息按钮", type: ButtonType.info, click: () => {}),
      MuseButton(text: "默认按钮", click: () => {}),
      MuseButton(text: "危险按钮", type: ButtonType.danger, click: () => {}),
      MuseButton(text: "警告按钮", type: ButtonType.warning, click: () => {}),
    ],
  ),
  (
    title: "文本类型",
    list: [
      MuseButton(
        text: "文本按钮",
        nativeType: ButtonNativeType.text,
        type: ButtonType.primary,
        click: () => {},
      ),
      MuseButton(
        text: "文本按钮",
        icon: Icons.add_circle,
        nativeType: ButtonNativeType.text,
        type: ButtonType.danger,
        click: () => {},
      ),
      MuseButton(
        text: "自定义颜色",
        nativeType: ButtonNativeType.text,
        colors: (
          fontColor: Colors.purple,
          bgColor: Colors.purple,
          borderColor: Colors.purple,
        ),
        click: () => {},
      ),
    ],
  ),
  (
    title: "朴素按钮",
    list: [
      MuseButton(
        text: "朴素按钮",
        type: ButtonType.primary,
        nativeType: ButtonNativeType.plain,
        click: () => {},
      ),
      MuseButton(
        text: "朴素按钮",
        size: ButtonSize.normal,
        icon: Icons.add_circle,
        nativeType: ButtonNativeType.plain,
        type: ButtonType.info,
        click: () => {},
      ),
    ],
  ),
  (
    title: "细边框",
    list: [
      MuseButton(
        text: "细边框按钮",
        hairline: true,
        type: ButtonType.primary,
        nativeType: ButtonNativeType.plain,
        click: () => {},
      ),
      MuseButton(
        text: "细边框按钮",
        hairline: true,
        nativeType: ButtonNativeType.plain,
        type: ButtonType.info,
        click: () => {},
      ),
    ],
  ),
  (
    title: "禁用状态",
    list: [
      MuseButton(
        text: "禁用状态",
        disabled: true,
        type: ButtonType.primary,
        click: () => {},
      ),
      MuseButton(
        text: "禁用状态",
        disabled: true,
        type: ButtonType.info,
        click: () => {},
      ),
    ],
  ),
  (
    title: "按钮形状",
    list: [
      MuseButton(
        text: "方形按钮",
        type: ButtonType.primary,
        borderType: ButtonBorderType.square,
        click: () => {},
      ),
      MuseButton(
        text: "圆形按钮",
        type: ButtonType.info,
        borderType: ButtonBorderType.round,
        click: () => {},
      ),
    ],
  ),
  (
    title: "图标按钮",
    list: [
      MuseButton(
        icon: Icons.add,
        type: ButtonType.primary,
        iconGap: 0,
        click: () => {},
      ),
      MuseButton(
        icon: Icons.add,
        text: "按钮",
        type: ButtonType.primary,
        click: () => {},
      ),
      MuseButton(
        icon: Icons.people_alt_outlined,
        text: "按钮",
        type: ButtonType.info,
        iconGap: 0,
        nativeType: ButtonNativeType.plain,
        click: () => {},
      ),
    ],
  ),
  (
    title: "按钮尺寸",
    list: [
      MuseButton(
        type: ButtonType.primary,
        size: ButtonSize.large,
        text: "大号按钮",
        click: () => {},
      ),
      MuseButton(
        type: ButtonType.primary,
        size: ButtonSize.normal,
        text: "普通按钮",
        click: () => {},
      ),
      MuseButton(
        type: ButtonType.primary,
        size: ButtonSize.small,
        text: "小型按钮",
        click: () => {},
      ),
      MuseButton(
        type: ButtonType.primary,
        size: ButtonSize.mini,
        text: "迷你按钮",
        click: () => {},
      ),
    ],
  ),
  (
    title: "块级元素",
    list: [
      MuseButton(
        type: ButtonType.primary,
        width: double.infinity,
        text: "块级元素",
        click: () => {},
      ),
    ],
  ),
  (
    title: "自定义颜色",
    list: [
      MuseButton(
        type: ButtonType.primary,
        colors: (
          fontColor: Colors.white,
          bgColor: Colors.deepPurpleAccent,
          borderColor: Colors.deepPurpleAccent,
        ),
        text: "单色按钮",
        click: () => {},
      ),
      MuseButton(
        type: ButtonType.primary,
        nativeType: ButtonNativeType.plain,
        colors: (
          fontColor: Colors.deepPurpleAccent,
          bgColor: Colors.white,
          borderColor: Colors.deepPurpleAccent,
        ),
        text: "单色按钮",
        click: () => {},
      ),
    ],
  ),
];
