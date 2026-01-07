# Method: `didUpdateValue`

## Description

Called whenever a new value is assigned to [value].

 The new value can be accessed via the regular [value] getter and the
 previous value is provided as `oldValue`.

 Subclasses should call [notifyListeners] from this method, if the new
 value changes what [toPrimitives] returns.

## Return Type
`void`

## Parameters

- `oldValue`: `T?`
