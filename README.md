# flutter_opencv

A Flutter plug-in providing a binding to OpenCV-4.x.

[![Pub](https://img.shields.io/pub/v/opencv.svg)](https://pub.dartlang.org/packages/opencv)

[![Flutter OpenCV](https://i.imgur.com/A2JbAq4.jpg)](https://pub.dartlang.org/packages/opencv)

## Usage

### Installation

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  opencv: "^1.0.6"
```

In your library add the following import:

```dart
import 'package:opencv/opencv.dart';
```

### Example

#### Basic Usage
String output specifying success/failure.
```dart
String path = "/path/to/file/on/disk";
```

#### Loading
Add flutter_cache_manager or any other dependency you'd like:
```yaml
dependencies:
  ...
  flutter_cache_manager: "^1.1.3"
```
And in dart code
```dart
String url = "";
```


## Getting started

### With Flutter OpenCV
See the `example` directory for a complete sample app using Flutter OpenCV.

### With Flutter
For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Notes
 * iOS not supported currently.

## Todos
   - [ ] Write tests

## Changelog

Please see the [Changelog](https://github.com/AdityaMulgundkar/flutter_opencv/blob/master/CHANGELOG.md) page to know what's recently changed.

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/AdityaMulgundkar/flutter_opencv/issues).  
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/AdityaMulgundkar/flutter_opencv/pulls).
