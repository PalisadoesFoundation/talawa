:::::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_talawa_error_snackbar/widgets_talawa_error_snackbar-library-sidebar.html" below-sidebar="widgets_talawa_error_snackbar/TalawaErrorSnackBar-class-sidebar.html"}
<div>

# [TalawaErrorSnackBar]{.kind-class} class

</div>

::: {.section .desc .markdown}
Common Error Snack Bar for the whole talawa app.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
    -   [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    -   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
    -   TalawaErrorSnackBar

Available extensions

:   -   [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[TalawaErrorSnackBar](../widgets_talawa_error_snackbar/TalawaErrorSnackBar/TalawaErrorSnackBar.html)]{.name}[({[[[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]{.type-annotation} [key]{.parameter-name}, ]{#-param-key .parameter}[required [[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)]{.type-annotation} [duration]{.parameter-name}, ]{#-param-duration .parameter}[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [errorMessage]{.parameter-name}, ]{#-param-errorMessage .parameter}[required [[MessageType](../enums_enums/MessageType.html)]{.type-annotation} [messageType]{.parameter-name}]{#-param-messageType .parameter}})]{.signature}

:   ::: {.constructor-modifier .features}
    const
    :::
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[duration](../widgets_talawa_error_snackbar/TalawaErrorSnackBar/duration.html)]{.name} [→ [Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)]{.signature}
:   Duration the snack bar is visible.
    ::: features
    [final]{.feature}
    :::

[[errorMessage](../widgets_talawa_error_snackbar/TalawaErrorSnackBar/errorMessage.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   error message for the talawa Snack Bar.
    ::: features
    [final]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)]{.name} [→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]{.signature}
:   Controls how one widget replaces another widget in the tree.
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[messageType](../widgets_talawa_error_snackbar/TalawaErrorSnackBar/messageType.html)]{.name} [→ [MessageType](../enums_enums/MessageType.html)]{.signature}
:   enum for the type of error message.
    ::: features
    [final]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions/animate.html)]{.name}[({[[[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]{.type-annotation} [key]{.parameter-name}, ]{#animate-param-key .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Effect](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Effect-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [effects]{.parameter-name}, ]{#animate-param-effects .parameter}[[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?]{.type-annotation} [onInit]{.parameter-name}, ]{#animate-param-onInit .parameter}[[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?]{.type-annotation} [onPlay]{.parameter-name}, ]{#animate-param-onPlay .parameter}[[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?]{.type-annotation} [onComplete]{.parameter-name}, ]{#animate-param-onComplete .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation} [autoPlay]{.parameter-name}, ]{#animate-param-autoPlay .parameter}[[[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)?]{.type-annotation} [delay]{.parameter-name}, ]{#animate-param-delay .parameter}[[[AnimationController](https://api.flutter.dev/flutter/animation/AnimationController-class.html)?]{.type-annotation} [controller]{.parameter-name}, ]{#animate-param-controller .parameter}[[[Adapter](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Adapter-class.html)?]{.type-annotation} [adapter]{.parameter-name}, ]{#animate-param-adapter .parameter}[[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)?]{.type-annotation} [target]{.parameter-name}, ]{#animate-param-target .parameter}[[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)?]{.type-annotation} [value]{.parameter-name}]{#animate-param-value .parameter}}) [→ [Animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Animate-class.html)]{.returntype .parameter} ]{.signature}

:   Available on
    [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html),
    provided by the
    [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)
    extension

    Wraps the target
    [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    in an
    [Animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Animate-class.html)
    instance, and returns the instance for chaining calls. Ex.
    `myWidget.animate()` is equivalent to `Animate(child: myWidget)`.

[[build](../widgets_talawa_error_snackbar/TalawaErrorSnackBar/build.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#build-param-context .parameter}) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype .parameter} ]{.signature}
:   Describes the part of the user interface represented by this widget.
    ::: features
    [override]{.feature}
    :::

[[createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)]{.name}[() [→ [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)]{.returntype .parameter} ]{.signature}
:   Creates a
    [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)
    to manage this widget\'s location in the tree.
    ::: features
    [inherited]{.feature}
    :::

[[debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)]{.name}[() [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Returns a list of
    [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)
    objects describing this node\'s children.
    ::: features
    [inherited]{.feature}
    :::

[[debugFillProperties](https://api.flutter.dev/flutter/widgets/Widget/debugFillProperties.html)]{.name}[([[[DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.html)]{.type-annotation} [properties]{.parameter-name}]{#debugFillProperties-param-properties .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Add additional properties associated with the node.
    ::: features
    [inherited]{.feature}
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [name]{.parameter-name}, ]{#toDiagnosticsNode-param-name .parameter}[[[DiagnosticsTreeStyle](https://api.flutter.dev/flutter/foundation/DiagnosticsTreeStyle.html)?]{.type-annotation} [style]{.parameter-name}]{#toDiagnosticsNode-param-style .parameter}}) [→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)]{.returntype .parameter} ]{.signature}
:   Returns a debug representation of the object that is used by
    debugging tools and by
    [DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).
    ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)]{.name}[({[[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)]{.type-annotation} [minLevel]{.parameter-name} = [DiagnosticLevel.info]{.default-value}]{#toString-param-minLevel .parameter}}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [prefixLineOne]{.parameter-name} = [\'\']{.default-value}, ]{#toStringDeep-param-prefixLineOne .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [prefixOtherLines]{.parameter-name}, ]{#toStringDeep-param-prefixOtherLines .parameter}[[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)]{.type-annotation} [minLevel]{.parameter-name} = [DiagnosticLevel.debug]{.default-value}, ]{#toStringDeep-param-minLevel .parameter}[[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation} [wrapWidth]{.parameter-name} = [65]{.default-value}]{#toStringDeep-param-wrapWidth .parameter}}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Returns a string representation of this node and its descendants.
    ::: features
    [inherited]{.feature}
    :::

[[toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [joiner]{.parameter-name} = [\', \']{.default-value}, ]{#toStringShallow-param-joiner .parameter}[[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)]{.type-annotation} [minLevel]{.parameter-name} = [DiagnosticLevel.debug]{.default-value}]{#toStringShallow-param-minLevel .parameter}}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Returns a one-line detailed description of the object.
    ::: features
    [inherited]{.feature}
    :::

[[toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A short, textual description of this widget.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/widgets/Widget/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
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
2.  [talawa_error_snackbar](../widgets_talawa_error_snackbar/)
3.  TalawaErrorSnackBar class

##### talawa_error_snackbar library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
