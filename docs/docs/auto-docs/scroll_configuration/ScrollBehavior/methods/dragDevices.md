# Method: `dragDevices`

## Description

The device kinds that the scrollable will accept drag gestures from.

 By default only [PointerDeviceKind.touch], [PointerDeviceKind.stylus],
 [PointerDeviceKind.invertedStylus], and [PointerDeviceKind.trackpad]
 are configured to create drag gestures. Enabling this for
 [PointerDeviceKind.mouse] will make it difficult or impossible to select
 text in scrollable containers and is not recommended.

## Return Type
`Set&lt;PointerDeviceKind&gt;`

