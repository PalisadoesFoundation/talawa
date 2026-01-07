# Method: `paint`

## Description

Paint this render object into the given context at the given offset.

 Subclasses should override this method to provide a visual appearance
 for themselves. The render object's local coordinate system is
 axis-aligned with the coordinate system of the context's canvas and the
 render object's local origin (i.e, x=0 and y=0) is placed at the given
 offset in the context's canvas.

 Do not call this function directly. If you wish to paint yourself, call
 [markNeedsPaint] instead to schedule a call to this function. If you wish
 to paint one of your children, call [PaintingContext.paintChild] on the
 given `context`.

 When painting one of your children (via a paint child function on the
 given context), the current canvas held by the context might change
 because draw operations before and after painting children might need to
 be recorded on separate compositing layers.

## Return Type
`void`

## Parameters

- `context`: `PaintingContext`
- `offset`: `Offset`
