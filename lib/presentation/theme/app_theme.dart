import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeData = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: const Color(0xff202226),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Color(0xff303136),
      secondary: Color(0xff363940),
      onPrimary: Color(0xffb9bbbe),
      onSecondary: Color(0xff73767d),
      // onSurface: Color(0xffb9bbbe),
    ),
    textTheme: const TextTheme(
      headline5: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      subtitle2: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 16,
        letterSpacing: 0.5,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 14,
        letterSpacing: 0.25,
        height: 1.5,
      ),
      caption: TextStyle(
        color: Colors.white,
        fontSize: 12,
        letterSpacing: 0.4,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xffb9bbbe),
      size: 16,
    ),
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.dark(
        primary: Color(0xff7289da),
        secondary: Color(0xff72767b),
        // surface: Color(0xff363940),
        onPrimary: Colors.white,
        onSecondary: Color(0xff575b64),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff17191c),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff7289da),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      focusedBorder: InputBorder.none,
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelStyle: TextStyle(
        height: 0.7,
        fontSize: 14,
        color: Color(0xffb9bbbe),
        overflow: TextOverflow.ellipsis,
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        color: Color(0xff72767b),
        overflow: TextOverflow.ellipsis,
      ),
      hintStyle: TextStyle(
        fontSize: 16,
        color: Color(0xff72767b),
        overflow: TextOverflow.ellipsis,
      ),
    ),
    splashFactory: InkRipple.splashFactory,
  );

  static final lightThemeData = ThemeData();
}
