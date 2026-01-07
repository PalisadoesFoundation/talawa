# Method: `physicalSize`

## Description

The current dimensions of the rectangle as last reported by the platform
 into which scenes rendered in this view are drawn.

 If the view is configured with loose [physicalConstraints] this value
 may be outdated by a few frames as it only updates when the size chosen
 for a frame (as provided to the [render] method) is processed by the
 platform. Because of this, [physicalConstraints] should be used instead of
 this value as the root input to the layout algorithm of UI frameworks.

 When this changes, [PlatformDispatcher.onMetricsChanged] is called. When
 using the Flutter framework, using [MediaQuery.of] to obtain the size (via
 [MediaQueryData.size]), instead of directly obtaining the [physicalSize]
 from a [FlutterView], will automatically cause any widgets dependent on the
 size to rebuild when the size changes, without having to listen to
 [PlatformDispatcher.onMetricsChanged].

 At startup, the size of the view may not be known before Dart code runs.
 If this value is observed early in the application lifecycle, it may
 report [Size.zero].

 This value does not take into account any on-screen keyboards or other
 system UI. The [padding] and [viewInsets] properties provide information
 about how much of each side of the view may be obscured by system UI.

 See also:

  * [WidgetsBindingObserver], for a mechanism at the widgets layer to
    observe when this value changes.

## Return Type
`Size`

