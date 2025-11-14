<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [telegram_logo](../../custom_painters_telegram_logo/custom_painters_telegram_logo-library.md)
3.  [TelegramLogo](../../custom_painters_telegram_logo/TelegramLogo-class.md)
4.  removeListener method

<div class="self-name">

removeListener

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

# <span class="kind-method">removeListener</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">removeListener</span>(

1.  <span id="removeListener-param-listener"
    class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span>
    <span class="parameter-name">listener</span></span>

)

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Remove a previously registered closure from the list of closures that
the object notifies when it is time to repaint.

The `CustomPainter` implementation merely forwards to the same method on
the `Listenable` provided to the constructor in the `repaint` argument,
if it was not null.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
void removeListener(VoidCallback listener) => _repaint?.removeListener(listener);
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [telegram_logo](../../custom_painters_telegram_logo/custom_painters_telegram_logo-library.md)
3.  [TelegramLogo](../../custom_painters_telegram_logo/TelegramLogo-class.md)
4.  removeListener method

##### TelegramLogo class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
