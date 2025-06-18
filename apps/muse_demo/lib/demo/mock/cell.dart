import 'package:muse_demo/shared/types.dart';
import 'package:muse_ui/cell/muse_cell.dart';

List<DemoList> mockCell = [
  (
    title: "基础用法",
    list: [
      MuseCell(title: '单元格', value: '内容'),
      MuseCell(title: '单元格', value: '内容', label: '描述信息',border: false,),
    ],
  ),
  (
    title: "垂直居中",
    list: [MuseCell(title: '单元格', center: true, value: '内容', label: '描述信息')],
  ),
];
