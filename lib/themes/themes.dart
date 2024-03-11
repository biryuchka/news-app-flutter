import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade200,
  iconTheme: IconThemeData(
    color: Colors.grey.shade900,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.grey.shade400,
    iconTheme: IconThemeData(
      color: Colors.grey.shade900,
    ),
    titleTextStyle: TextStyle(
      color: Colors.grey.shade900,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.grey.shade900,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.grey.shade500,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade400, // Button color
      foregroundColor: Colors.grey.shade900, // Text color
    ),
  ),
);

ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    iconTheme: IconThemeData(
      color: Colors.grey.shade400,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.grey.shade800,
      iconTheme: IconThemeData(
        color: Colors.grey.shade400,
      ),
      titleTextStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.grey.shade400,
      ),
    ),
  cardTheme: CardTheme(
    color: Colors.grey.shade800,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade800, // Button color
      foregroundColor: Colors.grey.shade400, // Text color
    ),
  ),
);