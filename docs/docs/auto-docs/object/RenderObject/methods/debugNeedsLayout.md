# Method: `debugNeedsLayout`

## Description

Whether this render object's layout information is dirty.

 This is only set in debug mode. In general, render objects should not need
 to condition their runtime behavior on whether they are dirty or not,
 since they should only be marked dirty immediately prior to being laid
 out and painted. In release builds, this throws.

 It is intended to be used by tests and asserts.

## Return Type
`bool`

