# Method: `openRead`

## Description

Creates a new independent [Stream] for the contents of this file.

 If [start] is present, the file will be read from byte-offset [start].
 Otherwise from the beginning (index 0).

 If [end] is present, only bytes up to byte-index [end] will be read.
 Otherwise, until end of file.

 In order to make sure that system resources are freed, the stream
 must be read to completion or the subscription on the stream must
 be cancelled.

 If [File] is a [named pipe](https://en.wikipedia.org/wiki/Named_pipe)
 then the returned [Stream] will wait until the write side of the pipe
 is closed before signaling "done". If there are no writers attached
 to the pipe when it is opened, then [Stream.listen] will wait until
 a writer opens the pipe.

 An error opening or reading the file will appear as a
 [FileSystemException] error event on the returned [Stream], after which
 the [Stream] is closed. For example:

 ```dart
 // This example will print the "Error reading file" message and the
 // `await for` loop will complete normally, without seeing any data
 // events.
 final stream = File('does-not-exist')
     .
     .handleError((e) => print('Error reading file: $e'));
 await for (final data in stream) 
 ```

## Return Type
`Stream&lt;List&lt;int&gt;&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
