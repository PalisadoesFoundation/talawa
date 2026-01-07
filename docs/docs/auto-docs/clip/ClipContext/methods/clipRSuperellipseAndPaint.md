# Method: `clipRSuperellipseAndPaint`

## Description

Clip [canvas] with [Path] according to the given rounded superellipse and
 then paint. [canvas] is restored to the pre-clip status afterwards.

 The `bounds` is the saveLayer bounds used for
 [Clip.antiAliasWithSaveLayer].

## Return Type
`void`

## Parameters

- `rse`: `RSuperellipse`
- `clipBehavior`: `Clip`
- `bounds`: `Rect`
- `painter`: `VoidCallback`
