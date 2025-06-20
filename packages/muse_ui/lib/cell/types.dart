import 'package:flutter/material.dart';

enum CellSize { normal, large }

enum ArrowDirection {
  up(Icons.keyboard_arrow_up_outlined),
  down(Icons.keyboard_arrow_down_outlined),
  left(Icons.keyboard_arrow_left_outlined),
  right(Icons.keyboard_arrow_right_outlined);

  final IconData icon;

  const ArrowDirection(this.icon);
}
