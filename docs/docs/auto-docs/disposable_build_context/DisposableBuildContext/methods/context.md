# Method: `context`

## Description

Provides safe access to the build context.

 If [dispose] has been called, will return null.

 Otherwise, asserts the [_state] is still mounted and returns its context.

## Return Type
`BuildContext?`

