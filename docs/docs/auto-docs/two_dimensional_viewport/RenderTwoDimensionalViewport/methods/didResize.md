# Method: `didResize`

## Description

Should be used by subclasses to invalidate any cached metrics for the
 viewport.

 This is set to true when the viewport has been resized, indicating that
 any cached dimensions are invalid.

 After performLayout, the value is set to false until the viewport
 dimensions are changed again in [performResize].

 Subclasses are not required to use this value, but it can be used to
 safely cache layout information in between layout calls.

## Return Type
`bool`

