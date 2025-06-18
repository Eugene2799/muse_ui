import 'package:flutter/material.dart';

enum CellSize { normal, large }

enum ArrowDirection {
  up(Icons.keyboard_arrow_up),
  down(Icons.keyboard_arrow_down),
  left(Icons.arrow_back_ios_new),
  right(Icons.arrow_forward_ios);

  final IconData icon;

  const ArrowDirection(this.icon);
}

