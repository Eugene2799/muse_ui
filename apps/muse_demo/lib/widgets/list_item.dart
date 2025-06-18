import 'package:flutter/material.dart';

import '../shared/styles.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.title,
    required this.children,
    this.runSpacing = 4.0,
  });

  final String title;

  final List<Widget> children;

  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: subtitleStyle),
        SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: runSpacing,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: children,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
