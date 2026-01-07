# Method: `unlockSync`

## Description

Synchronously unlocks the file or part of the file.

 Unlocks the byte range from [start] to [end] of the file, with
 the byte at position `end` not included. If no arguments are
 specified, the full file is unlocked, If only `start` is
 specified the file is unlocked from byte position `start` to the
 end of the file.

 *NOTE* file locking does have slight differences in behavior across
 platforms:

 See [lockSync] for more details.

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
