/*
 * flutter_opencv
 * https://mulgundkar.com
 * 
 * Copyright (c) 2020 Aditya Mulgundkar. All rights reserved.
 * See LICENSE for more details.
 */

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class ImgProc {
  /// Define method channel
  static const MethodChannel _channel = const MethodChannel('opencv');

  /// Static variable declarations
  static const int iplBorderConstant = 0,
      iplBorderReplicate = 1,
      iplBorderReflect = 2,
      iplBorderWrap = 3,
      iplBorderReflect101 = 4,
      iplBorderTransparent = 5,
      cvInternN = 0,
      cvInterLinear = 1,
      cvInterCubic = 2,
      cvInterArea = 3,
      cvInterLanczos4 = 4,
      cvMopErode = 0,
      cvMopDilate = 1,
      cvMopOpen = 2,
      cvMopClose = 3,
      cvMopGradient = 4,
      cvMopTopHat = 5,
      cvMopBlackHat = 6,
      cvRetrExternal = 0,
      cvRetrList = 1,
      cvRetrCComp = 2,
      cvRetrTree = 3,
      cvRetrFloodFill = 4,
      cvChainApproxN = 1,
      cvChainApproxsimple = 2,
      cvChainApproxTC89L1 = 3,
      cvChainApproxTC89KCOS = 4,
      cvThreshBINARY = 0,
      cvThreshBINARYINV = 1,
      cvThreshTRUNC = 2,
      cvThreshTOZERO = 3,
      cvThreshTOZEROINV = 4,
      cvThreshMASK = 7,
      cvThreshOTSU = 8,
      cvThreshTRIANGLE = 16;

  /// Hersheyfonts declarations
  static const int fontHersheySimpleX = 0,
      fontHersheyPlain = 1,
      fontHersheyDuplex = 2,
      fontHersheyComplex = 3,
      fontHersheyTriplex = 4,
      fontHersheyComplexSmall = 5,
      fontHersheyScriptSimplex = 6,
      fontHersheyScriptComplex = 7,
      fontItalic = 16;

  /// interpolationMasks declarations
  static const int interBits = 5,
      interBits2 = interBits * 2,
      interTabSize = 1 << interBits,
      interTabSize2 = interTabSize * interTabSize;

  /// MorphTypes declarations
  static const int morphErode = 0,
      morphDilate = 1,
      morphOpen = 2,
      morphClose = 3,
      morphGradient = 4,
      morphTopHat = 5,
      morphBlackHat = 6,
      morphHitMiss = 7;

  /// floodFillFlags declarations
  static const int floodFillFixedRange = 1 << 16, floodFillMaskOnly = 1 << 17;

  /// HoughModes declarations
  static const int houghSTANDARD = 0,
      houghProbabilistic = 1,
      houghMultiScale = 2,
      houghGradient = 3;

  /// ConnectedComponentsAlgorithmsTypes declarations
  static const int cclWU = 0, cclDefault = -1, cclGrana = 1;

  /// retrievalModes declarations
  static const int retrExternal = 0,
      retrList = 1,
      retrCComp = 2,
      retrTree = 3,
      retrFloodFill = 4;

  /// GrabCutClasses declarations
  static const int gcBGD = 0, gcFGD = 1, gcPRBGD = 2, gcPRFGD = 3;

  /// colormapTypes declarations
  static const int colorMapAutumn = 0,
      colorMapBone = 1,
      colorMapJet = 2,
      colorMapWinter = 3,
      colorMapRainbow = 4,
      colorMapOcean = 5,
      colorMapSummer = 6,
      colorMapSpring = 7,
      colorMapCOOL = 8,
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

  /// histCompMethods declarations
  static const int histCmpCORREL = 0,
      histCmpChiSqr = 1,
      histCmpInterSect = 2,
      histCmpBhattacharyya = 3,
      histCmpHellinger = histCmpBhattacharyya,
      histCmpChiSqrAlt = 4,
      histCmpKLDIV = 5;

  /// LineTypes declarations
  static const int filled = -1, line4 = 4, line8 = 8, lineAA = 16;

  /// interpolationFlags declarations
  static const int interNearest = 0,
      interLinear = 1,
      interCubic = 2,
      interArea = 3,
      interLancoz4 = 4,
      interLinearExact = 5,
      interMax = 7,
      interFillOutliers = 8,
      interInverseMap = 16;

  /// SpecialFilter declarations
  static const int filterScharr = -1;

  /// ContourApproximationModes declarations
  static const int chainApproxN = 1,
      chainApproxSimple = 2,
      chainApproxTC89L1 = 3,
      chainApproxTC89KCOS = 4;

  /// RectanglesIntersectTypes declarations
  static const int intersectN = 0, intersectPartial = 1, intersectFull = 2;

  /// <unnamed> declarations
  static const int cvGAUSSIAN5x5 = 7,
      cvSCHARR = -1,
      cvMAXSOBELKSIZE = 7,
      cvRGBA2mRGBA = 125,
      cvmRGBA2RGBA = 126,
      cvWARPFILLOUTLIERS = 8,
      cvWARPINVERSEMAP = 16,
      cvChainCODE = 0,
      cvLINKRUNS = 5,
      cvPOLYApproxDP = 0,
      cvCONTOURSMATCHI1 = 1,
      cvCONTOURSMATCHI2 = 2,
      cvCONTOURSMATCHI3 = 3,
      cvCLOCKWISE = 1,
      cvCOUNTERCLOCKWISE = 2,
      cvCompCORREL = 0,
      cvCompCHISQR = 1,
      cvCompINTERSECT = 2,
      cvCompBHATTACHARYYA = 3,
      cvCompHELLINGER = cvCompBHATTACHARYYA,
      cvCompCHISQRALT = 4,
      cvCompKLDIV = 5,
      cvDISTMASK3 = 3,
      cvDISTMASK5 = 5,
      cvDISTMASKPRECISE = 0,
      cvDISTLABELCComp = 0,
      cvDISTLABELPIXEL = 1,
      cvDISTUSER = -1,
      cvDISTL1 = 1,
      cvDISTL2 = 2,
      cvDISTC = 3,
      cvDISTL12 = 4,
      cvDISTFAIR = 5,
      cvDISTWELSCH = 6,
      cvDISTHUBER = 7,
      cvCANNYL2Gradient = (1 << 31),
      cvHoughSTANDARD = 0,
      cvHoughProbabilistic = 1,
      cvHoughMULTISCALE = 2,
      cvHoughGradient = 3;

  /// ShapeMatchModes declarations
  static const int contoursMatchI1 = 1,
      contoursMatchI2 = 2,
      contoursMatchI3 = 3;

  /// WarpPolarMode declarations
  static const int warpPolarLinear = 0, warpPolarLog = 256;

  /// ColorConversionCodes declarations
  static const int colorBGR2BGRA = 0,
      colorRGB2RGBA = colorBGR2BGRA,
      colorBGRA2BGR = 1,
      colorRGBA2RGB = colorBGRA2BGR,
      colorBGR2RGBA = 2,
      colorRGB2BGRA = colorBGR2RGBA,
      colorRGBA2BGR = 3,
      colorBGRA2RGB = colorRGBA2BGR,
      colorBGR2RGB = 4,
      colorRGB2BGR = colorBGR2RGB,
      colorBGRA2RGBA = 5,
      colorRGBA2BGRA = colorBGRA2RGBA,
      colorBGR2GRAY = 6,
      colorRGB2GRAY = 7,
      colorGRAY2BGR = 8,
      colorGRAY2RGB = colorGRAY2BGR,
      colorGRAY2BGRA = 9,
      colorGRAY2RGBA = colorGRAY2BGRA,
      colorBGRA2GRAY = 10,
      colorRGBA2GRAY = 11,
      colorBGR2BGR565 = 12,
      colorRGB2BGR565 = 13,
      colorBGR5652BGR = 14,
      colorBGR5652RGB = 15,
      colorBGRA2BGR565 = 16,
      colorRGBA2BGR565 = 17,
      colorBGR5652BGRA = 18,
      colorBGR5652RGBA = 19,
      colorGRAY2BGR565 = 20,
      colorBGR5652GRAY = 21,
      colorBGR2BGR555 = 22,
      colorRGB2BGR555 = 23,
      colorBGR5552BGR = 24,
      colorBGR5552RGB = 25,
      colorBGRA2BGR555 = 26,
      colorRGBA2BGR555 = 27,
      colorBGR5552BGRA = 28,
      colorBGR5552RGBA = 29,
      colorGRAY2BGR555 = 30,
      colorBGR5552GRAY = 31,
      colorBGR2XYZ = 32,
      colorRGB2XYZ = 33,
      colorXYZ2BGR = 34,
      colorXYZ2RGB = 35,
      colorBGR2YCrCb = 36,
      colorRGB2YCrCb = 37,
      colorYCrCb2BGR = 38,
      colorYCrCb2RGB = 39,
      colorBGR2HSV = 40,
      colorRGB2HSV = 41,
      colorBGR2Lab = 44,
      colorRGB2Lab = 45,
      colorBGR2Luv = 50,
      colorRGB2Luv = 51,
      colorBGR2HLS = 52,
      colorRGB2HLS = 53,
      colorHSV2BGR = 54,
      colorHSV2RGB = 55,
      colorLab2BGR = 56,
      colorLab2RGB = 57,
      colorLuv2BGR = 58,
      colorLuv2RGB = 59,
      colorHLS2BGR = 60,
      colorHLS2RGB = 61,
      colorBGR2HSVFULL = 66,
      colorRGB2HSVFULL = 67,
      colorBGR2HLSFULL = 68,
      colorRGB2HLSFULL = 69,
      colorHSV2BGRFULL = 70,
      colorHSV2RGBFULL = 71,
      colorHLS2BGRFULL = 72,
      colorHLS2RGBFULL = 73,
      colorLBGR2Lab = 74,
      colorLRGB2Lab = 75,
      colorLBGR2Luv = 76,
      colorLRGB2Luv = 77,
      colorLab2LBGR = 78,
      colorLab2LRGB = 79,
      colorLuv2LBGR = 80,
      colorLuv2LRGB = 81,
      colorBGR2YUV = 82,
      colorRGB2YUV = 83,
      colorYUV2BGR = 84,
      colorYUV2RGB = 85,
      colorYUV2RGBNV12 = 90,
      colorYUV2BGRNV12 = 91,
      colorYUV2RGBNV21 = 92,
      colorYUV2BGRNV21 = 93,
      colorYUV420sp2RGB = colorYUV2RGBNV21,
      colorYUV420sp2BGR = colorYUV2BGRNV21,
      colorYUV2RGBANV12 = 94,
      colorYUV2BGRANV12 = 95,
      colorYUV2RGBANV21 = 96,
      colorYUV2BGRANV21 = 97,
      colorYUV420sp2RGBA = colorYUV2RGBANV21,
      colorYUV420sp2BGRA = colorYUV2BGRANV21,
      colorYUV2RGBYV12 = 98,
      colorYUV2BGRYV12 = 99,
      colorYUV2RGBIYUV = 100,
      colorYUV2BGRIYUV = 101,
      colorYUV2RGBI420 = colorYUV2RGBIYUV,
      colorYUV2BGRI420 = colorYUV2BGRIYUV,
      colorYUV420p2RGB = colorYUV2RGBYV12,
      colorYUV420p2BGR = colorYUV2BGRYV12,
      colorYUV2RGBAYV12 = 102,
      colorYUV2BGRAYV12 = 103,
      colorYUV2RGBAIYUV = 104,
      colorYUV2BGRAIYUV = 105,
      colorYUV2RGBAI420 = colorYUV2RGBAIYUV,
      colorYUV2BGRAI420 = colorYUV2BGRAIYUV,
      colorYUV420p2RGBA = colorYUV2RGBAYV12,
      colorYUV420p2BGRA = colorYUV2BGRAYV12,
      colorYUV2GRAY420 = 106,
      colorYUV2GRAYNV21 = colorYUV2GRAY420,
      colorYUV2GRAYNV12 = colorYUV2GRAY420,
      colorYUV2GRAYYV12 = colorYUV2GRAY420,
      colorYUV2GRAYIYUV = colorYUV2GRAY420,
      colorYUV2GRAYI420 = colorYUV2GRAY420,
      colorYUV420sp2GRAY = colorYUV2GRAY420,
      colorYUV420p2GRAY = colorYUV2GRAY420,
      colorYUV2RGBUYVY = 107,
      colorYUV2BGRUYVY = 108,
      colorYUV2RGBY422 = colorYUV2RGBUYVY,
      colorYUV2BGRY422 = colorYUV2BGRUYVY,
      colorYUV2RGBUYNV = colorYUV2RGBUYVY,
      colorYUV2BGRUYNV = colorYUV2BGRUYVY,
      colorYUV2RGBAUYVY = 111,
      colorYUV2BGRAUYVY = 112,
      colorYUV2RGBAY422 = colorYUV2RGBAUYVY,
      colorYUV2BGRAY422 = colorYUV2BGRAUYVY,
      colorYUV2RGBAUYNV = colorYUV2RGBAUYVY,
      colorYUV2BGRAUYNV = colorYUV2BGRAUYVY,
      colorYUV2RGBYUY2 = 115,
      colorYUV2BGRYUY2 = 116,
      colorYUV2RGBYVYU = 117,
      colorYUV2BGRYVYU = 118,
      colorYUV2RGBYUYV = colorYUV2RGBYUY2,
      colorYUV2BGRYUYV = colorYUV2BGRYUY2,
      colorYUV2RGBYUNV = colorYUV2RGBYUY2,
      colorYUV2BGRYUNV = colorYUV2BGRYUY2,
      colorYUV2RGBAYUY2 = 119,
      colorYUV2BGRAYUY2 = 120,
      colorYUV2RGBAYVYU = 121,
      colorYUV2BGRAYVYU = 122,
      colorYUV2RGBAYUYV = colorYUV2RGBAYUY2,
      colorYUV2BGRAYUYV = colorYUV2BGRAYUY2,
      colorYUV2RGBAYUNV = colorYUV2RGBAYUY2,
      colorYUV2BGRAYUNV = colorYUV2BGRAYUY2,
      colorYUV2GRAYUYVY = 123,
      colorYUV2GRAYYUY2 = 124,
      colorYUV2GRAYY422 = colorYUV2GRAYUYVY,
      colorYUV2GRAYUYNV = colorYUV2GRAYUYVY,
      colorYUV2GRAYYVYU = colorYUV2GRAYYUY2,
      colorYUV2GRAYYUYV = colorYUV2GRAYYUY2,
      colorYUV2GRAYYUNV = colorYUV2GRAYYUY2,
      colorRGBA2mRGBA = 125,
      colormRGBA2RGBA = 126,
      colorRGB2YUVI420 = 127,
      colorBGR2YUVI420 = 128,
      colorRGB2YUVIYUV = colorRGB2YUVI420,
      colorBGR2YUVIYUV = colorBGR2YUVI420,
      colorRGBA2YUVI420 = 129,
      colorBGRA2YUVI420 = 130,
      colorRGBA2YUVIYUV = colorRGBA2YUVI420,
      colorBGRA2YUVIYUV = colorBGRA2YUVI420,
      colorRGB2YUVYV12 = 131,
      colorBGR2YUVYV12 = 132,
      colorRGBA2YUVYV12 = 133,
      colorBGRA2YUVYV12 = 134,
      colorBayerBG2BGR = 46,
      colorBayerGB2BGR = 47,
      colorBayerRG2BGR = 48,
      colorBayerGR2BGR = 49,
      colorBayerBG2RGB = colorBayerRG2BGR,
      colorBayerGB2RGB = colorBayerGR2BGR,
      colorBayerRG2RGB = colorBayerBG2BGR,
      colorBayerGR2RGB = colorBayerGB2BGR,
      colorBayerBG2GRAY = 86,
      colorBayerGB2GRAY = 87,
      colorBayerRG2GRAY = 88,
      colorBayerGR2GRAY = 89,
      colorBayerBG2BGRVNG = 62,
      colorBayerGB2BGRVNG = 63,
      colorBayerRG2BGRVNG = 64,
      colorBayerGR2BGRVNG = 65,
      colorBayerBG2RGBVNG = colorBayerRG2BGRVNG,
      colorBayerGB2RGBVNG = colorBayerGR2BGRVNG,
      colorBayerRG2RGBVNG = colorBayerBG2BGRVNG,
      colorBayerGR2RGBVNG = colorBayerGB2BGRVNG,
      colorBayerBG2BGREA = 135,
      colorBayerGB2BGREA = 136,
      colorBayerRG2BGREA = 137,
      colorBayerGR2BGREA = 138,
      colorBayerBG2RGBEA = colorBayerRG2BGREA,
      colorBayerGB2RGBEA = colorBayerGR2BGREA,
      colorBayerRG2RGBEA = colorBayerBG2BGREA,
      colorBayerGR2RGBEA = colorBayerGB2BGREA,
      colorBayerBG2BGRA = 139,
      colorBayerGB2BGRA = 140,
      colorBayerRG2BGRA = 141,
      colorBayerGR2BGRA = 142,
      colorBayerBG2RGBA = colorBayerRG2BGRA,
      colorBayerGB2RGBA = colorBayerGR2BGRA,
      colorBayerRG2RGBA = colorBayerBG2BGRA,
      colorBayerGR2RGBA = colorBayerGB2BGRA,
      colorColorcvTMAX = 143;

  /// LineSegmentDetectorModes declarations
  static const int lsdRefineN = 0, lsdRefineSTD = 1, lsdRefineADV = 2;

  /// thresholdTypes declarations
  static const int threshBinary = 0,
      threshBinaryInv = 1,
      threshTrunc = 2,
      threshToZero = 3,
      threshToZeroInv = 4,
      threshMask = 7,
      threshOTSU = 8,
      threshTriangle = 16;

  /// AdaptivethresholdTypes declarations
  static const int adaptiveThreshMeanC = 0, adaptiveThreshGaussianC = 1;

  /// MorphShapesc declarations
  static const int cvShapeRect = 0,
      cvShapeCross = 1,
      cvShapeEllipse = 2,
      cvShapeCustom = 100;

  /// GrabCutModes declarations
  static const int gcInitWithRect = 0,
      gcInitWithMask = 1,
      gcEVAL = 2,
      gcEvalFreezeModel = 3;

  /// MorphShapes declarations
  static const int morphRECT = 0, morphCross = 1, morphEllipse = 2;

  /// DistanceTransformLabelTypes declarations
  static const int distLabelCComp = 0, distLabelPixel = 1;

  /// DistanceTypes declarations
  static const int distUSER = -1,
      distL1 = 1,
      distL2 = 2,
      distC = 3,
      distL12 = 4,
      distFair = 5,
      distWelsch = 6,
      distHuber = 7;

  /// TemplateMatchModes declarations
  static const int tmSQDiff = 0,
      tmSQDiffNormed = 1,
      tmCCORR = 2,
      tmCCORRNormed = 3,
      tmCCOEff = 4,
      tmCCOEffNormed = 5;

  /// DistanceTransformMasks declarations
  static const int distMask3 = 3, distMask5 = 5, distMaskPrecise = 0;

  /// ConnectedComponentsTypes declarations
  static const int ccStatLeft = 0,
      ccStatTop = 1,
      ccStatWidth = 2,
      ccStatHeight = 3,
      ccStatArea = 4,
      ccStatMax = 5;

  /// SmoothMethodc declarations
  static const int cvBlurNoScale = 0,
      cvBlur = 1,
      cvGaussian = 2,
      cvMedian = 3,
      cvBilateral = 4;

  /// MarkerTypes declarations
  static const int markerCross = 0,
      markerTiltedCross = 1,
      markerStar = 2,
      markerDiamond = 3,
      markerSquare = 4,
      markerTriangleUp = 5,
      markerTriangleDown = 6;

  /// Function takes input file's byte array data & color type.
  static Future<dynamic> cvtColor(Uint8List byteData, int outputType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'cvtColor', {'byteData': byteData, 'outputType': outputType});

    /// Function returns the response from method channel
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

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, size of the kernel box & SigmaX (intensity value).
  static Future<dynamic> gaussianBlur(
      Uint8List byteData, List<double> kernelSize, double sigmaX) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('gaussianBlur',
        {'byteData': byteData, 'kernelSize': kernelSize, 'sigmaX': sigmaX});

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> medianBlur(Uint8List byteData, int kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'medianBlur', {'byteData': byteData, 'kernelSize': kernelSize});

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, diameter of the filter circle, sigma values for its color & space, & it's border type.
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

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, output depth of the filter, it's kernel size & anchor point, a boolean for normalization & it's border type.
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

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, depth of the output matrix & size of the kernel box.
  static Future<dynamic> sqrBoxFilter(
      Uint8List byteData, int outputDepth, List<double> kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('sqrBoxFilter', {
      'byteData': byteData,
      'outputDepth': outputDepth,
      'kernelSize': kernelSize
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, depth of the output matrix & size of the kernel box.
  static Future<dynamic> filter2D(
      Uint8List byteData, int outputDepth, List<int> kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('filter2D', {
      'byteData': byteData,
      'outputDepth': outputDepth,
      'kernelSize': kernelSize
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> dilate(
      Uint8List byteData, List<int> kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'dilate', {'byteData': byteData, 'kernelSize': kernelSize});

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data & size of the kernel box.
  static Future<dynamic> erode(Uint8List byteData, List<int> kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'erode', {'byteData': byteData, 'kernelSize': kernelSize});

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, type of the operation to perform & size of the kernel box.
  static Future<dynamic> morphologyEx(
      Uint8List byteData, int operation, List<int> kernelSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('morphologyEx', {
      'byteData': byteData,
      'operation': operation,
      'kernelSize': kernelSize
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, size of the kernel box & it's border type.
  static Future<dynamic> pyrUp(
      Uint8List byteData, List<int> kernelSize, int borderType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('pyrUp', {
      'byteData': byteData,
      'kernelSize': kernelSize,
      'borderType': borderType
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, size of the kernel box & it's border type.
  static Future<dynamic> pyrDown(
      Uint8List byteData, List<int> kernelSize, int borderType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('pyrDown', {
      'byteData': byteData,
      'kernelSize': kernelSize,
      'borderType': borderType
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, radius of the spatial & color windows.
  static Future<dynamic> pyrMeanShiftFiltering(Uint8List byteData,
      double spatialWindowRadius, double colorWindowRadius) async {
    /// Variable to store operation result
    final dynamic result =
        await _channel.invokeMethod('pyrMeanShiftFiltering', {
      'byteData': byteData,
      'spatialWindowRadius': spatialWindowRadius,
      'colorWindowRadius': colorWindowRadius
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, threshold value, maximum threshold value & type of threshold.
  static Future<dynamic> threshold(Uint8List byteData, double thresholdValue,
      double maxThresholdValue, int thresholdType) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('threshold', {
      'byteData': byteData,
      'thresholdValue': thresholdValue,
      'maxThresholdValue': maxThresholdValue,
      'thresholdType': thresholdType
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, maximum value of threshold, int for adaptive method type, type of threshold, size of block & a constant int value which will be subtracted from the mean.
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

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, top, bottom, left, right integer values & it's border type.
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

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, depth of destination image & order of derivative x and y values.
  static Future<dynamic> sobel(
      Uint8List byteData, int depth, int dx, int dy) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'sobel', {'byteData': byteData, 'depth': depth, 'dx': dx, 'dy': dy});

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, depth of destination image & order of derivative x and y values.
  static Future<dynamic> scharr(
      Uint8List byteData, int depth, int dx, int dy) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'scharr', {'byteData': byteData, 'depth': depth, 'dx': dx, 'dy': dy});

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data & depth of destination image.
  static Future<dynamic> laplacian(Uint8List byteData, int depth) async {
    /// Variable to store operation result
    final dynamic result = await _channel
        .invokeMethod('laplacian', {'byteData': byteData, 'depth': depth});

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, type of distance & size of mask.
  static Future<dynamic> distanceTransform(
      Uint8List byteData, int distanceType, int maskSize) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('distanceTransform', {
      'byteData': byteData,
      'distanceType': distanceType,
      'maskSize': maskSize
    });

    /// Function returns the response from method channel
    return result;
  }

//  static Future<dynamic> warpAffine() async {}

  /// Function takes input file's byte array data, output size, values of fx & fy & interpolation value.
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

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data & type of color map.
  static Future<dynamic> applyColorMap(Uint8List byteData, int colorMap) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'applyColorMap', {'byteData': byteData, 'colorMap': colorMap});

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data & the two threshold values.
  static Future<dynamic> canny(
      Uint8List byteData, double threshold1, double threshold2) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('canny', {
      'byteData': byteData,
      'threshold1': threshold1,
      'threshold2': threshold2
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, values of rho & theta, threshold value, srn & stn values & min & max theta values.
  static Future<dynamic> houghLines(Uint8List byteData,
      {double rho = 1,
      double theta = math.pi / 180,
      int threshold = 1,
      double srn = 0,
      double stn = 0,
      double minTheta = 0,
      double maxTheta = math.pi,
      String lineColor = "#ffffff",
      int lineThickness = 3,
      int lineType = line8,
      int shift = 0}) async {
    /// Variable to store operation result
    print("calling houghlines: " + math.pi.toString());
    final dynamic result = await _channel.invokeMethod('houghLines', {
      'byteData': byteData,
      'rho': rho,
      'theta': theta,
      'threshold': threshold,
      'srn': srn,
      'stn': stn,
      'minTheta': minTheta,
      'maxTheta': maxTheta,
      'lineColor': lineColor,
      'lineThickness': lineThickness,
      'lineType': lineType,
      'shift': shift,
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, values of rho & theta, threshold value, srn & stn values & min & max theta values.
  static Future<dynamic> houghLinesProbabilistic(Uint8List byteData,
      {double rho = 1,
      double theta = math.pi / 180,
      int threshold = 1,
      double minLineLength = 0,
      double maxLineGap = 0,
      String lineColor = "#ffffff",
      int lineThickness = 3,
      int lineType = line8,
      int shift = 0}) async {
    /// Variable to store operation result
    print("calling houghlines: " + math.pi.toString());
    final dynamic result =
        await _channel.invokeMethod('houghLinesProbabilistic', {
      'byteData': byteData,
      'rho': rho,
      'theta': theta,
      'threshold': threshold,
      'minLineLength': minLineLength,
      'maxLineGap': maxLineGap,
      'lineColor': lineColor,
      'lineThickness': lineThickness,
      'lineType': lineType,
      'shift': shift,
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, accumulator value dp, min distance value between two circles, method specific parameters 1 & 2,
  /// min & max radius of the circles, & optional values for the circle center width, center color, circle width & circle color.
  static Future<dynamic> houghCircles(Uint8List byteData,
      {@required int method,
      @required double dp,
      @required double minDist,
      @required double param1,
      @required double param2,
      @required int minRadius,
      @required int maxRadius,
      int centerWidth = 2,
      String centerColor = "#ff0000",
      int circleWidth = 2,
      String circleColor = "#ffffff"}) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod('houghCircles', {
      'byteData': byteData,
      'method': method,
      'dp': dp,
      'minDist': minDist,
      'param1': param1,
      'param2': param2,
      'minRadius': minRadius,
      'maxRadius': maxRadius,
      'centerWidth': centerWidth,
      'centerColor': centerColor,
      'circleWidth': circleWidth,
      'circleColor': circleColor,
    });

    /// Function returns the response from method channel
    return result;
  }

  /// Function takes input file's byte array data, source points & destination points.
  ///   4 points are represented as:
  ///   P1         P2
  ///
  ///
  ///   P3         P4
  ///   and stored in a linear array as:
  ///   sourcePoints = [P1.x, P1.y, P2.x, P2.y, P3.x, P3.y, P4.x, P4.y]
  ///   similarly for destinationPoints as well
  static Future<dynamic> warpPerspectiveTransform(Uint8List byteData,
      {@required List sourcePoints,
      @required List destinationPoints,
      @required List<double> outputSize}) async {
    /// Variable to store operation result
    final dynamic result =
        await _channel.invokeMethod('warpPerspectiveTransform', {
      'byteData': byteData,
      'sourcePoints': sourcePoints,
      'destinationPoints': destinationPoints,
      'outputSize': outputSize
    });

    /// Function returns the response from method channel
    return result;
  }

  static Future<dynamic> grabCut(Uint8List byteData, {int px = 0, int py = 0, int qx = 0, int qy = 0, int itercount = 1, int mode = 0}) async {
    /// Variable to store operation result
    final dynamic result = await _channel.invokeMethod(
        'grabCut', {'byteData': byteData, 'px': px, 'py': py, 'qx': qx, 'qy': qy, 'itercount': itercount, 'mode': mode});

    /// Function returns the set String as result, use for debugging
    return result;
  }
}
