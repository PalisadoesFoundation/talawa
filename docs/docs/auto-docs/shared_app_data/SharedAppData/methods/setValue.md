# Method: `setValue`

## Description

Changes the app model's `value` for `key` and rebuilds any widgets
 that have created a dependency on `key` with [SharedAppData.getValue].

 If `value` is `==` to the current value of `key` then nothing
 is rebuilt.

 The `value` is expected to be immutable because intrinsic
 changes to the value will not cause dependent widgets to be
 rebuilt.

 Unlike [SharedAppData.getValue], this method does _not_ create a dependency
 between `context` and `key`.

 The type parameter `K` is the type of the value's keyword and `V`
 is the type of the value.

## Return Type
`void`

## Parameters

- `context`: `BuildContext`
- `key`: `K`
- `value`: `V`
