# Method: `createSync`

## Description

Synchronously creates the file.

 If [recursive] is `false`, the default, the file is created
 only if all directories in its path already exist.
 If [recursive] is `true`, all non-existing parent paths are created first.

 If [exclusive] is `true` and to-be-created file already exists, then
 a [FileSystemException] is thrown.

 If [exclusive] is `false`, existing files are left untouched by
 [createSync]. Calling [createSync] on an existing file still might fail
 if there are restrictive permissions on the file.

 Throws a [FileSystemException] if the operation fails.

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
