import 'package:flutter/material.dart';

class TalawaTheme {
  static const Color _lightCursorColor = Color(0xff34AD64);
  static const Color _lightAccentColor = Color(0xff34AD64);
  static const Color _lightScaffoldColor = Colors.white;
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Color(0xFFe5e5e5);
  static const Color _lightIconColor = Color(0xff8C8E8D);

  static const Color _darkCursorColor = Color(0xff34AD64);
  static const Color _darkAccentColor = Color(0xff34AD64);
  static const Color _darkScaffoldColor = Color(0xff18191A);
  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkIconColor = Colors.white70;

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightScaffoldColor,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: _lightCursorColor,
      ),
      primaryColor: _lightPrimaryColor,
      colorScheme:
          const ColorScheme.light(primaryVariant: _lightPrimaryVariantColor),
      accentColor: _lightAccentColor,
      iconTheme: const IconThemeData(
        color: _lightIconColor,
      ),
      fontFamily: 'product-sans',
      textTheme: _lightTextTheme);

  static final darkTheme = ThemeData(
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: _darkCursorColor,
      ),
      scaffoldBackgroundColor: _darkScaffoldColor,
      primaryColor: _darkPrimaryColor,
      colorScheme:
          const ColorScheme.dark(primaryVariant: _darkPrimaryVariantColor),
      iconTheme: const IconThemeData(
        color: _darkIconColor,
      ),
      accentColor: _darkAccentColor,
      fontFamily: 'product-sans',
      textTheme: _darkTextTheme);

  static const TextTheme _lightTextTheme = TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 26,
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.black87,
      ));

  static const TextTheme _darkTextTheme = TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 26,
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Colors.white70,
      ));
}
