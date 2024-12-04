import 'package:flutter/material.dart';

class WidgetSize {
  final BuildContext context;

  WidgetSize(this.context);

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
}

