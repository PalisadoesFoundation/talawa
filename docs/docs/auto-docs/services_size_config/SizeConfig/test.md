:::::: {#dartdoc-main-content .main-content above-sidebar="services_size_config/SizeConfig-class-sidebar.html" below-sidebar=""}
<div>

# [test]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [test]{.name}()
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void test() {
  _mediaQueryData =
      const MediaQueryData(size: Size(360, 684), padding: EdgeInsets.zero);
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
4.  test method

##### SizeConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
