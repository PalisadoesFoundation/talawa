# Method: `getValue`

## Description

Returns the app model's value for `key` and ensures that each
 time the value of `key` is changed with [SharedAppData.setValue], the
 specified context will be rebuilt.

 If no value for `key` exists then the `init` callback is used to
 generate an initial value. The callback is expected to return
 an immutable value because intrinsic changes to the value will
 not cause dependent widgets to be rebuilt.

 A widget that depends on the app model's value for `key` should use
 this method in their `build` methods to ensure that they are rebuilt
 if the value changes.

 The type parameter `K` is the type of the keyword and `V`
 is the type of the value.

## Return Type
`V`

## Parameters

- `context`: `BuildContext`
- `key`: `K`
- `init`: `SharedAppDataInitCallback&lt;V&gt;`
