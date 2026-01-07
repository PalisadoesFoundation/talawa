# Method: `existsSync`

## Description

Synchronously checks whether the file system entity with this path
 exists.

 Since [FileSystemEntity] is abstract, every [FileSystemEntity] object
 is actually an instance of one of the subclasses [File],
 [Directory], and [Link].  Calling [existsSync] on an instance of
 one of these subclasses checks whether the object exists in the
 file system object exists and is of the correct type (file,
 directory, or link).  To check whether a path points to an object
 on the file system, regardless of the object's type, use the
 [typeSync] static method.

## Return Type
`bool`

