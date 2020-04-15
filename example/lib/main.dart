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
  var file;
  bool preloaded = false;
  bool loaded = false;
  String _URL =
      "https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/shutterstock_199419065.jpg";
  String dropdownValue = 'None';

  @override
  void initState() {
    super.initState();
    loadImage();
    initPlatformState();
  }

  Future loadImage() async {
    file = await DefaultCacheManager().getSingleFile(_URL);
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
          res = await ImgProc.blur(await file.readAsBytes(), [45, 45], [20, 30],
              Core.BORDER_REFLECT);
          break;
        case 'GaussianBlur':
          res =
              await ImgProc.GaussianBlur(await file.readAsBytes(), [45, 45], 0);
          break;
        case 'medianBlur':
          res = await ImgProc.medianBlur(await file.readAsBytes(), 45);
          break;
        case 'bilateralFilter':
          res = await ImgProc.bilateralFilter(
              await file.readAsBytes(), 15, 80, 80, Core.BORDER_DEFAULT);
          break;
        case 'boxFilter':
          res = await ImgProc.boxFilter(await file.readAsBytes(), 50, [45, 45],
              [-1, -1], true, Core.BORDER_DEFAULT);
          break;
        case 'sqrBoxFilter':
          res =
              await ImgProc.sqrBoxFilter(await file.readAsBytes(), -1, [1, 1]);
          break;
        case 'filter2D':
          res = await ImgProc.filter2D(await file.readAsBytes(), -1, [2, 2]);
          break;
        case 'threshold':
          res = await ImgProc.threshold(
              await file.readAsBytes(), 80, 255, ImgProc.CV_THRESH_BINARY);
          break;
        case 'dilate':
          res = await ImgProc.dilate(await file.readAsBytes(), [2, 2]);
          break;
        case 'erode':
          res = await ImgProc.erode(await file.readAsBytes(), [2, 2]);
          break;
        case 'morphologyEx':
          res = await ImgProc.morphologyEx(
              await file.readAsBytes(), ImgProc.MORPH_TOPHAT, [5, 5]);
          break;
        default:
          print("No function selected");
          break;
      }

      setState(() {
        imageNew = Image.memory(res);
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
          body: Column(
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
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
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
                      'threshold',
                      'dilate',
                      'erode',
                      'morphologyEx'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  RaisedButton(
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
