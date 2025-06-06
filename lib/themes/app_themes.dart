import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    scaffoldBackgroundColor: Color(0xFFF4F4F4), // corregido: removido un 'F' extra en el color
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    ),
    cardColor: Colors.white,
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(Colors.green),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 12),
    ),
  );
}
