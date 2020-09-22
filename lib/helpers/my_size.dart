import 'package:flutter/material.dart';

class MySize {
  static final percentWidth = (BuildContext context, double percent) =>
      MediaQuery.of(context).size.width * percent;
  static final percentHeight = (BuildContext context, double percent) =>
      MediaQuery.of(context).size.height * percent;
  static final fullWidth =
      (BuildContext context) => MediaQuery.of(context).size.width;
  static final fullHeight =
      (BuildContext context) => MediaQuery.of(context).size.height;
}
