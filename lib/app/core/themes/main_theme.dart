import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: const Color.fromRGBO(145, 138, 226, 1),
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      primaryColorDark: const Color.fromRGBO(62, 62, 62, 1),
      dialogBackgroundColor: const Color.fromRGBO(194, 194, 194, 1),
      fontFamily: 'Inter',
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(233, 231, 249, 1),
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(233, 231, 249, 1),
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: 'Cocon',
          fontSize: 22,
          color: Color.fromRGBO(62, 62, 62, 1),
          fontWeight: FontWeight.w600,
          letterSpacing: 0.6,
        ),
        headline5: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(147, 147, 147, 1),
        ),
      ),
    );
  }
}
