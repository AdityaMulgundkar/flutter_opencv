/*
 * flutter_opencv
 * https://mulgundkar.com
 * 
 * Copyright (c) 2020 Aditya Mulgundkar. All rights reserved.
 * See LICENSE for more details.
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:opencv/opencv.dart';
import 'package:opencv/core/core.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  dynamic res;
  Image image = Image.asset('assets/temp.png');
  Image imageNew = Image.asset('assets/temp.png');
  late File file;
  bool preloaded = false;
  bool loaded = false;

  List<String> urls = [
    "https://i.pinimg.com/564x/54/e2/ae/54e2aeefa75d031813ec56f6b3efc9ad.jpg",
    "https://raw.githubusercontent.com/opencv/opencv/master/samples/data/sudoku.png",
    "https://raw.githubusercontent.com/opencv/opencv/master/samples/data/left.jpg",
    "https://raw.githubusercontent.com/opencv/opencv/master/samples/data/left01.jpg",
    "https://raw.githubusercontent.com/opencv/opencv/master/samples/data/right01.jpg",
    "https://raw.githubusercontent.com/opencv/opencv/master/samples/data/smarties.png",
  ];
  int urlIndex = 0;
  String dropdownValue = 'None';

  @override
  void initState() {
    super.initState();
    loadImage();
    initPlatformState();
  }

  Future loadImage() async {
    file = await DefaultCacheManager().getSingleFile(urls[urlIndex]);

    if (urlIndex >= urls.length - 1) {
      urlIndex = 0;
    } else
      urlIndex++;
    setState(() {
      image = Image.file(file);
      preloaded = true;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await OpenCV.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> runAFunction(String functionName) async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      switch (functionName) {
        case 'blur':
          res = await ImgProc.blur(
              await file.readAsBytes(), [45, 45], [20, 30], Core.borderReflect);
          break;
        case 'GaussianBlur':
          res = await ImgProc.gaussianBlur(await file.readAsBytes(), [45, 45], 0);
          break;
        case 'medianBlur':
          res = await ImgProc.medianBlur(await file.readAsBytes(), 45);
          break;
        case 'bilateralFilter':
          res = await ImgProc.bilateralFilter(
              await file.readAsBytes(), 15, 80, 80, Core.borderConstant);
          break;
        case 'boxFilter':
          res = await ImgProc.boxFilter(await file.readAsBytes(), 50, [45, 45],
              [-1, -1], true, Core.borderConstant);
          break;
        case 'sqrBoxFilter':
          res = await ImgProc.sqrBoxFilter(await file.readAsBytes(), -1, [1, 1]);
          break;
        case 'filter2D':
          res = await ImgProc.filter2D(await file.readAsBytes(), -1, [2, 2]);
          break;
        case 'dilate':
          res = await ImgProc.dilate(await file.readAsBytes(), [2, 2]);
          break;
        case 'erode':
          res = await ImgProc.erode(await file.readAsBytes(), [2, 2]);
          break;
        case 'morphologyEx':
          res = await ImgProc.morphologyEx(
              await file.readAsBytes(), ImgProc.morphTopHat, [5, 5]);
          break;
        case 'pyrUp':
          res = await ImgProc.pyrUp(
              await file.readAsBytes(), [563 * 2, 375 * 2], Core.borderDefault);
          break;
        case 'pyrDown':
          res = await ImgProc.pyrDown(await file.readAsBytes(),
              [563 ~/ 2.toInt(), 375 ~/ 2.toInt()], Core.borderDefault);
          break;
        case 'pyrMeanShiftFiltering':
          res = await ImgProc.pyrMeanShiftFiltering(
              await file.readAsBytes(), 10, 15);
          break;
        case 'threshold':
          res = await ImgProc.threshold(
              await file.readAsBytes(), 80, 255, ImgProc.threshBinary);
          break;
        case 'adaptiveThreshold':
          res = await ImgProc.adaptiveThreshold(await file.readAsBytes(), 125,
              ImgProc.adaptiveThreshMeanC, ImgProc.threshBinary, 11, 12);
          break;
        case 'copyMakeBorder':
          res = await ImgProc.copyMakeBorder(
              await file.readAsBytes(), 20, 20, 20, 20, Core.borderConstant);
          break;
        case 'sobel':
          res = await ImgProc.sobel(await file.readAsBytes(), -1, 1, 1);
          break;
        case 'scharr':
          res = await ImgProc.scharr(
              await file.readAsBytes(), ImgProc.cvSCHARR, 0, 1);
          break;
        case 'laplacian':
          res = await ImgProc.laplacian(await file.readAsBytes(), 10);
          break;
        case 'distanceTransform':
          res = await ImgProc.threshold(
              await file.readAsBytes(), 80, 255, ImgProc.threshBinary);
          res = await ImgProc.distanceTransform(await res, ImgProc.distC, 3);
          break;
        case 'resize':
          res = await ImgProc.resize(
              await file.readAsBytes(), [500, 500], 0, 0, ImgProc.interArea);
          break;
        case 'applyColorMap':
          res = await ImgProc.applyColorMap(
              await file.readAsBytes(), ImgProc.colorMapHot);
          break;
        case 'houghLines':
          res = await ImgProc.canny(await file.readAsBytes(), 50, 200);
          res = await ImgProc.houghLines(await res,
              threshold: 300, lineColor: "#ff0000");
          break;
        case 'houghLinesProbabilistic':
          res = await ImgProc.canny(await file.readAsBytes(), 50, 200);
          res = await ImgProc.houghLinesProbabilistic(await res,
              threshold: 50,
              minLineLength: 50,
              maxLineGap: 10,
              lineColor: "#ff0000");
          break;
        case 'houghCircles':
          res = await ImgProc.cvtColor(await file.readAsBytes(), 6);
          res = await ImgProc.houghCircles(await res,
            method: 3,
              dp: 2.1,
              minDist: 0.1,
              param1: 150,
              param2: 100,
              minRadius: 0,
              maxRadius: 0             );
          List circlesTriplet = await ImgProc.houghCirclesCoordinates(await res,
              method: 3,
              dp: 2.1,
              minDist: 0.1,
              param1: 150,
              param2: 100,
              minRadius: 0,
              maxRadius: 0             );
          /*print('there are ${circlesTriplet.length} ');

          for(double element in circlesTriplet){
            print("circle element " + element.toString() );
          }*/
          break;
        case 'warpPerspectiveTransform':
          // 4 points are represented as:
          // P1         P2
          //
          //
          // P3         P4
          // and stored in a linear array as:
          // sourcePoints = [P1.x, P1.y, P2.x, P2.y, P3.x, P3.y, P4.x, P4.y]
          res = await ImgProc.warpPerspectiveTransform(await file.readAsBytes(),
              sourcePoints: [113, 137, 260, 137, 138, 379, 271, 340],
              destinationPoints: [0, 0, 612, 0, 0, 459, 612, 459],
              outputSize: [612, 459]);
          break;
        case 'grabCut':
          res = await ImgProc.grabCut(await file.readAsBytes(),
              px: 0, py: 0, qx: 400, qy: 400, itercount: 1);
          break;
        default:
          print("No function selected");
          break;
      }

      setState(() {
        imageNew = Image.memory(res!);
        loaded = true;
      });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              loadImage();
            },
            child: Icon(Icons.refresh),
          ),
          body: ListView(
            children: <Widget>[
              Center(
                child: Text('Running on: $_platformVersion\n'),
              ),
              Text("Before"),
              preloaded
                  ? image
                  : Text("There might be an error in loading your asset."),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      color: Colors.grey,
                      height: 2,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'None',
                      'blur',
                      'GaussianBlur',
                      'medianBlur',
                      'bilateralFilter',
                      'boxFilter',
                      'sqrBoxFilter',
                      'filter2D',
                      'dilate',
                      'erode',
                      'morphologyEx',
                      'pyrUp',
                      'pyrDown',
                      'pyrMeanShiftFiltering',
                      'threshold',
                      'adaptiveThreshold',
                      'copyMakeBorder',
                      'sobel',
                      'scharr',
                      'laplacian',
                      'distanceTransform',
                      'resize',
                      'applyColorMap',
                      'houghLines',
                      'houghLinesProbabilistic',
                      'houghCircles',
                      'warpPerspectiveTransform',
                      'grabCut'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  //RaisedButton(
                  ElevatedButton(
                      onPressed: () {
                      runAFunction(dropdownValue);
                    },
                    child: Text('Run'),
                  ),
                ],
              ),
              Text("After"),
              loaded ? imageNew : Container()
            ],
          )),
    );
  }
}
