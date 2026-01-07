# Method: `isAt`

## Description

Returns true if the nearest enclosing [Focus] widget's node is focused.

 A convenience method to allow build methods to write:
 `Focus.isAt(context)` to get whether or not the nearest [Focus] above them
 in the widget hierarchy currently has the input focus.

 Returns false if no [Focus] widget is found before reaching the nearest
 [FocusScope], or if the root of the focus tree is reached without finding
 a [Focus] widget.

 Calling this function creates a dependency that will rebuild the given
 context when the focus changes.

## Return Type
`bool`

## Parameters

- `context`: `BuildContext`
