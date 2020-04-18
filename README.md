# flutter_opencv

A Flutter plug-in providing a binding to OpenCV-4.x.

[![Pub](https://img.shields.io/pub/v/opencv.svg)](https://pub.dartlang.org/packages/opencv)
[![Docs flutter-opencv.readthedocs.io](https://img.shields.io/website-up-down-green-red/http/flutter-opencv.readthedocs.io.svg)](https://flutter-opencv.readthedocs.io/)
[![Build Status](https://travis-ci.org/AdityaMulgundkar/flutter_opencv.svg?branch=master)](https://travis-ci.org/AdityaMulgundkar/flutter_opencv)
[![Code Coverage](https://codecov.io/gh/AdityaMulgundkar/flutter_opencv/branch/master/graph/badge.svg)](https://codecov.io/gh/AdityaMulgundkar/flutter_opencv)
[![GitHub license](https://img.shields.io/github/license/AdityaMulgundkar/flutter_opencv.svg)](https://github.com/AdityaMulgundkar/flutter_opencv/blob/master/LICENSE)

[![Flutter OpenCV](https://media.giphy.com/media/M9UOQmSYQrWgOkYqO8/giphy.gif)](https://pub.dartlang.org/packages/opencv)

## Usage

### Installation

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  opencv: "^1.0.2"
```

In your library add the following import:

```dart
import 'package:opencv/opencv.dart';
```

### Examples

#### Core concepts
All functions are currently contained in the ImgProc class.
e.g. `ImgProc.blur(...)`

Variables for integer choices (read pre-defined values/enums for border types, threshold types, etc.) are stored in ImgProc & Core classes, exactly similar to how OpenCV itself does.
However, these variables are renamed to suit the lowerCamelCase Dart fashion (just to objectively not lose "health suggestion points" on pub.dev.

i.e. One of the border types is `Core.BORDER_REFLECT`,
can be used in `ImgProc.blur(someBytes, someIntArray, someIntArray, Core.borderReflect);`

So, if you refer to the OpenCV docs or a tutorial, the function you're implementing in OpenCV is very much identical to that in flutter_opencv.

The only difference is how the data is managed - OpenCV uses the Mat class to store every image as a matrix.

flutter_opencv instead only works on data as an array of bytes.

#### Basic usage
The only difference in OpenCV's methods and ours - OpenCV functions take values of the source & destination matrices by reference. In Flutter, we use byte arrays instead of Mat() & we do not need to provide a destination byte array.

So, basically,
`someFunction(sourceMatrix, destinationMatrix, otherValue1, otherValue2, ...)` in OpenCV
is now instead
`dynamic destinationMatrix = someFunction(sourceMatrix, otherValue1, otherValue2, ...)` in flutter_opencv.

e.g.
For simple thresholding, in OpenCV, you'd do `Imgproc.threshold(sourceMatrix, destinationMatrix, 80, 255, Imgproc.THRESH_BINARY);`
Whereas in flutter_opencv you'd do `res = await ImgProc.threshold(await file.readAsBytes(), 80, 255, ImgProc.CV_THRESH_BINARY);`

#### Input images & formats
Since we're not representing images as Mat(), we're going to need the byte[] data. I'll write down methods for each (Flutter) Image class here.
For now,
1. Image from File:
`File file = await DefaultCacheManager().getSingleFile(_URL);` will fetch the file from the internet.
`await file.readAsBytes()` can be directly passed to any of the functions, since it returns a byte array.

#### Storing result, temporarily
`dynamic outputMatrix = someFunction(...)` will store a byte array in outputMatrix.

#### Output images & formats
For now,
1. Image from memory:
`Image.memory(outputMatrix)` will show the image obtained (as a byte array) from the above function.

#### Cascading functions/effects
Since you're never going to just implement one function, there's a need to be able to cascade. Inputs & outputs to all functions are common - byte arrays. Hence output from one function can directly be fed to the next.

## FAQs related to the idea/concept behind this plug-in

### Why not do a full binding?
I am actually planning to write a full binding and publish it separately later on. I understand that this implementation is lackluster & a lot of functions still need to be added. If you really need something, make a feature request.

### Why not use the core OpenCV classes like Mat?
Because I wanted to provide a simple interface - one that does not require the user to learn OpenCV or it's API. Instead, much of the way the library works is designed around Flutter/Dart, making it easier for Flutter users to pick it up.

### Does lesser functions (in comparison to a full binding) mean lower build size?
Unfortunately, no. The build size would be the same for this, or a fully bound version (which I'll work on after this project reaches certain level of maturity)

### Benchmarks?
None yet. I'm still profiling the plug-in for most use cases, and haven't faced any issues with rendering so far. Will add benchmarks soon. PR/PM me if interested.

### What OpenCV version is flutter_opencv built on top of?
As of now, the plug-in is built on top of the builds provided for OpenCV v4.1. I know that OpenCV v4.3 is out already, but an issue with the android exportable AAR file prevents me from hosting multiple versions right now.
In case you need to change your OpenCV version (read downgrade) while working with this library, you can change it the android/build.gradle file. Just change the dependency version to some other supported one for `implementation 'com.quickbirdstudios:opencv:4.1.0'`.

Please keep in mind that the above build files (AARs) are provided by someone else - https://github.com/quickbirdstudios/opencv-android. I'm grateful to these guys, but unsure of how often (and far) they would maintain the build repositories, so I'm also working on putting multiple different versions of OpenCV builds on bintray - but it's low on the priority list for now.

## Getting started

### With Flutter OpenCV
See the `example` directory for a complete sample app using Flutter OpenCV.

### With Flutter
For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Notes
 * iOS not supported currently - I do not own a Mac, so deploying for iOS will be a little slow.

## Todos
   - [x] Setup CI for docs
   - [ ] Document using Sphinx, store in `/docs`
   - [ ] List [future features](https://docs.opencv.org/2.4/index.html) in the doc
   - [ ] Create an issue template
   - [x] Document basic usage
   - [x] Setup CI for build quality/code cov
   - [ ] Document/blog about advanced usage
   - [ ] Create a feature request template
   - [ ] Write tests
   - [ ] Integrate iOS, setup projects/kanban board for iOS development
   - [ ] Build multiple OpenCV versions, host on bintray

## Changelog

Please see the [Changelog](https://github.com/AdityaMulgundkar/flutter_opencv/blob/master/CHANGELOG.md) page to know what's recently changed.

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/AdityaMulgundkar/flutter_opencv/issues).  
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/AdityaMulgundkar/flutter_opencv/pulls).

## Copyright(s)
License Agreement
For Open Source Computer Vision Library
(3-clause BSD License)  

Copyright (C) 2000-2019, Intel Corporation, all rights reserved.  
Copyright (C) 2009-2011, Willow Garage Inc., all rights reserved.  
Copyright (C) 2009-2016, NVIDIA Corporation, all rights reserved.  
Copyright (C) 2010-2013, Advanced Micro Devices, Inc., all rights reserved.  
Copyright (C) 2015-2016, OpenCV Foundation, all rights reserved.  
Copyright (C) 2015-2016, Itseez Inc., all rights reserved.  
Third party copyrights are property of their respective owners.  
  
Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:  

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.  
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.  
Neither the names of the copyright holders nor the names of the contributors may be used to endorse or promote products derived from this software without specific prior written permission.  
This software is provided by the copyright holders and contributors “as is” and any express or implied warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose are disclaimed. In no event shall copyright holders or contributors be liable for any direct, indirect, incidental, special, exemplary, or consequential damages (including, but not limited to, procurement of substitute goods or services; loss of use, data, or profits; or business interruption) however caused and on any theory of liability, whether in contract, strict liability, or tort (including negligence or otherwise) arising in any way out of the use of this software, even if advised of the possibility of such damage.
