# Method: `debugIsVisible`

## Description

(DEBUG ONLY) Check whether a given entry is visible (i.e., not behind an
 opaque entry).

 This is an O(N) algorithm, and should not be necessary except for debug
 asserts. To avoid people depending on it, this function is implemented
 only in debug mode, and always returns false in release mode.

## Return Type
`bool`

## Parameters

- `entry`: `OverlayEntry`
