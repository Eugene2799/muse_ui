import 'package:flutter/painting.dart';

class Default {
  static const int alphaEnable = 255;
  static const int alphaDisable = 128;
  static const int alphaPressed = 55;
  static const Color colorBorder = Color(0xFFebedf0);
  static const Color colorDanger = Color(0xFFea3425);
  static const Color colorFont = Color(0xFF323233);
  static const Color colorFontGray = Color(0xFF969799);
  static const Color colorInfo = Color(0xFF1989fa);
  static const Color colorPrimary = Color(0xFF07c160);
  static const Color colorWarning = Color(0xFFff976a);
  static const double fontSize = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeMini = 10.1;
  static const double fontSizeSmall = 12.0;
  static const double gap = 4.0;
  static const double radius = 2.0;
  static const double radiusRound = 999.0;
  static const double radiusSquare = 0.0;
  static const textAlign = TextAlign.justify;

  static TextStyle textStyle({double size = fontSize, color = colorFont}) {
    return TextStyle(fontSize: size, color: color);
  }
}
