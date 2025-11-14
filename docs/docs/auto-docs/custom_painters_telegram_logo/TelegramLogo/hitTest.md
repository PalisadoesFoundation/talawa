<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [telegram_logo](../../custom_painters_telegram_logo/custom_painters_telegram_logo-library.md)
3.  [TelegramLogo](../../custom_painters_telegram_logo/TelegramLogo-class.md)
4.  hitTest method

<div class="self-name">

hitTest

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="custom_painters_telegram_logo/TelegramLogo-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">hitTest</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>
<span class="name">hitTest</span>(

1.  <span id="hitTest-param-position"
    class="parameter"><span class="type-annotation">[Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.md)</span>
    <span class="parameter-name">position</span></span>

)

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Called whenever a hit test is being performed on an object that is using
this custom paint delegate.

The given point is relative to the same coordinate space as the last
[paint](../../custom_painters_telegram_logo/TelegramLogo/paint.md)
call.

The default behavior is to consider all points to be hits for background
painters, and no points to be hits for foreground painters.

Return true if the given position corresponds to a point on the drawn
image that should be considered a "hit", false if it corresponds to a
point that should be considered outside the painted image, and null to
use the default behavior.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
bool? hitTest(Offset position) => null;
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [telegram_logo](../../custom_painters_telegram_logo/custom_painters_telegram_logo-library.md)
3.  [TelegramLogo](../../custom_painters_telegram_logo/TelegramLogo-class.md)
4.  hitTest method

##### TelegramLogo class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
