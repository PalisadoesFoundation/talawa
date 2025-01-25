::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [constants/custom_theme.dart](../../constants_custom_theme/)
3.  [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.html)
4.  darkTheme property

::: self-name
darkTheme
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="constants_custom_theme/TalawaTheme-class-sidebar.html" below-sidebar=""}
<div>

# [darkTheme]{.kind-property} property

</div>

::: {.section .multi-line-signature}
[ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)
[darkTheme]{.name}

::: features
[final]{.feature}
:::
:::

::: {.section .desc .markdown}
Theme for dark mode.
:::

::: {#source .section .summary .source-code}
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
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [custom_theme](../../constants_custom_theme/)
3.  [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.html)
4.  darkTheme property

##### TalawaTheme class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
