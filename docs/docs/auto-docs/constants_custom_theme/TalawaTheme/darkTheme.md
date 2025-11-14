<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [constants/custom_theme.dart](../../constants_custom_theme/)
3.  [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.md)
4.  darkTheme property

<div class="self-name">

darkTheme

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="constants_custom_theme/TalawaTheme-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">darkTheme</span> property

</div>

<div class="section multi-line-signature">

[ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)
<span class="name">darkTheme</span>

<div class="features">

<span class="feature">final</span>

</div>

</div>

<div class="section desc markdown">

Theme for dark mode.

</div>

<div id="source" class="section summary source-code">

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

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [custom_theme](../../constants_custom_theme/)
3.  [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.md)
4.  darkTheme property

##### TalawaTheme class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
