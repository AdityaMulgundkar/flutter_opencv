import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:opencv4/opencv4.dart';
import 'package:opencv4/core/helpers.dart';
import 'package:opencv4/core/core.dart';
import 'package:image/image.dart' as img; //So that this does not conflict with the Image widget

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _status = 'Unknown';
  dynamic res;
  Image image = Image.asset('assets/temp.png');
  Image imageNew = Image.asset('assets/temp.png');
  var file;
  double _value = 100;
  bool preloaded = false;
  bool loaded = false;
  String _URL = "https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/shutterstock_199419065.jpg";

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
      platformVersion = await OpenCV4.platformVersion;
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
  Future<void> threshold() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      //file = await DefaultCacheManager().getSingleFile(_URL);
      //res = await ImgProc.threshold(await file.readAsBytes(), _value, 255, ImgProc.CV_THRESH_BINARY);
      res = await ImgProc.blur(await file.readAsBytes(), [50,50], [50,50], Core.BORDER_REFLECT);
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

            Center(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _value = _value;
                  });
                  threshold();
                },
                child: Text('Run'),
              ),
            ),

            Text("Before"),
            preloaded?image:Text("waiting"),
            Slider(
              min: 0,
              max: 255,
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
                threshold();
              },
            ),
            Text("After"),
            loaded?imageNew:Text("waiting")
          ],
        )
      ),
    );
  }
}
