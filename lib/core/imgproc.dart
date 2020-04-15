import 'dart:typed_data';

import 'package:flutter/services.dart';

class ImgProc {
  static const MethodChannel _channel = const MethodChannel('opencv');

  static final int threshBinary = 0,
      threshBinaryInv = 1,
      threshTrunc = 2,
      threshToZero = 3,
      threshToZeroInv = 4,
      threshMask = 7,
      threshOTSU = 8,
      threshTriangle = 16;

  // C++: enum MorphTypes
  static final int morphErode = 0,
      morphDilate = 1,
      morphOpen = 2,
      morphClose = 3,
      morphGradient = 4,
      morphTopHat = 5,
      morphBlackHat = 6,
      morphHitMiss = 7;

  static final int houghStandard = 0,
      houghProbabilistic = 1,
      houghMultiScale = 2,
      houghGradient = 3;

  static final int colorMapAutumn = 0,
      colorMapBone = 1,
      colorMapJet = 2,
      colorMapWinter = 3,
      colorMapRainbow = 4,
      colorMapOcean = 5,
      colorMapSummer = 6,
      colorMapSpring = 7,
      colorMapCool = 8,
      colorMapHSV = 9,
      colorMapPink = 10,
      colorMapHot = 11,
      colorMapParula = 12,
      colorMapMagma = 13,
      colorMapInferno = 14,
      colorMapPlasma = 15,
      colorMapViridis = 16,
      colorMapCividis = 17,
      colorMapTwilight = 18,
      colorMapTwilightShifted = 19,
      colorMapTurbo = 20;

  /// Function takes input file's byte array data & color type.
  static Future<dynamic> cvtColor(Uint8List byteData, int colorType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'cvtColor', {'byteData': byteData, 'colorType': colorType});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data, size of the kernel box, the anchor point of the kernel & border type.
  static Future<dynamic> blur(Uint8List byteData, List<double> kernelSize,
      List<double> anchorPoint, int borderType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('blur', {
      'byteData': byteData,
      'kernelSize': kernelSize,
      'anchorPoint': anchorPoint,
      'borderType': borderType
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data, size of the kernel box & SigmaX (intensity value).
  static Future<dynamic> gaussianBlur(
      Uint8List byteData, List<double> kernelSize, double sigmaX) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('GaussianBlur',
        {'byteData': byteData, 'kernelSize': kernelSize, 'sigmaX': sigmaX});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> medianBlur(Uint8List byteData, int kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'medianBlur', {'byteData': byteData, 'kernelSize': kernelSize});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> bilateralFilter(Uint8List byteData, int diameter,
      int sigmaColor, int sigmaSpace, int borderType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('bilateralFilter', {
      'byteData': byteData,
      'diameter': diameter,
      'sigmaColor': sigmaColor,
      'sigmaSpace': sigmaSpace,
      'borderType': borderType
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> boxFilter(
      Uint8List byteData,
      int outputDepth,
      List<double> kernelSize,
      List<double> anchorPoint,
      bool normalize,
      int borderType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('boxFilter', {
      'byteData': byteData,
      'outputDepth': outputDepth,
      'kernelSize': kernelSize,
      'anchorPoint': anchorPoint,
      'normalize': normalize,
      'borderType': borderType
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> sqrBoxFilter(
      Uint8List byteData, int outputDepth, List<double> kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('sqrBoxFilter', {
      'byteData': byteData,
      'outputDepth': outputDepth,
      'kernelSize': kernelSize
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> filter2D(
      Uint8List byteData, int outputDepth, List<int> kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('filter2D', {
      'byteData': byteData,
      'outputDepth': outputDepth,
      'kernelSize': kernelSize
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> dilate(
      Uint8List byteData, List<int> kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'dilate', {'byteData': byteData, 'kernelSize': kernelSize});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> erode(Uint8List byteData, List<int> kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'erode', {'byteData': byteData, 'kernelSize': kernelSize});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> morphologyEx(
      Uint8List byteData, int operation, List<int> kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('morphologyEx', {
      'byteData': byteData,
      'operation': operation,
      'kernelSize': kernelSize
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> pyrUp(
      Uint8List byteData, List<int> kernelSize, int borderType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('pyrUp', {
      'byteData': byteData,
      'kernelSize': kernelSize,
      'borderType': borderType
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> pyrDown(
      Uint8List byteData, List<int> kernelSize, int borderType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('pyrDown', {
      'byteData': byteData,
      'kernelSize': kernelSize,
      'borderType': borderType
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  static Future<dynamic> pyrMeanShiftFiltering(Uint8List byteData,
      double spatialWindowRadius, double colorWindowRadius) async {
    /// Variable to store operation result
    final dynamic result =
        await _channel.invokeMethod('pyrMeanShiftFiltering', {
      'byteData': byteData,
      'spatialWindowRadius': spatialWindowRadius,
      'colorWindowRadius': colorWindowRadius
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's path & location choice
  static Future<dynamic> threshold(Uint8List byteData, double thresholdValue,
      double maxThresholdValue, int thresholdType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('threshold', {
      'byteData': byteData,
      'thresholdValue': thresholdValue,
      'maxThresholdValue': maxThresholdValue,
      'thresholdType': thresholdType
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  /// Function takes input file's path & location choice
  static Future<dynamic> adaptiveThreshold(
      Uint8List byteData,
      double maxValue,
      int adaptiveMethod,
      int thresholdType,
      int blockSize,
      double constantValue) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('adaptiveThreshold', {
      'byteData': byteData,
      'maxValue': maxValue,
      'adaptiveMethod': adaptiveMethod,
      'thresholdType': thresholdType,
      'blockSize': blockSize,
      'constantValue': constantValue
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  static Future<dynamic> copyMakeBorder(Uint8List byteData, int top, int bottom,
      int left, int right, int borderType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('copyMakeBorder', {
      'byteData': byteData,
      'top': top,
      'bottom': bottom,
      'left': left,
      'right': right,
      'borderType': borderType
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  static Future<dynamic> sobel(
      Uint8List byteData, int depth, int dx, int dy) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'Sobel', {'byteData': byteData, 'depth': depth, 'dx': dx, 'dy': dy});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  static Future<dynamic> scharr(
      Uint8List byteData, int depth, int dx, int dy) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'Scharr', {'byteData': byteData, 'depth': depth, 'dx': dx, 'dy': dy});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  static Future<dynamic> laplacian(Uint8List byteData, int depth) async {
    /// Variable to store operation result
    final dynamic result = await _channel
        .invokeMethod('Laplacian', {'byteData': byteData, 'depth': depth});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  static Future<dynamic> distanceTransform(
      Uint8List byteData, int distanceType, int maskSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('distanceTransform', {
      'byteData': byteData,
      'distanceType': distanceType,
      'maskSize': maskSize
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

//  static Future<dynamic> warpAffine() async {}

  static Future<dynamic> resize(Uint8List byteData, List<int> outputSize,
      double fx, double fy, int interpolation) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('resize', {
      'byteData': byteData,
      'outputSize': outputSize,
      'fx': fx,
      'fy': fy,
      'interpolation': interpolation
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }

  static Future<dynamic> applyColorMap(Uint8List byteData, int colorMap) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'applyColorMap', {'byteData': byteData, 'colorMap': colorMap});

    /// Function returns the set String as result, use for debugging
    return result;
  }

  static Future<dynamic> canny(
      Uint8List byteData, double threshold1, double threshold2) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('Canny', {
      'byteData': byteData,
      'threshold1': threshold1,
      'threshold2': threshold2
    });

    /// Function returns the set String as result, use for debugging
    return result;
  }
}
