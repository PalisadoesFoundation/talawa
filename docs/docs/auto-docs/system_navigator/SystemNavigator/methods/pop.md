# Method: `pop`

## Description

Removes the topmost Flutter instance, presenting what was before
 it.

 On Android, removes this activity from the stack and returns to
 the previous activity.

 On iOS, calls `popViewControllerAnimated:` if the root view
 controller is a `UINavigationController`, or
 `dismissViewControllerAnimated:completion:` if the top view
 controller is a `FlutterViewController`.

 The optional `animated` parameter is ignored on all platforms
 except iOS where it is an argument to the aforementioned
 methods.

 This method should be preferred over calling `dart:io`'s [exit]
 method, as the latter may cause the underlying platform to act
 as if the application had crashed.

## Return Type
`Future&lt;void&gt;`

## Parameters

- ``: `dynamic`
