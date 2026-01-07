# Method: `awaitingCreation`

## Description

True if [create] has not been successfully called the platform view.

 This can indicate either that [create] was never called, or that [create]
 was deferred for implementation-specific reasons.

 A `false` return value does not necessarily indicate that the [Future]
 returned by [create] has completed, only that creation has been started.

## Return Type
`bool`

