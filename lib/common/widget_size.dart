import 'package:flutter/material.dart';

/// This class simplifies accessing the height and width of the device's screen
/// using the [MediaQuery] object. It helps in creating responsive UI elements
/// by providing the current screen's dimensions.
class WidgetSize {
  final BuildContext context;

  WidgetSize(this.context);

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
}

