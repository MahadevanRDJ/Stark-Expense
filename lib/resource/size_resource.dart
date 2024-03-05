import 'dart:developer';

import 'package:flutter/cupertino.dart';

class SizeResource {
  static const int _numberOfGrid = 4;
  static int _margin = 24;
  static const int _factor = 36;

  static GridResponsive getGridResponsive(screenWidth) {
    log(screenWidth.toString());
    getResponsiveConstraints(screenWidth);
    return GridResponsive(_numberOfGrid, _margin);
  }

  static Size getSize(context) => _getSize(context);

  static BoxConstraints getResponsiveConstraints(double screenWidth) {
    final BoxConstraints containerConstraints;
    if (screenWidth >= 2400) {
      containerConstraints = const BoxConstraints.tightFor(width: 720);
      _margin = (_factor * (8));
    } else if (screenWidth >= 1900) {
      containerConstraints = const BoxConstraints.tightFor(width: 720);
      _margin = (_factor * (7));
    } else if (screenWidth >= 1400) {
      containerConstraints = const BoxConstraints.tightFor(width: 720);
      _margin = (_factor * 6);
    } else if (screenWidth >= 1200) {
      containerConstraints = const BoxConstraints.tightFor(width: 600);
      _margin = (_factor * _numberOfGrid);
    } else if (screenWidth >= 992) {
      containerConstraints = const BoxConstraints.tightFor(width: 480);
      _margin = (_factor * _numberOfGrid);
    } else if (screenWidth > 480) {
      _margin = (_factor * _numberOfGrid);
      containerConstraints = const BoxConstraints.tightFor(width: 360);
    } else {
      _margin = 24;
      containerConstraints = const BoxConstraints();
    }

    return containerConstraints;
  }
}

Size _getSize(context) {
  return MediaQuery.of(context).size;
}

class GridResponsive {
  int gridSize;
  int margin;

  GridResponsive(this.gridSize, this.margin);

  @override
  String toString() {
    return 'GridResponsive{gridSize: $gridSize, margin: $margin}';
  }
}
