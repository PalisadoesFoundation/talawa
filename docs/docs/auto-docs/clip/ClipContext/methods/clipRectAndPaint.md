# Method: `clipRectAndPaint`

## Description

Clip [canvas] with [Path] according to `rect` and then paint. [canvas] is
 restored to the pre-clip status afterwards.

 `bounds` is the saveLayer bounds used for [Clip.antiAliasWithSaveLayer].

## Return Type
`void`

## Parameters

- `rect`: `Rect`
- `clipBehavior`: `Clip`
- `bounds`: `Rect`
- `painter`: `VoidCallback`
