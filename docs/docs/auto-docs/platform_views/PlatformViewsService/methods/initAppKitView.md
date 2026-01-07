# Method: `initAppKitView`

## Description

Factory method to create an `AppKitView`.

 The `id` parameter is an unused unique identifier generated with
 [platformViewsRegistry].

 The `viewType` parameter is the identifier of the iOS view type to be
 created, a factory for this view type must have been registered on the
 platform side. Platform view factories are typically registered by plugin
 code.

 The `onFocus` parameter is a callback that will be invoked when the UIKit
 view asks to get the input focus. If `creationParams` is non null then
 `creationParamsCodec` must not be null.

## Return Type
`Future&lt;AppKitViewController&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
