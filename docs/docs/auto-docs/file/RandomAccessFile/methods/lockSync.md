# Method: `lockSync`

## Description

Synchronously locks the file or part of the file.

 By default an exclusive lock will be obtained, but that can be overridden
 by the [mode] argument.

 Locks the byte range from [start] to [end] of the file ,with the
 byte at position `end` not included. If no arguments are
 specified, the full file is locked, If only `start` is specified
 the file is locked from byte position `start` to the end of the
 file, no matter how large it grows. It is possible to specify an
 explicit value of `end` which is past the current length of the file.

 To obtain an exclusive lock on a file it must be opened for writing.

 If [mode] is [FileLock.exclusive] or [FileLock.shared], an exception is
 thrown if the lock cannot be obtained. If [mode] is
 [FileLock.blockingExclusive] or [FileLock.blockingShared], the
 call returns only after the lock has been obtained.

 *NOTE* file locking does have slight differences in behavior across
 platforms:

 On Linux and OS X this uses advisory locks, which have the
 surprising semantics that all locks associated with a given file
 are removed when *any* file descriptor for that file is closed by
 the process. Note that this does not actually lock the file for
 access. Also note that advisory locks are on a process
 level. This means that several isolates in the same process can
 obtain an exclusive lock on the same file.

 On Windows the regions used for lock and unlock needs to match. If that
 is not the case unlocking will result in the OS error "The segment is
 already unlocked".

 On Windows, locking a file associates the lock with the specific file
 handle used to acquire the lock. If the same file is opened again with a
 different handle (even within the same process), attempts to write to the
 locked region using the new handle will fail. To ensure successful writes
 after locking, use the same [RandomAccessFile] object that acquired the
 lock for subsequent write operations.

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
