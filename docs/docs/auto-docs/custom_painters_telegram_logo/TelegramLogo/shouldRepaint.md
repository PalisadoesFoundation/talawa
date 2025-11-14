<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [custom_painters/telegram_logo.dart](../../custom_painters_telegram_logo/)
3.  [TelegramLogo](../../custom_painters_telegram_logo/TelegramLogo-class.md)
4.  shouldRepaint method

<div class="self-name">

shouldRepaint

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="custom_painters_telegram_logo/TelegramLogo-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">shouldRepaint</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>
<span class="name">shouldRepaint</span>(

1.  <span id="shouldRepaint-param-oldDelegate"
    class="parameter">covariant
    <span class="type-annotation">[CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.md)</span>
    <span class="parameter-name">oldDelegate</span></span>

)

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

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
[paint](../../custom_painters_telegram_logo/TelegramLogo/paint.md)
call might be optimized away.

It's possible that the
[paint](../../custom_painters_telegram_logo/TelegramLogo/paint.md)
method will get called even if
[shouldRepaint](../../custom_painters_telegram_logo/TelegramLogo/shouldRepaint.md)
returns false (e.g. if an ancestor or descendant needed to be
repainted). It's also possible that the
[paint](../../custom_painters_telegram_logo/TelegramLogo/paint.md)
method will get called without
[shouldRepaint](../../custom_painters_telegram_logo/TelegramLogo/shouldRepaint.md)
being called at all (e.g. if the box changes size).

If a custom delegate has a particularly expensive paint function such
that repaints should be avoided as much as possible, a
[RepaintBoundary](https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html)
or
[RenderRepaintBoundary](https://api.flutter.dev/flutter/rendering/RenderRepaintBoundary-class.html)
(or other render object with
[RenderObject.isRepaintBoundary](https://api.flutter.dev/flutter/rendering/RenderObject/isRepaintBoundary.md)
set to true) might be helpful.

The `oldDelegate` argument will never be null.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
bool shouldRepaint(covariant CustomPainter oldDelegate) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [telegram_logo](../../custom_painters_telegram_logo/)
3.  [TelegramLogo](../../custom_painters_telegram_logo/TelegramLogo-class.md)
4.  shouldRepaint method

##### TelegramLogo class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
