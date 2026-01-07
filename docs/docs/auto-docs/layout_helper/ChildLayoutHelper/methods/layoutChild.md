# Method: `layoutChild`

## Description

Lays out the [RenderBox] with the given constraints and returns its
 [Size].

 This method calls [RenderBox.layout] on the given [RenderBox] with
 `parentUsesSize` set to true to receive its [Size].

 This method should only be called by the parent of the provided
 [RenderBox] child as it binds parent and child together (if the child
 is marked as dirty, the child will also be marked as dirty).

 See also:

  * [dryLayoutChild], which does not perform a real layout of the child.

## Return Type
`Size`

## Parameters

- `child`: `RenderBox`
- `constraints`: `BoxConstraints`
