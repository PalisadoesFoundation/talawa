# Method: `clipPathAndPaint`

## Description

Clip [canvas] with [Path] according to [Clip] and then paint. [canvas] is
 restored to the pre-clip status afterwards.

 `bounds` is the saveLayer bounds used for [Clip.antiAliasWithSaveLayer].

## Return Type
`void`

## Parameters

- `path`: `Path`
- `clipBehavior`: `Clip`
- `bounds`: `Rect`
- `painter`: `VoidCallback`
