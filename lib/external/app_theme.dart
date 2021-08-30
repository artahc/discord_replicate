import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeData = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Color(0xff202226),
    colorScheme: ColorScheme.dark(
      primary: Color(0xff303136),
      secondary: Color(0xff363940),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff17191c),
    ),

    iconTheme: IconThemeData(
      color: Color(0xffb9bbbe),
      size: 16,
    ),
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Color(0xffffffff),
        fontSize: 22,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Color(0xffffffff),
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Color(0xffffffff),
        fontSize: 14,
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        color: Color(0xffffffff),
        fontSize: 12,
        fontStyle: FontStyle.normal,
      ),
    ),

    accentTextTheme: TextTheme(
      subtitle1: TextStyle(
        color: Color(0xff72767b),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        color: Color(0xff72767b),
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        color: Color(0xff72767b),
        fontSize: 12,
        fontStyle: FontStyle.normal,
      ),
    ),
  );

  static final lightThemeData = ThemeData();
}
