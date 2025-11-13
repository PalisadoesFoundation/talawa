<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [custom_painters/whatsapp_logo.dart](../custom_painters_whatsapp_logo/custom_painters_whatsapp_logo-library.md)
3.  WhatsappLogo class

<div class="self-name">

WhatsappLogo

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="custom_painters_whatsapp_logo/custom_painters_whatsapp_logo-library-sidebar.html"
below-sidebar="custom_painters_whatsapp_logo/WhatsappLogo-class-sidebar.html">

<div>

# <span class="kind-class">WhatsappLogo</span> class

</div>

<div class="section desc markdown">

This class draws the whatsapp logo using custom paint.

CustomPaint is a widget from the Flutter SDK, which enables you to use a
canvas to draw different shapes.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[WhatsappLogo](../custom_painters_whatsapp_logo/WhatsappLogo/WhatsappLogo.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties"
class="section summary offset-anchor inherited">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[semanticsBuilder](../custom_painters_whatsapp_logo/WhatsappLogo/semanticsBuilder.md)</span> <span class="signature">→ SemanticsBuilderCallback?</span>  
Returns a function that builds semantic information for the picture
drawn by this painter.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](../custom_painters_whatsapp_logo/WhatsappLogo/addListener.md)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be notified when it is time to repaint.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[hitTest](../custom_painters_whatsapp_logo/WhatsappLogo/hitTest.md)</span><span class="signature">(<span id="hitTest-param-position" class="parameter"><span class="type-annotation">[Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.md)</span> <span class="parameter-name">position</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span> </span>  
Called whenever a hit test is being performed on an object that is using
this custom paint delegate.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[paint](../custom_painters_whatsapp_logo/WhatsappLogo/paint.md)</span><span class="signature">(<span id="paint-param-canvas" class="parameter"><span class="type-annotation">[Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.md)</span> <span class="parameter-name">canvas</span>, </span><span id="paint-param-size" class="parameter"><span class="type-annotation">[Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html)</span> <span class="parameter-name">size</span></span>) <span class="returntype parameter">→ void</span> </span>  
Called whenever the object needs to paint. The given
[Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) has
its coordinate space configured such that the origin is at the top left
of the box. The area of the box is the size of the `size` argument.

<span class="name">[removeListener](../custom_painters_whatsapp_logo/WhatsappLogo/removeListener.md)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
the object notifies when it is time to repaint.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[shouldRebuildSemantics](../custom_painters_whatsapp_logo/WhatsappLogo/shouldRebuildSemantics.md)</span><span class="signature">(<span id="shouldRebuildSemantics-param-oldDelegate" class="parameter">covariant <span class="type-annotation">CustomPainter</span> <span class="parameter-name">oldDelegate</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Called whenever a new instance of the custom painter delegate class is
provided to the `RenderCustomPaint` object, or any time that a new
`CustomPaint` object is created with a new instance of the custom
painter delegate class (which amounts to the same thing, because the
latter is implemented in terms of the former).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[shouldRepaint](../custom_painters_whatsapp_logo/WhatsappLogo/shouldRepaint.md)</span><span class="signature">(<span id="shouldRepaint-param-oldDelegate" class="parameter">covariant <span class="type-annotation">CustomPainter</span> <span class="parameter-name">oldDelegate</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Called whenever a new instance of the custom painter delegate class is
provided to the `RenderCustomPaint` object, or any time that a new
`CustomPaint` object is created with a new instance of the custom
painter delegate class (which amounts to the same thing, because the
latter is implemented in terms of the former).

<span class="name">[toString](../custom_painters_whatsapp_logo/WhatsappLogo/toString.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [whatsapp_logo](../custom_painters_whatsapp_logo/custom_painters_whatsapp_logo-library.md)
3.  WhatsappLogo class

##### whatsapp_logo library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
