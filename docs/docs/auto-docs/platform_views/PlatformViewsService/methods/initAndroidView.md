# Method: `initAndroidView`

## Description


 Creates a controller for a new Android view.

 The `id` argument is an unused unique identifier generated with
 [platformViewsRegistry].

 The `viewType` argument is the identifier of the Android view type to be
 created, a factory for this view type must have been registered on the
 platform side. Platform view factories are typically registered by plugin
 code. Plugins can register a platform view factory with
 [PlatformViewRegistry#registerViewFactory](..//javadoc/io/flutter/plugin/platform/PlatformViewRegistry#registerViewFactory-java.lang.String-io.flutter.plugin.platform.PlatformViewFactory-.md).

 The `creationParams` argument will be passed as the args argument of
 [PlatformViewFactory#create](..//javadoc/io/flutter/plugin/platform/PlatformViewFactory#create-android.content.Context-int-java.lang.Object-.md)

 The `creationParamsCodec` argument is the codec used to encode
 `creationParams` before sending it to the platform side. It should match
 the codec passed to the constructor of
 [PlatformViewFactory](..//javadoc/io/flutter/plugin/platform/PlatformViewFactory#PlatformViewFactory-io.flutter.plugin.common.MessageCodec-.md).
 This is typically one of: [StandardMessageCodec], [JSONMessageCodec],
 [StringCodec], or [BinaryCodec].

 The `onFocus` argument is a callback that will be invoked when the Android
 View asks to get the input focus.

 The Android view will only be created after
 [AndroidViewController.setSize] is called for the first time.

 If `creationParams` is non null then `creationParamsCodec` must not be
 null.
 

 This attempts to use the newest and most efficient platform view
 implementation when possible. In cases where that is not supported, it
 falls back to using Virtual Display.

## Return Type
`AndroidViewController`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
