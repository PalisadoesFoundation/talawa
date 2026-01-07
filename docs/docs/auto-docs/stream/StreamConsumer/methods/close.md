# Method: `close`

## Description

Tells the consumer that no further streams will be added.

 This allows the consumer to complete any remaining work and release
 resources that are no longer needed

 Returns a future which is completed when the consumer has shut down.
 If cleaning up can fail, the error may be reported in the returned future,
 otherwise it completes with `null`.

## Return Type
`Future`

