
<div>

# lightTheme property

</div>


[ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)
lightTheme


final




Theme for light mode.



## Implementation

``` language-dart
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
    onSecondary: Colors.black,
    secondaryContainer: _darkScaffoldColor,
    tertiary: Colors.black26,
    tertiaryContainer: Color.fromARGB(255, 231, 231, 231),
  ).copyWith(secondary: _lightAccentColor),
);
```







1.  [talawa](../../index.html)
2.  [custom_theme](../../constants_custom_theme/)
3.  [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.html)
4.  lightTheme property

##### TalawaTheme class







