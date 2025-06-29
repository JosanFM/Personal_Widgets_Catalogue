import 'package:flutter/material.dart';

class AppTheme {
  // Color fijo: azul primario de Material Design
  static const Color fixedColor = Colors.blueAccent;

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: fixedColor, // Color constante
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );
}