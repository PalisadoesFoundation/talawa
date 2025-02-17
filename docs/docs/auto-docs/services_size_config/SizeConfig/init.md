:::::: {#dartdoc-main-content .main-content above-sidebar="services_size_config/SizeConfig-class-sidebar.html" below-sidebar=""}
<div>

# [init]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [init]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#init-param-context .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void init(BuildContext context) {
  _mediaQueryData = MediaQuery.of(context);
  screenWidth = _mediaQueryData.size.width;
  screenHeight = _mediaQueryData.size.height;
  blockSizeHorizontal = screenWidth! / 100;
  blockSizeVertical = screenHeight! / 100;

  _safeAreaHorizontal =
      _mediaQueryData.padding.left + _mediaQueryData.padding.right;
  _safeAreaVertical =
      _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
  safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal) / 100;
  safeBlockVertical = (screenHeight! - _safeAreaVertical) / 100;
  debugPrint("safeBlockHorizontal: $safeBlockHorizontal");
  debugPrint("safeBlockVertical: $safeBlockVertical");
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [size_config](../../services_size_config/)
3.  [SizeConfig](../../services_size_config/SizeConfig-class.html)
4.  init method

##### SizeConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
