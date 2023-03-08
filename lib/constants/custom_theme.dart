// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';

///This file contains various custom themes.
///For instance, lightTheme, darkTheme, _lightTextTheme, _darkTextTheme, etc.
///These are imported to other files/widgets to apply the required themes.
class TalawaTheme {
  static const Color _lightCursorColor = Color(0xff34AD64);
  static const Color _lightAccentColor = Color(0xff34AD64);
  static const Color _lightScaffoldColor = Colors.white;
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Color(0xFFe5e5e5);
  static const Color _lightIconColor = Color(0xff8C8E8D);
  static const Color _lightInBlack = Color(0xff000000);
  static const Color _lightColorSchemePrimary = Color(0xfffabc57);

  static const Color _darkCursorColor = Color(0xff34AD64);
  static const Color _darkAccentColor = Color(0xff34AD64);
  static const Color _darkScaffoldColor = Color(0xff18191A);
  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkIconColor = Colors.white70;
  static const Color _darkInWhite = Color(0xffffffff);
  static const Color _darkColorSchemePrimary = Color(0xfffabc57);

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightScaffoldColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _lightCursorColor,
    ),
    primaryColor: _lightPrimaryColor,
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    fontFamily: 'product-sans',
    textTheme: _lightTextTheme,
    inputDecorationTheme: _lightInputDecor,
    colorScheme: const ColorScheme.light(
      primaryContainer: _lightPrimaryVariantColor,
      primary: _lightColorSchemePrimary,
      secondary: Color(0xffF5F5F5),
      secondaryContainer: _darkScaffoldColor,
    ).copyWith(secondary: _lightAccentColor),
  );

  static final darkTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _darkCursorColor,
    ),
    scaffoldBackgroundColor: _darkScaffoldColor,
    primaryColor: _darkPrimaryColor,
    iconTheme: const IconThemeData(
      color: _darkIconColor,
    ),
    fontFamily: 'product-sans',
    textTheme: _darkTextTheme,
    inputDecorationTheme: _darkInputDecor,
    colorScheme: const ColorScheme.dark(
      primaryContainer: _darkPrimaryVariantColor,
      primary: _darkColorSchemePrimary,
      secondary: Colors.black,
      secondaryContainer: _lightScaffoldColor,
    ).copyWith(secondary: _darkAccentColor),
  );

  static const TextTheme _lightTextTheme = TextTheme(
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 34,
    ),
    headlineSmall: TextStyle(
      color: _lightInBlack,
      fontSize: 20,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFF737373),
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      color: Color(0xFF737373),
      fontSize: 12.0,
    ),
  );

  static const TextTheme _darkTextTheme = TextTheme(
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 34,
    ),
    headlineSmall: TextStyle(color: _darkInWhite, fontSize: 20),
    titleLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFF737373),
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      color: Color(0xFF737373),
      fontSize: 12.0,
    ),
  );

  static const InputDecorationTheme _lightInputDecor = InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF008A37)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorMaxLines: 3,
  );
  static const InputDecorationTheme _darkInputDecor = InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF008A37)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorMaxLines: 3,
  );
}
