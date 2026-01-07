# Method: `current`

## Description

Sets the current working directory of the Dart process.

 This affects all running isolates.
 The new value set can be either a [Directory] or a [String].

 The new value is passed to the OS's system call unchanged, so a
 relative path passed as the new working directory will be
 resolved by the OS.

 Note that setting the current working directory is a synchronous
 operation and that it changes the working directory of *all*
 isolates.

 Use this with care — especially when working with asynchronous
 operations and multiple isolates. Changing the working directory,
 while asynchronous operations are pending or when other isolates
 are working with the file system, can lead to unexpected results.

## Return Type
`void`

## Parameters

- `path`: `dynamic`
