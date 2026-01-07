# Method: `openWrite`

## Description

Creates a new independent [IOSink] for the file.

 The [IOSink] must be closed when no longer used, to free
 system resources.

 An [IOSink] for a file can be opened in two modes:

 * [FileMode.write]: truncates the file to length zero.
 * [FileMode.append]: sets the initial write position to the end
   of the file.

  When writing strings through the returned [IOSink] the encoding
  specified using [encoding] will be used. The returned [IOSink]
  has an `encoding` property which can be changed after the
  [IOSink] has been created.

 The returned [IOSink] does not transform newline characters (`"\n"`) to
 the platform's conventional line ending (e.g. `"\r\n"` on Windows). Write
 a [Platform.lineTerminator] if a platform-specific line ending is needed.

 If an error occurs while opening or writing to the file, the [IOSink.done]
 [IOSink.flush], and [IOSink.close] futures will all complete with a
 [FileSystemException]. You must handle errors from the [IOSink.done]
 future or the error will be uncaught.

 For example, [FutureExtensions.ignore] the [IOSink.done] error and
 remember to `await` the [IOSink.flush] and [IOSink.close] calls within a
 `try`/`catch`:

 ```dart
 final sink = File('/tmp').; // Can't write to /tmp
 sink.done.;
 sink.write("This is a test");
 try  on FileSystemException catch (e) 
 ```

 To handle errors asynchronously outside of the context of [IOSink.flush]
 and [IOSink.close], you can [Future.catchError] the [IOSink.done].

 ```dart
 final sink = File('/tmp').; // Can't write to /tmp
 sink.done.catchError((e) );
 ```

## Return Type
`IOSink`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
