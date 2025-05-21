import 'package:flutter/material.dart';

import '../styles.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.title, required this.children});

  final String title;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: subtitleStyle),
        SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: children,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
