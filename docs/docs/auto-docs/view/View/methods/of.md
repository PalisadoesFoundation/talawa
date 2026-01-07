# Method: `of`

## Description

Returns the [FlutterView] that the provided `context` will render into.

 Throws if the `context` is not associated with a [FlutterView].

 The method creates a dependency on the `context`, which will be informed
 when the identity of the [FlutterView] changes (i.e. the `context` is
 moved to render into a different [FlutterView] then before). The context
 will not be informed when the _properties_ on the [FlutterView] itself
 change their values. To access the property values of a [FlutterView]
 prefer using the access methods on [MediaQuery], such as
 [MediaQuery.sizeOf], which will ensure that the `context` is informed when
 the view properties change.

 See also:

  * [View.maybeOf], which throws instead of returning null if no
    [FlutterView] is found.

## Return Type
`FlutterView`

## Parameters

- `context`: `BuildContext`
