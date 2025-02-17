:::::::::: {#dartdoc-main-content .main-content above-sidebar="custom_painters_language_icon/custom_painters_language_icon-library-sidebar.html" below-sidebar="custom_painters_language_icon/LanguageIcon-class-sidebar.html"}
<div>

# [LanguageIcon]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class draws the language icon using custom paint.

CustomPaint is a widget from the Flutter SDK, which enables you to use a
canvas to draw different shapes.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [Listenable](https://api.flutter.dev/flutter/foundation/Listenable-class.html)
    -   [CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.html)
    -   LanguageIcon
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[LanguageIcon](../custom_painters_language_icon/LanguageIcon/LanguageIcon.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor .inherited}
## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[semanticsBuilder](https://api.flutter.dev/flutter/rendering/CustomPainter/semanticsBuilder.html)]{.name} [→ [SemanticsBuilderCallback](https://api.flutter.dev/flutter/rendering/SemanticsBuilderCallback.html)?]{.signature}
:   Returns a function that builds semantic information for the picture
    drawn by this painter.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/rendering/CustomPainter/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be notified when it is time to repaint.
    ::: features
    [inherited]{.feature}
    :::

[[hitTest](https://api.flutter.dev/flutter/rendering/CustomPainter/hitTest.html)]{.name}[([[[Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html)]{.type-annotation} [position]{.parameter-name}]{#hitTest-param-position .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.returntype .parameter} ]{.signature}
:   Called whenever a hit test is being performed on an object that is
    using this custom paint delegate.
    ::: features
    [inherited]{.feature}
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[paint](../custom_painters_language_icon/LanguageIcon/paint.html)]{.name}[([[[Canvas](https://api.flutter.dev/flutter/painting/Canvas-class.html)]{.type-annotation} [canvas]{.parameter-name}, ]{#paint-param-canvas .parameter}[[[Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html)]{.type-annotation} [size]{.parameter-name}]{#paint-param-size .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Called whenever the object needs to paint. The given
    [Canvas](https://api.flutter.dev/flutter/painting/Canvas-class.html)
    has its coordinate space configured such that the origin is at the
    top left of the box. The area of the box is the size of the `size`
    argument.
    ::: features
    [override]{.feature}
    :::

[[removeListener](https://api.flutter.dev/flutter/rendering/CustomPainter/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that the object notifies when it is time to repaint.
    ::: features
    [inherited]{.feature}
    :::

[[shouldRebuildSemantics](https://api.flutter.dev/flutter/rendering/CustomPainter/shouldRebuildSemantics.html)]{.name}[([covariant [[CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.html)]{.type-annotation} [oldDelegate]{.parameter-name}]{#shouldRebuildSemantics-param-oldDelegate .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   Called whenever a new instance of the custom painter delegate class
    is provided to the
    [RenderCustomPaint](https://api.flutter.dev/flutter/rendering/RenderCustomPaint-class.html)
    object, or any time that a new
    [CustomPaint](https://api.flutter.dev/flutter/widgets/CustomPaint-class.html)
    object is created with a new instance of the custom painter delegate
    class (which amounts to the same thing, because the latter is
    implemented in terms of the former).
    ::: features
    [inherited]{.feature}
    :::

[[shouldRepaint](../custom_painters_language_icon/LanguageIcon/shouldRepaint.html)]{.name}[([covariant [[CustomPainter](https://api.flutter.dev/flutter/rendering/CustomPainter-class.html)]{.type-annotation} [oldDelegate]{.parameter-name}]{#shouldRepaint-param-oldDelegate .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   Called whenever a new instance of the custom painter delegate class
    is provided to the
    [RenderCustomPaint](https://api.flutter.dev/flutter/rendering/RenderCustomPaint-class.html)
    object, or any time that a new
    [CustomPaint](https://api.flutter.dev/flutter/widgets/CustomPaint-class.html)
    object is created with a new instance of the custom painter delegate
    class (which amounts to the same thing, because the latter is
    implemented in terms of the former).
    ::: features
    [override]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/rendering/CustomPainter/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [language_icon](../custom_painters_language_icon/)
3.  LanguageIcon class

##### language_icon library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
