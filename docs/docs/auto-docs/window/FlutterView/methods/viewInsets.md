# Method: `viewInsets`

## Description

The number of physical pixels on each side of the display rectangle into
 which the view can render, but over which the operating system will likely
 place system UI, such as the keyboard, that fully obscures any content.

 When this property changes, [PlatformDispatcher.onMetricsChanged] is
 called. When using the Flutter framework, using [MediaQuery.of] to obtain
 the insets (via [MediaQueryData.viewInsets]), instead of directly
 obtaining the [viewInsets] from a [FlutterView], will automatically cause
 any widgets dependent on the insets to rebuild when they change, without
 having to listen to [PlatformDispatcher.onMetricsChanged].

 The relationship between this [viewInsets],
 [viewPadding], and [padding] are described in
 more detail in the documentation for [FlutterView].

 See also:

  * [WidgetsBindingObserver], for a mechanism at the widgets layer to
    observe when this value changes.
  * [MediaQuery.of], a simpler mechanism for the same.
  * [Scaffold], which automatically applies the view insets in material
    design applications.

## Return Type
`ViewPadding`

