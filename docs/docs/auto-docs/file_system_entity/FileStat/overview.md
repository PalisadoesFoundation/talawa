# Overview for `FileStat`

## Description

The result of calling the POSIX `` function on a file system object.

 This is an immutable object, representing the snapshotted values returned
 by the `` call.

## Members

- **_type**: `dynamic`
- **_changedTime**: `dynamic`
- **_modifiedTime**: `dynamic`
- **_accessedTime**: `dynamic`
- **_mode**: `dynamic`
- **_size**: `dynamic`
- **_epoch**: `dynamic`
- **_notFound**: `dynamic`
- **changed**: `DateTime`
  The time of the last change to the data or metadata of the file system
 object.

 On Windows platforms, this is instead the file creation time.

- **modified**: `DateTime`
  The time of the last change to the data of the file system object.

- **accessed**: `DateTime`
  The time of the last access to the data of the file system object.

 On Windows platforms, this may have 1 day granularity, and be
 out of date by an hour.

- **type**: `FileSystemEntityType`
  The type of the underlying file system object.

 [FileSystemEntityType.notFound] if [stat] or [statSync] failed.

- **mode**: `int`
  The mode of the file system object.

 Permissions are encoded in the lower 16 bits of this number, and can be
 decoded using the [modeString] getter.

- **size**: `int`
  The size of the file system object.

## Constructors

### _internal


#### Parameters

- `changed`: `dynamic`
- `modified`: `dynamic`
- `accessed`: `dynamic`
- `type`: `dynamic`
- `mode`: `dynamic`
- `size`: `dynamic`
