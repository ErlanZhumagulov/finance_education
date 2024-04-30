import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData yellowTheme = ThemeData(
    primaryColor: Colors.yellow, // Основной цвет (желтый)
    scaffoldBackgroundColor: Colors.yellow[50], // Цвет фона Scaffold
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black87), // Цвет основного текста
      bodyText2: TextStyle(color: Colors.black87), // Цвет вторичного текста
      button: TextStyle(color: Colors.white),      // Цвет текста кнопок
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 18.0), // Размер текста кнопок
      ),
    ),
  );
}
