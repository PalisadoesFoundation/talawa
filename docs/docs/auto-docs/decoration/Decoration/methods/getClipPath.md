# Method: `getClipPath`

## Description

Returns a closed [Path] that describes the outer edge of this decoration.

 The default implementation throws. Subclasses must override this implementation
 to describe the clip path that should be applied to the decoration when it is
 used in a [Container] with an explicit [Clip] behavior.

 See also:

  * [Container.clipBehavior], which, if set, uses this method to determine
    the clip path to use.

## Return Type
`Path`

## Parameters

- `rect`: `Rect`
- `textDirection`: `TextDirection`
