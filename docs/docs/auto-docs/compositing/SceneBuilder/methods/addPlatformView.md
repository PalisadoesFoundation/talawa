# Method: `addPlatformView`

## Description

Adds a platform view (e.g an iOS UIView) to the scene.

 On iOS this layer splits the current output surface into two surfaces, one for the scene nodes
 preceding the platform view, and one for the scene nodes following the platform view.

 ## Performance impact

 Adding an additional surface doubles the amount of graphics memory directly used by Flutter
 for output buffers. Quartz might allocated extra buffers for compositing the Flutter surfaces
 and the platform view.

 With a platform view in the scene, Quartz has to composite the two Flutter surfaces and the
 embedded UIView. In addition to that, on iOS versions greater than 9, the Flutter frames are
 synchronized with the UIView frames adding additional performance overhead.

 The `offset` argument is not used for iOS and Android.

## Return Type
`void`

## Parameters

- `viewId`: `int`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
