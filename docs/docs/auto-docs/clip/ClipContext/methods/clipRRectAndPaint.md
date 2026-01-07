# Method: `clipRRectAndPaint`

## Description

Clip [canvas] with [Path] according to `rrect` and then paint. [canvas] is
 restored to the pre-clip status afterwards.

 `bounds` is the saveLayer bounds used for [Clip.antiAliasWithSaveLayer].

## Return Type
`void`

## Parameters

- `rrect`: `RRect`
- `clipBehavior`: `Clip`
- `bounds`: `Rect`
- `painter`: `VoidCallback`
