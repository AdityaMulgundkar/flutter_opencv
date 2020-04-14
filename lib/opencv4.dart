import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';
export 'package:opencv4/core/imgproc.dart';

class OpenCV4 {
  static const MethodChannel _channel =
      const MethodChannel('opencv4');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
