# Method: `viewPadding`

## Description

The number of physical pixels on each side of the display rectangle into
 which the view can render, but which may be partially obscured by system
 UI (such as the system notification area), or physical intrusions in
 the display (e.g. overscan regions on television screens or phone sensor
 housings).

 Unlike [padding], this value does not change relative to
 [viewInsets]. For example, on an iPhone X, it will not
 change in response to the soft keyboard being visible or hidden, whereas
 [padding] will.

 When this property changes, [PlatformDispatcher.onMetricsChanged] is
 called. When using the Flutter framework, using [MediaQuery.of] to obtain
 the padding (via [MediaQueryData.viewPadding]), instead of directly
 obtaining the [viewPadding] from a [FlutterView], will automatically cause
 any widgets dependent on the padding to rebuild when it changes, without
 having to listen to [PlatformDispatcher.onMetricsChanged].

 The relationship between this [viewInsets],
 [viewPadding], and [padding] are described in
 more detail in the documentation for [FlutterView].

 See also:

  * [WidgetsBindingObserver], for a mechanism at the widgets layer to
    observe when this value changes.
  * [MediaQuery.of], a simpler mechanism for the same.
  * [Scaffold], which automatically applies the padding in material design
    applications.

## Return Type
`ViewPadding`

