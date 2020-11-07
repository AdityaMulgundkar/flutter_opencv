/*
 * flutter_opencv
 * https://mulgundkar.com
 * 
 * Copyright (c) 2020 Aditya Mulgundkar. All rights reserved.
 * See LICENSE for more details.
 */

class Core {
  /// C++: enum BorderTypes
  static final int borderConstant = 0,
      borderReplicate = 1,
      borderReflect = 2,
      borderWrap = 3,
      borderReflect101 = 4,
      borderTransparent = 5,
      borderDefault = borderReflect101,
      borderIsolated = 16;
}
