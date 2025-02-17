::::::::: {#dartdoc-main-content .main-content above-sidebar="custom_painters_language_icon/LanguageIcon-class-sidebar.html" below-sidebar=""}
<div>

# [shouldRepaint]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype}
[shouldRepaint]{.name}(

1.  [covariant
    [[CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.html)]{.type-annotation}
    [oldDelegate]{.parameter-name}]{#shouldRepaint-param-oldDelegate
    .parameter}

)

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Called whenever a new instance of the custom painter delegate class is
provided to the
[RenderCustomPaint](https://api.flutter.dev/flutter/rendering/RenderCustomPaint-class.html)
object, or any time that a new
[CustomPaint](https://api.flutter.dev/flutter/widgets/CustomPaint-class.html)
object is created with a new instance of the custom painter delegate
class (which amounts to the same thing, because the latter is
implemented in terms of the former).

If the new instance represents different information than the old
instance, then the method should return true, otherwise it should return
false.

If the method returns false, then the
[paint](../../custom_painters_language_icon/LanguageIcon/paint.html)
call might be optimized away.

It\'s possible that the
[paint](../../custom_painters_language_icon/LanguageIcon/paint.html)
method will get called even if
[shouldRepaint](../../custom_painters_language_icon/LanguageIcon/shouldRepaint.html)
returns false (e.g. if an ancestor or descendant needed to be
repainted). It\'s also possible that the
[paint](../../custom_painters_language_icon/LanguageIcon/paint.html)
method will get called without
[shouldRepaint](../../custom_painters_language_icon/LanguageIcon/shouldRepaint.html)
being called at all (e.g. if the box changes size).

If a custom delegate has a particularly expensive paint function such
that repaints should be avoided as much as possible, a
[RepaintBoundary](https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html)
or
[RenderRepaintBoundary](https://api.flutter.dev/flutter/rendering/RenderRepaintBoundary-class.html)
(or other render object with
[RenderObject.isRepaintBoundary](https://api.flutter.dev/flutter/rendering/RenderObject/isRepaintBoundary.html)
set to true) might be helpful.

The `oldDelegate` argument will never be null.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [language_icon](../../custom_painters_language_icon/)
3.  [LanguageIcon](../../custom_painters_language_icon/LanguageIcon-class.html)
4.  shouldRepaint method

##### LanguageIcon class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
