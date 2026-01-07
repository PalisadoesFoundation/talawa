# Method: `isActive`

## Description

Whether time is elapsing for this [Ticker]. Becomes true when [start] is
 called and false when [stop] is called.

 A ticker can be active yet not be actually ticking (i.e. not be calling
 the callback). To determine if a ticker is actually ticking, use
 [isTicking].

## Return Type
`bool`

