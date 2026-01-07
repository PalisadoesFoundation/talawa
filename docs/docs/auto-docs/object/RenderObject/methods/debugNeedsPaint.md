# Method: `debugNeedsPaint`

## Description

Whether this render object's paint information is dirty.

 This is only set in debug mode. In general, render objects should not need
 to condition their runtime behavior on whether they are dirty or not,
 since they should only be marked dirty immediately prior to being laid
 out and painted. (In release builds, this throws.)

 It is intended to be used by tests and asserts.

 It is possible (and indeed, quite common) for [debugNeedsPaint] to be
 false and [debugNeedsLayout] to be true. The render object will still be
 repainted in the next frame when this is the case, because the
 [markNeedsPaint] method is implicitly called by the framework after a
 render object is laid out, prior to the paint phase.

## Return Type
`bool`

