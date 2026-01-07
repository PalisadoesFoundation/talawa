# Method: `cancel`

## Description

Cancels the stream iterator (and the underlying stream subscription) early.

 The stream iterator is automatically canceled if the [moveNext] future
 completes with either `false` or an error.

 If you need to stop listening for values before the stream iterator is
 automatically closed, you must call [cancel] to ensure that the stream
 is properly closed.

 If [moveNext] has been called when the iterator is canceled,
 its returned future will complete with `false` as value,
 as will all further calls to [moveNext].

 Returns a future which completes when the cancellation is complete.
 This can be an already completed future if the cancellation happens
 synchronously.

## Return Type
`Future`

