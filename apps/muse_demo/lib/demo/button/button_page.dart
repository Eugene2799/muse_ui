
import 'package:flutter/material.dart';
import 'package:muse_demo/shared/types.dart';
import 'package:muse_demo/widgets/list_item.dart';

import 'data.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key, required this.title});

  final String title;

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  late final List<DemoList> _buttonDemo;

  @override
  void initState() {
    super.initState();
    _buttonDemo = demoButton;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _buttonDemo.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _buttonDemo[index];
          return ListItem(title: item.title, children: item.list);
        },
      ),
    );
  }
}
