import 'package:flutter/material.dart';

enum ButtonType {
  normal(Color(0xFF969799)),
  primary(Color(0xFF07c160)),
  info(Color(0xFF1989fa)),
  warning(Color(0xFFff976a)),
  danger(Color(0xFFea3425));

  final Color color;

  const ButtonType(this.color);
}

enum ButtonBorderType {
  normal(2.0),
  round(999.0),
  circle(999.0),
  square(0.0);

  final double radius;

  const ButtonBorderType(this.radius);
}

enum ButtonNativeType { normal, plain, text }

enum ButtonSize {
  large(16.0, 50.0, EdgeInsets.symmetric(horizontal: 30)),
  normal(14.0, 44.0, EdgeInsets.symmetric(horizontal: 15)),
  small(12.0, 32.0, EdgeInsets.symmetric(horizontal: 8)),
  mini(10.1, 24.0, EdgeInsets.symmetric(horizontal: 0));

  final double size;
  final double height;
  final EdgeInsetsGeometry padding;

  const ButtonSize(this.size, this.height, this.padding);
}

typedef ButtonColors =
    ({Color fontColor, Color bgColor, Color borderColor, Color? iconColor});

typedef MuseButtonStyles =
    ({
      double fontSize,
      double iconSize,
      EdgeInsetsGeometry padding,
      ButtonColors colors,
      ButtonBorderType borderType,
      bool hairline,
      IconAlignment iconPosition,
    });
