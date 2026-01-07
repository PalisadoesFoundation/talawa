# Method: `create`

## Description

Creates the file.

 Returns a `Future&lt;File&gt;` that completes with
 the file when it has been created.

 If [recursive] is `false`, the default, the file is created only if
 all directories in its path already exist. If [recursive] is `true`, any
 non-existing parent paths are created first.

 If [exclusive] is `true` and to-be-created file already exists, this
 operation completes the future with a [PathExistsException].

 If [exclusive] is `false`, existing files are left untouched by [create].
 Calling [create] on an existing file still might fail if there are
 restrictive permissions on the file.

 Completes the future with a [FileSystemException] if the operation fails.

## Return Type
`Future&lt;File&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
