::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [constants/custom_theme.dart](../../constants_custom_theme/)
3.  [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.html)
4.  lightTheme property

::: self-name
lightTheme
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="constants_custom_theme/TalawaTheme-class-sidebar.html" below-sidebar=""}
<div>

# [lightTheme]{.kind-property} property

</div>

::: {.section .multi-line-signature}
[ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)
[lightTheme]{.name}

::: features
[final]{.feature}
:::
:::

::: {.section .desc .markdown}
Theme for light mode.
:::

::: {#source .section .summary .source-code}
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
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [custom_theme](../../constants_custom_theme/)
3.  [TalawaTheme](../../constants_custom_theme/TalawaTheme-class.html)
4.  lightTheme property

##### TalawaTheme class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
