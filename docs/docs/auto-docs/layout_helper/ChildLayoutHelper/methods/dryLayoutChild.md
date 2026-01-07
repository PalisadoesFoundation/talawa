# Method: `dryLayoutChild`

## Description

Returns the [Size] that the [RenderBox] would have if it were to
 be laid out with the given [BoxConstraints].

 This method calls [RenderBox.getDryLayout] on the given [RenderBox].

 This method should only be called by the parent of the provided
 [RenderBox] child as it binds parent and child together (if the child
 is marked as dirty, the child will also be marked as dirty).

 See also:

  * [layoutChild], which actually lays out the child with the given
    constraints.

## Return Type
`Size`

## Parameters

- `child`: `RenderBox`
- `constraints`: `BoxConstraints`
