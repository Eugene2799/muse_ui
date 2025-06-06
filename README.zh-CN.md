# Muse UI

简体中文 | [English](./README.md)

> 基于**Flutter**的UI组件库

这个项目是处于个人喜好和对前端的开发经验，创建了这个基于flutter的UI库项目。
项目目的是构建一套**实用**、**便捷**、**简单**的flutter UI组件库。
便于在日常繁杂的业务开发中，专注于业务功能和个性组件的开发。

* [Pub.dev Page](https://pub.dev/packages/muse_ui)
* [Github Page](https://github.com/eugene2799/muse_ui)
* [Demo Page](https://eugene2799.github.io/muse_ui/)
* [Demo code Page](https://github.com/eugene2799/muse_ui/tree/master/apps/muse_demo)

### UI Widgets
- [MuseButton Demos](https://github.com/eugene2799/muse_ui/tree/master/apps/muse_demo/lib/demos/button)
![MuseButton](http://oss.musetools.uk/pic/musebutton.png)


## Getting started
### Install muse_ui
```bash
$ flutter pub add muse_ui
```
### Import it
```dart
import 'package:muse_ui/button/muse_button.dart';
import 'package:muse_ui/button/types.dart';
```

## How to Use
### run demo project
```bash
$ cd apps/muse_demo
$ flutter pub get
$ flutter run
```

### local development
> 修改 apps/muse_demo/pubspec.yaml 中的muse_ui插件为本地路径
> 默认情况下，melos会自动指定为本地路径，无需修改


## Directory Structure
```bash
├── apps                # Examples related to Muse UI
│   └── muse_demo       Building applications using muse_ui
│
└── packages/muse       # muse_ui source code
    └── lib             muse_ui source code root
```

## License
MIT