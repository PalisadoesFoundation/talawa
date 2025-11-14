<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [whatsapp_logo](../../custom_painters_whatsapp_logo/custom_painters_whatsapp_logo-library.md)
3.  [WhatsappLogo](../../custom_painters_whatsapp_logo/WhatsappLogo-class.md)
4.  addListener method

<div class="self-name">

addListener

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="custom_painters_whatsapp_logo/WhatsappLogo-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">addListener</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">addListener</span>(

1.  <span id="addListener-param-listener"
    class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span>
    <span class="parameter-name">listener</span></span>

)

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Register a closure to be notified when it is time to repaint.

The `CustomPainter` implementation merely forwards to the same method on
the `Listenable` provided to the constructor in the `repaint` argument,
if it was not null.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
void addListener(VoidCallback listener) => _repaint?.addListener(listener);
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [whatsapp_logo](../../custom_painters_whatsapp_logo/custom_painters_whatsapp_logo-library.md)
3.  [WhatsappLogo](../../custom_painters_whatsapp_logo/WhatsappLogo-class.md)
4.  addListener method

##### WhatsappLogo class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
