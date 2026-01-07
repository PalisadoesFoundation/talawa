# Method: `shouldScheduleTick`

## Description

Whether a tick should be scheduled.

 If this is true, then calling [scheduleTick] should succeed.

 Reasons why a tick should not be scheduled include:

 * A tick has already been scheduled for the coming frame.
 * The ticker is not active ([start] has not been called).
 * The ticker is not ticking, e.g. because it is [muted] (see [isTicking]).

## Return Type
`bool`

