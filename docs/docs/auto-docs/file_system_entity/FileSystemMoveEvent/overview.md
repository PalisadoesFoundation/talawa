# Overview for `FileSystemMoveEvent`

## Description

File system event for moving of file system objects.

## Dependencies

- FileSystemEvent

## Members

- **destination**: `String?`
  The destination path of the file being moved.

 The destination is `null` if the underlying implementation
 is unable to identify the destination of the moved file.

 The source path is available as [path].

## Constructors

### Unnamed Constructor
Constructs a new [FileSystemMoveEvent].

