# Method: `moveNext`

## Description

Wait for the next stream value to be available.

 Returns a future which will complete with either `true` or `false`.
 Completing with `true` means that another event has been received and
 can be read as [current].
 Completing with `false` means that the stream iteration is done and
 no further events will ever be available.
 The future may complete with an error, if the stream produces an error,
 which also ends iteration.

 The function must not be called again until the future returned by a
 previous call is completed.

## Return Type
`Future&lt;bool&gt;`

