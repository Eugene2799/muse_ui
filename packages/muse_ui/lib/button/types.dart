import 'package:flutter/material.dart';
import 'package:muse_ui/shared/default.dart';

enum ButtonType {
  normal(Default.colorBorder),
  primary(Default.colorPrimary),
  info(Default.colorInfo),
  warning(Default.colorWarning),
  danger(Default.colorDanger);

  final Color color;

  const ButtonType(this.color);
}

enum ButtonBorderType {
  normal(Default.radius),
  round(Default.radiusRound),
  circle(Default.radiusRound),
  square(Default.radiusSquare);

  final double radius;

  const ButtonBorderType(this.radius);
}

enum ButtonNativeType { normal, plain, text }

enum ButtonSize {
  large(Default.fontSizeLarge, 50.0, EdgeInsets.symmetric(horizontal: 30)),
  normal(Default.fontSize, 44.0, EdgeInsets.symmetric(horizontal: 15)),
  small(Default.fontSizeSmall, 32.0, EdgeInsets.symmetric(horizontal: 8)),
  mini(Default.fontSizeMini, 24.0, EdgeInsets.symmetric(horizontal: 0));

  final double size;
  final double height;
  final EdgeInsetsGeometry padding;

  const ButtonSize(this.size, this.height, this.padding);
}

typedef MainAxisSet = ({MainAxisSize? size, MainAxisAlignment? alignment});

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
      IconAlignment? iconPosition,
    });
