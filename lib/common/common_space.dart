import 'package:flutter/material.dart';

/// Making common Spaces to use in app with widgets to decrease writing time.
///
/// [pixels] - size of space in pixels
/// [isHorizontal] - if true, makes horizontal space, otherwise vertical

Widget widgetSpace(double pixels, {bool isHorizontal = false}) {
  return Container(
    width: isHorizontal ? pixels : 0,
    height: isHorizontal ? 0 : pixels,
    color: Colors.black,
  );
}
