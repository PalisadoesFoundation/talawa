# Overview for `FileSystemException`

## Description

Exception thrown when a file operation fails.

## Dependencies

- IOException

## Members

- **message**: `String`
  Message describing the error.

 The message does not include any detailed information from
 the underlying OS error. Check [osError] for that information.

- **path**: `String?`
  The file system path on which the error occurred.

 Can be `null` if the exception does not relate directly
 to a file system path.

- **osError**: `OSError?`
  The underlying OS error.

 Can be `null` if the exception is not raised due to an OS error.

## Constructors

### Unnamed Constructor
Creates a new file system exception with optional parts.

 Creates an exception with [FileSystemException.message],
 [FileSystemException.path] and [FileSystemException.osError]
 values take from the optional parameters of the same name.

 The [message] and [path] path defaults to empty strings if omitted,
 and [osError] defaults to `null`.

### _fromOSError
Create a new file system exception based on an [OSError.errorCode].

 For example, if `errorCode == 2` then a [PathNotFoundException]
 will be returned.

#### Parameters

- `err`: `OSError`
- `message`: `String`
- `path`: `String`
