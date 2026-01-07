# Overview for `RandomAccessFile`

## Description

Random access to the data in a file.

 `RandomAccessFile` objects are obtained by calling the
 `open` method on a [File] object.

 A `RandomAccessFile` has both asynchronous and synchronous
 methods. The asynchronous methods all return a [Future]
 whereas the synchronous methods will return the result directly,
 and block the current isolate until the result is ready.

 At most one asynchronous method can be pending on a given `RandomAccessFile`
 instance at the time. If another asynchronous method is called when one is
 already in progress, a [FileSystemException] is thrown.

 If an asynchronous method is pending, it is also not possible to call any
 synchronous methods. This will also throw a [FileSystemException].

