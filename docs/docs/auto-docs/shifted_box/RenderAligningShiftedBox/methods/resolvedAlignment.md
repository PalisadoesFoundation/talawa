# Method: `resolvedAlignment`

## Description

The [Alignment] to use for aligning the child.

 This is the [alignment] resolved against [textDirection]. Subclasses should
 use [resolvedAlignment] instead of [alignment] directly, for computing the
 child's offset.

 The [performLayout] method will be called when the value changes.

## Return Type
`Alignment`

