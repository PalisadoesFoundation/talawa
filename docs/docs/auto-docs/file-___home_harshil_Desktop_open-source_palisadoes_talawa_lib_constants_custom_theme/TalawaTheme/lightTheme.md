




lightTheme property - TalawaTheme class - custom\_theme library - Dart API







menu

1. [talawa](../../index.html)
2. [constants/custom\_theme.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_custom_theme/)
3. [TalawaTheme](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_custom_theme/TalawaTheme-class.html)
4. lightTheme property

lightTheme


dark\_mode

light\_mode




# lightTheme property


dynamic
lightTheme
final

Theme for light mode.


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [custom\_theme](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_custom_theme/)
3. [TalawaTheme](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_custom_theme/TalawaTheme-class.html)
4. lightTheme property

##### TalawaTheme class





talawa
1.0.0+1






