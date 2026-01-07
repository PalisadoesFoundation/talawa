# Method: `exists`

## Description

Checks whether the file system entity with this path exists.

 Returns a `Future&lt;bool&gt;` that completes with the result.

 Since [FileSystemEntity] is abstract, every [FileSystemEntity] object
 is actually an instance of one of the subclasses [File],
 [Directory], and [Link]. Calling [exists] on an instance of one
 of these subclasses checks whether the object exists in the file
 system object exists *and* is of the correct type (file, directory,
 or link). To check whether a path points to an object on the
 file system, regardless of the object's type, use the [type]
 static method.

## Return Type
`Future&lt;bool&gt;`

