import 'package:flutter/material.dart';

extension WidgetRender on Widget {
  Widget doesRender(bool visual) {
    return visual ? this : Container();
  }
}
