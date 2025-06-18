import 'package:flutter/material.dart';
import 'package:muse_demo/shared/types.dart';
import 'package:muse_demo/widgets/list_item.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({
    super.key,
    required this.title,
    required this.list,
    this.padding,
  });

  final String title;
  final List<DemoList> list;
  final double? padding;

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 15.0),
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.list[index];
          return ListItem(
            title: item.title,
            padding: widget.padding,
            children: item.list,
          );
        },
      ),
    );
  }
}
