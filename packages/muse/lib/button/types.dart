import 'package:flutter/material.dart';

enum ButtonType {
  normal((
    fontColor: Color(0xFF323233),
    bgColor: Color(0xFFFFFFFF),
    borderColor: Color(0xFF969799),
    disabledFontColor: Color(0x80323233),
    disabledBgColor: Color(0x80FFFFFF),
    disabledBorderColor: Color(0x80969799),
  )),
  primary((
    fontColor: Color(0xFFFFFFFF),
    bgColor: Color(0xFF07c160),
    borderColor: Color(0xFF07c160),
    disabledFontColor: Color(0x80FFFFFF),
    disabledBgColor: Color(0x8007c160),
    disabledBorderColor: Color(0x8007c160),
  )),
  info((
    fontColor: Color(0xFFFFFFFF),
    bgColor: Color(0xFF1989fa),
    borderColor: Color(0xFF1989fa),
    disabledFontColor: Color(0x80FFFFFF),
    disabledBgColor: Color(0x801989fa),
    disabledBorderColor: Color(0x801989fa),
  )),
  warning((
    fontColor: Color(0xFFFFFFFF),
    bgColor: Color(0xFFff976a),
    borderColor: Color(0xFFff976a),
    disabledFontColor: Color(0x80FFFFFF),
    disabledBgColor: Color(0x80ff976a),
    disabledBorderColor: Color(0x80ff976a),
  )),
  danger((
    fontColor: Color(0xFFFFFFFF),
    bgColor: Color(0xFFea3425),
    borderColor: Color(0xFFea3425),
    disabledFontColor: Color(0x80FFFFFF),
    disabledBgColor: Color(0x80ea3425),
    disabledBorderColor: Color(0x80ea3425),
  ));

  final FullButtonColors colors;

  const ButtonType(this.colors);
}

enum ButtonBorderType {
  normal(5.0),
  round(18.0),
  square(0.0);

  final double radius;

  const ButtonBorderType(this.radius);
}

enum ButtonNativeType { normal, plain, text }

enum ButtonSize {
  large(16.0),
  normal(14.0),
  small(12.0),
  mini(10.0);

  final double size;

  const ButtonSize(this.size);
}

enum ButtonIconPosition { left, right }

enum LoadingType { spinner, circular }

typedef ButtonColors = ({Color fontColor, Color bgColor, Color borderColor});

typedef FullButtonColors =
    ({
      Color fontColor,
      Color bgColor,
      Color borderColor,
      Color disabledFontColor,
      Color disabledBgColor,
      Color disabledBorderColor,
    });

typedef ButtonStates =
    ({
      String? text,
      ButtonType type,
      bool loading,
      bool disabled,
      bool autofocus,
      VoidCallback? click,
      VoidCallback? longPress,
      Widget? slot,
    });

typedef ButtonStyles =
    ({
      ButtonSize size,
      ButtonColors colors,
      ButtonBorderType borderType,
      bool hairline,
    });

typedef ButtonIconStates = ({String name, ButtonIconPosition position});
