# Method: `displayFeatures`

## Description


 Areas of the display that are obstructed by hardware features.

 This list is populated only on Android. If the device has no display
 features, this list is empty.

 The coordinate space in which the [DisplayFeature.bounds] are defined spans
 across the screens currently in use. This means that the space between the screens
 is virtually part of the Flutter view space, with the [DisplayFeature.bounds]
 of the display feature as an obstructed area. The [DisplayFeature.type] can
 be used to determine if this display feature obstructs the screen or not.
 For example, [DisplayFeatureType.hinge] and [DisplayFeatureType.cutout] both
 obstruct the display, while [DisplayFeatureType.fold] is a crease in the display.

 Folding [DisplayFeature]s like the [DisplayFeatureType.hinge] and
 [DisplayFeatureType.fold] also have a [DisplayFeature.state] which can be
 used to determine the posture the device is in.
 

 When this changes, [PlatformDispatcher.onMetricsChanged] is called.

 See also:

  * [WidgetsBindingObserver], for a mechanism at the widgets layer to
    observe when this value changes.
  * [MediaQuery.of], a simpler mechanism to access this data.

## Return Type
`List&lt;DisplayFeature&gt;`

