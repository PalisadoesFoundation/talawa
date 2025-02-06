


# darkTheme property







[ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html) darkTheme
  
_<span class="feature">final</span>_






## Implementation

```dart
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
```







