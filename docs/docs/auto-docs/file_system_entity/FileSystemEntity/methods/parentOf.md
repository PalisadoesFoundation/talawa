# Method: `parentOf`

## Description

The parent path of a path.

 Finds the final path component of a path, using the platform's
 path separator to split the path, and returns the prefix up to
 that part.

 Will not remove the root component of a Windows path, like "C:\\" or
 "\\\\server_name\\". Includes a trailing path separator in the last
 part of [path], and leaves no trailing path separator.

## Return Type
`String`

## Parameters

- `path`: `String`
