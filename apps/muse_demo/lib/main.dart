import 'package:flutter/material.dart';
import 'package:muse_demo/styles.dart';
import 'package:muse_ui/button/button.dart';
import 'package:muse_ui/button/types.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muse UI Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          const Text('按钮类型', style: subtitleStyle),
          SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              MuseButton(text: "主要按钮", type: ButtonType.primary,click: ()=>{},),
              MuseButton(text: "信息按钮",disabled: true, type: ButtonType.info,click: ()=>{},),
              MuseButton(text: "默认按钮",click: ()=>{},),
              MuseButton(text: "危险按钮", type: ButtonType.danger,click: ()=>{},),
              MuseButton(text: "警告按钮", type: ButtonType.warning,click: ()=>{},),
            ],
          ),
          SizedBox(height: 10),
          const Text('文本类型', style: subtitleStyle),
        ],
      ),
    );
  }
}
