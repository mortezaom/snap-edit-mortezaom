// create a dark them with dark colors and fontFamily: GoogleSans
import 'package:flutter/material.dart';

const fontName = 'GoogleSans';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: fontName,
  primaryColor: const Color(0xFF1C2031),
  scaffoldBackgroundColor: const Color(0xFF020520),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF020520),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: fontName,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: fontName,
    ),
    displayMedium: TextStyle(
      fontSize: 20.0,
      fontFamily: fontName,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 18.0,
      fontFamily: fontName,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 16.0,
      fontFamily: fontName,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 14.0,
      fontFamily: fontName,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 12.0,
      fontFamily: fontName,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 14.0,
      fontFamily: fontName,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 12.0,
      fontFamily: fontName,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  ),
);
