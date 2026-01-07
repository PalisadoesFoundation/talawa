# Method: `debugAssertDoesMeetConstraints`

## Description

Verify that the object's constraints are being met. Override this function
 in a subclass to verify that your state matches the constraints object.
 This function is only called when asserts are enabled (i.e. in debug mode)
 and only when needsLayout is false. If the constraints are not met, it
 should assert or throw an exception.

## Return Type
`void`

