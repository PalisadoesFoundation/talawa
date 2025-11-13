<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [custom_painters/talawa_logo.dart](../../custom_painters_talawa_logo/custom_painters_talawa_logo-library.md)
3.  [AppLogo](../../custom_painters_talawa_logo/AppLogo-class.md)
4.  paint method

<div class="self-name">

paint

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="custom_painters_talawa_logo/AppLogo-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">paint</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">void</span> <span class="name">paint</span>(

1.  <span id="paint-param-canvas"
    class="parameter"><span class="type-annotation">[Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.md)</span>
    <span class="parameter-name">canvas</span>, </span>
2.  <span id="paint-param-size"
    class="parameter"><span class="type-annotation">[Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html)</span>
    <span class="parameter-name">size</span></span>

)

</div>

<div class="section desc markdown">

Called whenever the object needs to paint. The given
[Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) has
its coordinate space configured such that the origin is at the top left
of the box. The area of the box is the size of the `size` argument.

Paint operations should remain inside the given area. Graphical
operations outside the bounds may be silently ignored, clipped, or not
clipped. It may sometimes be difficult to guarantee that a certain
operation is inside the bounds (e.g., drawing a rectangle whose size is
determined by user inputs). In that case, consider calling
[Canvas.clipRect](https://api.flutter.dev/flutter/dart-ui/Canvas/clipRect.html)
at the beginning of
[paint](../../custom_painters_talawa_logo/AppLogo/paint.md) so
everything that follows will be guaranteed to only draw within the
clipped area.

Implementations should be wary of correctly pairing any calls to
[Canvas.save](https://api.flutter.dev/flutter/dart-ui/Canvas/save.html)/[Canvas.saveLayer](https://api.flutter.dev/flutter/dart-ui/Canvas/saveLayer.html)
and
[Canvas.restore](https://api.flutter.dev/flutter/dart-ui/Canvas/restore.html),
otherwise all subsequent painting on this canvas may be affected, with
potentially hilarious but confusing results.

To paint text on a
[Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html), use
a `TextPainter`.

To paint an image on a
[Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html):

1.  Obtain an `ImageStream`, for example by calling
    `ImageProvider.resolve` on an `AssetImage` or `NetworkImage` object.

2.  Whenever the `ImageStream`'s underlying `ImageInfo` object changes
    (see `ImageStream.addListener`), create a new instance of your
    custom paint delegate, giving it the new `ImageInfo` object.

3.  In your delegate's
    [paint](../../custom_painters_talawa_logo/AppLogo/paint.md)
    method, call the
    [Canvas.drawImage](https://api.flutter.dev/flutter/dart-ui/Canvas/drawImage.html),
    [Canvas.drawImageRect](https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageRect.html),
    or
    [Canvas.drawImageNine](https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageNine.html)
    methods to paint the `ImageInfo.image` object, applying the
    `ImageInfo.scale` value to obtain the correct rendering size.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
void paint(Canvas canvas, Size size) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [talawa_logo](../../custom_painters_talawa_logo/custom_painters_talawa_logo-library.md)
3.  [AppLogo](../../custom_painters_talawa_logo/AppLogo-class.md)
4.  paint method

##### AppLogo class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
