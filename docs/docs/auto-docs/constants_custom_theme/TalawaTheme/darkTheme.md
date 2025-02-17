
<div>

# darkTheme property

</div>


[ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)
darkTheme


final




Theme for dark mode.



## Implementation

``` language-dart
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
    onSecondary: Colors.white,
    secondaryContainer: _lightScaffoldColor,
    tertiary: Colors.white70,
    tertiaryContainer: Color.fromARGB(255, 61, 61, 61),
  ).copyWith(secondary: _darkAccentColor),
);
```







1.  [talawa](../../index.md)
2.  [custom_theme](../../constants_custom_theme/)
3.  [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.md)
4.  darkTheme property

##### TalawaTheme class







