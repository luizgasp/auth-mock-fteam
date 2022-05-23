import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: const Color.fromRGBO(145, 138, 226, 1),
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      primaryColorDark: const Color.fromRGBO(62, 62, 62, 1),
      dialogBackgroundColor: const Color.fromRGBO(194, 194, 194, 1),
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: 'Cocon',
          fontSize: 22,
          color: Color.fromRGBO(62, 62, 62, 1),
          fontWeight: FontWeight.w600,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
