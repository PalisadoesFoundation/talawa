


# lightTheme property







[ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html) lightTheme
  
_<span class="feature">final</span>_






## Implementation

```dart
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
```







