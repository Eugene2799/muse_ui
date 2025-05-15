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

typedef ButtonColors = ({Color fontColor, Color bgColor, Color borderColor});

typedef ButtonStates =
    ({
      String? text,
      ButtonType type,
      ButtonNativeType nativeType,
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

typedef ButtonIconStates =
    ({IconData icon, IconAlignment position, double? gap});
