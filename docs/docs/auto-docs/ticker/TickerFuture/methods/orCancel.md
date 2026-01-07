# Method: `orCancel`

## Description

A future that resolves when this future resolves or throws when the ticker
 is canceled.

 If this property is never accessed, then canceling the ticker does not
 throw any exceptions. Once this property is accessed, though, if the
 corresponding ticker is canceled, then the [Future] returned by this
 getter will complete with an error, and if that error is not caught, there
 will be an uncaught exception in the current zone.

## Return Type
`Future&lt;void&gt;`

