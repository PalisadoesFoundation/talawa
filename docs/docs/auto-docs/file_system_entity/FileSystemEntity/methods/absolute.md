# Method: `absolute`

## Description

A [FileSystemEntity] whose path is the absolute path of [path].

 The type of the returned instance is the same as the type of
 this entity.

 A file system entity with an already absolute path
 (as reported by [isAbsolute]) is returned directly.
 For a non-absolute path, the returned entity is absolute ([isAbsolute])
 *if possible*, but still refers to the same file system object.

## Return Type
`FileSystemEntity`

