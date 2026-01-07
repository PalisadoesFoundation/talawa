# Method: `errors`

## Description

Returns a broadcast stream of uncaught errors from the isolate.

 Each error is provided as an error event on the stream.

 The actual error object and stackTraces will not necessarily
 be the same object types as in the actual isolate, but they will
 always have the same [Object.toString] result.

 This stream is based on [addErrorListener] and [removeErrorListener].

## Return Type
`Stream`

