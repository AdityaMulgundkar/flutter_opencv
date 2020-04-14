import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:opencv4/core/helpers.dart';

class ImgProc {
  static const MethodChannel _channel = const MethodChannel('opencv4');

  static final int
      CV_THRESH_BINARY = 0,
      CV_THRESH_BINARY_INV = 1,
      CV_THRESH_TRUNC = 2,
      CV_THRESH_TOZERO = 3,
      CV_THRESH_TOZERO_INV = 4,
      CV_THRESH_MASK = 7,
      CV_THRESH_OTSU = 8,
      CV_THRESH_TRIANGLE = 16;

  /// Function takes input file's byte array data, size of the kernel box, the anchor point of the kernel & border type.
  static Future<dynamic> blur(Uint8List byteData, List<double> kernelSize, List<double> anchorPoint, int borderType) async {
    /// Variable to store operation result
    final dynamic result = await _channel
        .invokeMethod('blur', {'byteData': byteData, 'kernelSize': kernelSize, 'anchorPoint': anchorPoint, 'borderType': borderType});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  static Future<dynamic> gaussianBlur() async {}

  static Future<dynamic> medianBlur() async {}

  static Future<dynamic> bilateralFilter() async {}

  static Future<dynamic> boxFilter() async {}

  static Future<dynamic> sqrBoxFilter() async {}

  static Future<dynamic> filter2D() async {}

  static Future<dynamic> dilate() async {}

  static Future<dynamic> erode() async {}

  static Future<dynamic> morphologyEx() async {}

  static Future<dynamic> pyrUp() async {}

  static Future<dynamic> pyrDown() async {}

  static Future<dynamic> pyrMeanShiftFiltering() async {}

  /// Function takes input file's path & location choice
  static Future<dynamic> threshold(Uint8List byteData, double thresholdValue, double maxThresholdValue, int thresholdType) async {
    /// Variable to store operation result
    final dynamic result = await _channel
        .invokeMethod('threshold', {'byteData': byteData, 'thresholdValue': thresholdValue, 'maxThresholdValue': maxThresholdValue, 'thresholdType': thresholdType});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  static Future<dynamic> adaptiveThreshold() async {}

  static Future<dynamic> copyMakeBorder() async {}

  static Future<dynamic> Sobel() async {}

  static Future<dynamic> Scharr() async {}

  static Future<dynamic> Laplacian() async {}

  static Future<dynamic> distanceTransform() async {}

  static Future<dynamic> warpAffine() async {}

  static Future<dynamic> resize() async {}

  static Future<dynamic> applyColorMap() async {}

  static Future<dynamic> Canny() async {}

  static Future<dynamic> HoughLines() async {}

  static Future<dynamic> equalizeHist() async {}

}
