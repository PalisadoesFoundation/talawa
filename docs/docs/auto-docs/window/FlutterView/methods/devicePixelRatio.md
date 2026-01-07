# Method: `devicePixelRatio`

## Description

The number of device pixels for each logical pixel for the screen this
 view is displayed on.

 This number might not be a power of two. Indeed, it might not even be an
 integer. For example, the Nexus 6 has a device pixel ratio of 3.5.

 Device pixels are also referred to as physical pixels. Logical pixels are
 also referred to as device-independent or resolution-independent pixels.

 By definition, there are roughly 38 logical pixels per centimeter, or
 about 96 logical pixels per inch, of the physical display. The value
 returned by [devicePixelRatio] is ultimately obtained either from the
 hardware itself, the device drivers, or a hard-coded value stored in the
 operating system or firmware, and may be inaccurate, sometimes by a
 significant margin.

 The Flutter framework operates in logical pixels, so it is rarely
 necessary to directly deal with this property.

 When this changes, [PlatformDispatcher.onMetricsChanged] is called. When
 using the Flutter framework, using [MediaQuery.of] to obtain the device
 pixel ratio (via [MediaQueryData.devicePixelRatio]), instead of directly
 obtaining the [devicePixelRatio] from a [FlutterView], will automatically
 cause any widgets dependent on this value to rebuild when it changes,
 without having to listen to [PlatformDispatcher.onMetricsChanged].

 See also:

  * [WidgetsBindingObserver], for a mechanism at the widgets layer to
    observe when this value changes.
  * [Display.devicePixelRatio], which reports the DPR of the display.
    The value here is equal to the value exposed on [display].

## Return Type
`double`

