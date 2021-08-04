import 'package:flutter/material.dart';

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
      colorScheme: const ColorScheme.light(
          primaryVariant: _lightPrimaryVariantColor,
          primary: _lightColorSchemePrimary,
          secondary: Color(0xffF5F5F5),
          secondaryVariant: _darkScaffoldColor),
      accentColor: _lightAccentColor,
      iconTheme: const IconThemeData(
        color: _lightIconColor,
      ),
      fontFamily: 'product-sans',
      textTheme: _lightTextTheme,
      inputDecorationTheme: _lightInputDecor);

  static final darkTheme = ThemeData(
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: _darkCursorColor,
      ),
      scaffoldBackgroundColor: _darkScaffoldColor,
      primaryColor: _darkPrimaryColor,
      colorScheme: const ColorScheme.dark(
          primaryVariant: _darkPrimaryVariantColor,
          primary: _darkColorSchemePrimary,
          secondary: Colors.black,
          secondaryVariant: _lightScaffoldColor),
      iconTheme: const IconThemeData(
        color: _darkIconColor,
      ),
      accentColor: _darkAccentColor,
      fontFamily: 'product-sans',
      textTheme: _darkTextTheme,
      inputDecorationTheme: _darkInputDecor);

  static const TextTheme _lightTextTheme = TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 34,
    ),
    headline5: TextStyle(
      color: _lightInBlack,
      fontSize: 20,
    ),
    headline6: TextStyle(
      fontSize: 16,
      color: Color(0xFF737373),
    ),
    bodyText1: TextStyle(
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
    ),
    caption: TextStyle(
        fontWeight: FontWeight.w400, color: Color(0xFF737373), fontSize: 12.0),
  );

  static const TextTheme _darkTextTheme = TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 34,
    ),
    headline5: TextStyle(color: _darkInWhite, fontSize: 20),
    headline6: TextStyle(
      fontSize: 16,
      color: Color(0xFF737373),
    ),
    bodyText1: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    caption: TextStyle(
        fontWeight: FontWeight.w400, color: Color(0xFF737373), fontSize: 12.0),
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
