# Method: `whenCompleteOrCancel`

## Description

Calls `callback` either when this future resolves or when the ticker is
 canceled.

 Calling this method registers an exception handler for the [orCancel]
 future, so even if the [orCancel] property is accessed, canceling the
 ticker will not cause an uncaught exception in the current zone.

## Return Type
`void`

## Parameters

- `callback`: `VoidCallback`
