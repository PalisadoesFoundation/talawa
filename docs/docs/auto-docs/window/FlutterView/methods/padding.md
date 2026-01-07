# Method: `padding`

## Description

The number of physical pixels on each side of the display rectangle into
 which the view can render, but which may be partially obscured by system
 UI (such as the system notification area), or physical intrusions in
 the display (e.g. overscan regions on television screens or phone sensor
 housings).

 This value is calculated by taking `max(0.0, FlutterView.viewPadding -
 FlutterView.viewInsets)`. This will treat a system IME that increases the
 bottom inset as consuming that much of the bottom padding. For example, on
 an iPhone X, [EdgeInsets.bottom] of [FlutterView.padding] is the same as
 [EdgeInsets.bottom] of [FlutterView.viewPadding] when the soft keyboard is
 not drawn (to account for the bottom soft button area), but will be `0.0`
 when the soft keyboard is visible.

 When this changes, [PlatformDispatcher.onMetricsChanged] is called. When
 using the Flutter framework, using [MediaQuery.of] to obtain the padding
 (via [MediaQueryData.padding]), instead of directly obtaining the
 [padding] from a [FlutterView], will automatically cause any widgets
 dependent on the padding to rebuild when it changes, without having to
 listen to [PlatformDispatcher.onMetricsChanged].

 The relationship between this [viewInsets], [viewPadding], and [padding]
 are described in more detail in the documentation for [FlutterView].

 See also:

 * [WidgetsBindingObserver], for a mechanism at the widgets layer to
   observe when this value changes.
 * [MediaQuery.of], a simpler mechanism for the same.
 * [Scaffold], which automatically applies the padding in material design
   applications.

## Return Type
`ViewPadding`

