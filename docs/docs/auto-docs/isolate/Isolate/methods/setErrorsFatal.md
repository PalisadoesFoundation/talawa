# Method: `setErrorsFatal`

## Description

Sets whether uncaught errors will terminate the isolate.

 If errors are fatal, any uncaught error will terminate the isolate
 event loop and shut down the isolate.

 This call requires the [terminateCapability] for the isolate.
 If the capability is absent or incorrect, no change is made.

 Since isolates run concurrently, it's possible for the receiving isolate
 to exit due to an error, before a request, using this method, has been
 received and processed.
 To avoid this, either use the corresponding parameter to the spawn
 function, or start the isolate paused, set errors non-fatal and
 then resume the isolate.

## Return Type
`void`

## Parameters

- `errorsAreFatal`: `bool`
