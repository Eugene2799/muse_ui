# Muse UI

English | [简体中文](./README.zh-CN.md)

> UI elements for **Flutter**

The current repository is created out of personal interest and my experience in front-end development, as a Flutter-based UI library project.

The goal of this project is to build a **practical**, **convenient**, and **simple** Flutter UI component library.

This aims to facilitate daily complex business development by focusing on business functionality and custom component development.

- [Pub.dev](https://pub.dev/packages/muse_ui)
- [Github](https://github.com/musetools/muse_ui)
- [Demo](https://musetools.github.io/muse_ui/)
- [Demo code](https://github.com/musetools/muse_ui/tree/master/apps/muse_demo)

### UI Widgets

- [MuseButton Demos](https://github.com/musetools/muse_ui/tree/main/apps/muse_demo/lib/demo/button)
  ![MuseButton](http://oss.musetools.uk/pic/button1.png)
  ![MuseButton](http://oss.musetools.uk/pic/button2.png)

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

### Use

```dart
MuseButton(
  text: "Square",
  type: ButtonType.primary,
  borderType: ButtonBorderType.square,
  click: () => {},
)
```

## License

MIT
