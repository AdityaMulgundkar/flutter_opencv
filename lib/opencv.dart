/*
 * flutter_opencv
 * https://mulgundkar.com
 * 
 * Copyright (c) 2020 Aditya Mulgundkar. All rights reserved.
 * See LICENSE for more details.
 */

import 'dart:async';

import 'package:flutter/services.dart';
export 'package:opencv/core/imgproc.dart';

class OpenCV {
  /// Define method channel
  static const MethodChannel _channel = const MethodChannel('opencv');

  /// Function to check working/validity of method channels
  static Future<String> get platformVersion async {
    /// String to store the version number before returning. This is just to test working/validity.
    final String version = await _channel.invokeMethod('getPlatformVersion');

    /// Function returns version number
    return version;
  }
}
