# Method: `cancel`

## Description

Cancels this subscription.

 After this call, the subscription no longer receives events.

 The stream may need to shut down the source of events and clean up after
 the subscription is canceled.

 Returns a future that is completed once the stream has finished
 its cleanup.

 Typically, cleanup happens when the stream needs to release resources.
 For example, a stream might need to close an open file (as an asynchronous
 operation). If the listener wants to delete the file after having
 canceled the subscription, it must wait for the cleanup future to complete.

 If the cleanup throws, which it really shouldn't, the returned future
 completes with that error.

## Return Type
`Future&lt;void&gt;`

