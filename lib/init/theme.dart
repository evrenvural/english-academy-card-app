import 'package:flutter/material.dart';

class MyColors {
  static const Color PURPLE = Color(0xff48487F);
  static const Color WHITE = Colors.white;
  static const Color WHITE2 = Color(0xffF6FEFE);
  static const Color WHITE3 = Color(0xffCBC9EB);
  static const Color BLUE = Color(0xff6159FF);
  static const Color GREEN = Color(0xff178B08);
  static const Color RED = Color(0xffA71B1B);
}

final myTheme = ThemeData(
  // fontFamily: Font,
  scaffoldBackgroundColor: MyColors.PURPLE,
  appBarTheme: AppBarTheme(
    color: MyColors.PURPLE,
    brightness: Brightness.dark,
    elevation: 5.0,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: MyColors.PURPLE,
      fontSize: 36.0,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      color: MyColors.WHITE3,
      fontSize: 21.0,
    ),
    bodyText2: TextStyle(
      color: MyColors.BLUE,
      fontSize: 16.0,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: MyColors.BLUE,
    foregroundColor: MyColors.WHITE,
  ),
  // inputDecorationTheme: InputDecorationTheme()
);
