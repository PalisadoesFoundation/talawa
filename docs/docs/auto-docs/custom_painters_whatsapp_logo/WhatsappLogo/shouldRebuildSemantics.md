<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [whatsapp_logo](../../custom_painters_whatsapp_logo/custom_painters_whatsapp_logo-library.md)
3.  [WhatsappLogo](../../custom_painters_whatsapp_logo/WhatsappLogo-class.md)
4.  shouldRebuildSemantics method

<div class="self-name">

shouldRebuildSemantics

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

# <span class="kind-method">shouldRebuildSemantics</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>
<span class="name">shouldRebuildSemantics</span>(

1.  <span id="shouldRebuildSemantics-param-oldDelegate"
    class="parameter">covariant
    <span class="type-annotation">CustomPainter</span>
    <span class="parameter-name">oldDelegate</span></span>

)

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Called whenever a new instance of the custom painter delegate class is
provided to the `RenderCustomPaint` object, or any time that a new
`CustomPaint` object is created with a new instance of the custom
painter delegate class (which amounts to the same thing, because the
latter is implemented in terms of the former).

If the new instance would cause
[semanticsBuilder](../../custom_painters_whatsapp_logo/WhatsappLogo/semanticsBuilder.md)
to create different semantics information, then this method should
return true, otherwise it should return false.

If the method returns false, then the
[semanticsBuilder](../../custom_painters_whatsapp_logo/WhatsappLogo/semanticsBuilder.md)
call might be optimized away.

It's possible that the
[semanticsBuilder](../../custom_painters_whatsapp_logo/WhatsappLogo/semanticsBuilder.md)
will get called even if
[shouldRebuildSemantics](../../custom_painters_whatsapp_logo/WhatsappLogo/shouldRebuildSemantics.md)
would return false. For example, it is called when the `CustomPaint` is
rendered for the very first time, or when the box changes its size.

By default this method delegates to
[shouldRepaint](../../custom_painters_whatsapp_logo/WhatsappLogo/shouldRepaint.md)
under the assumption that in most cases semantics change when something
new is drawn.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => shouldRepaint(oldDelegate);
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [whatsapp_logo](../../custom_painters_whatsapp_logo/custom_painters_whatsapp_logo-library.md)
3.  [WhatsappLogo](../../custom_painters_whatsapp_logo/WhatsappLogo-class.md)
4.  shouldRebuildSemantics method

##### WhatsappLogo class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
