




darkTheme property - TalawaTheme class - custom\_theme library - Dart API







menu

1. [talawa](../../index.html)
2. [constants/custom\_theme.dart](../../constants_custom_theme/constants_custom_theme-library.html)
3. [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.html)
4. darkTheme property

darkTheme


dark\_mode

light\_mode




# darkTheme property


[ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)
darkTheme
final

Theme for dark mode.


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [custom\_theme](../../constants_custom_theme/constants_custom_theme-library.html)
3. [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.html)
4. darkTheme property

##### TalawaTheme class





talawa
1.0.0+1






