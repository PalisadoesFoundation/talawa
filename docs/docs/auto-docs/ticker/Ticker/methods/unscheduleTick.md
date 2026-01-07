# Method: `unscheduleTick`

## Description

Cancels the frame callback that was requested by [scheduleTick], if any.

 Calling this method when no tick is [scheduled] is harmless.

 This method should not be called when [shouldScheduleTick] would return
 true if no tick was scheduled.

## Return Type
`void`

