import 'package:flutter/material.dart';
import 'package:muse_demo/demo/data.dart';
import 'package:muse_demo/shared/types.dart';
import 'package:muse_demo/widgets/list_item.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DemoList> indexList = indexData(context);

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: indexList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = indexList[index];
          return ListItem(
            title: item.title,
            runSpacing: 14,
            children: item.list,
          );
        },
      ),
    );
  }
}
