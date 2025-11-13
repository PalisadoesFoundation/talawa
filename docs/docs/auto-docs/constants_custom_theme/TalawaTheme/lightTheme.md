<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [constants/custom_theme.dart](../../constants_custom_theme/constants_custom_theme-library.md)
3.  [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.md)
4.  lightTheme property

<div class="self-name">

lightTheme

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="constants_custom_theme/TalawaTheme-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">lightTheme</span> property

</div>

<div class="section multi-line-signature">

ThemeData <span class="name">lightTheme</span>

<div class="features">

<span class="feature">final</span>

</div>

</div>

<div class="section desc markdown">

Theme for light mode.

</div>

<div id="source" class="section summary source-code">

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

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [custom_theme](../../constants_custom_theme/constants_custom_theme-library.md)
3.  [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.md)
4.  lightTheme property

##### TalawaTheme class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
