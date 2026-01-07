# Overview for `Directory`

## Description

A reference to a directory (or _folder_) on the file system.

 A [Directory] is an object holding a [path] on which operations can
 be performed. The path to the directory can be [absolute] or relative.
 It allows access to the [parent] directory,
 since it is a [FileSystemEntity].

 The [Directory] also provides static access to the system's temporary
 file directory, [systemTemp], and the ability to access and change
 the [current] directory.

 Create a new [Directory] to give access the directory with the specified
 path:
 ```dart
 var myDir = Directory('myDir');
 ```
 Most instance methods of [Directory] exist in both synchronous
 and asynchronous variants, for example, [create] and [createSync].
 Unless you have a specific reason for using the synchronous version
 of a method, prefer the asynchronous version to avoid blocking your program.

 ## Create a directory

 The following code sample creates a directory using the [create] method.
 By setting the `recursive` parameter to true, you can create the
 named directory and all its necessary parent directories,
 if they do not already exist.
 ```dart
 import 'dart:io';

 void  async 
 ```
 ## List the entries of a directory

 Use the [list] or [listSync] methods to get the files and directories
 contained in a directory.
 Set `recursive` to true to recursively list all subdirectories.
 Set `followLinks` to true to follow symbolic links.
 The list method returns a [Stream] of [FileSystemEntity] objects.
 Listen on the stream to access each object as it is found:
 ```dart
 import 'dart:io';

 void  async 
 ```
 ## The use of asynchronous methods

 I/O operations can block a program for some period of time while it waits for
 the operation to complete. To avoid this, all
 methods involving I/O have an asynchronous variant which returns a [Future].
 This future completes when the I/O operation finishes. While the I/O
 operation is in progress, the Dart program is not blocked,
 and can perform other operations.

 For example,
 the [exists] method, which determines whether the directory exists,
 returns a boolean value asynchronously using a [Future].
 ```dart
 import 'dart:io';

 void  async 
 ```

 In addition to [exists], the [stat], [rename],
 and other methods are also asynchronous.

 ## Other resources

 * The [Files and directories](https://dart.dev/guides/libraries/library-tour#files-and-directories)
   section of the library tour.

 * [Write Command-Line Apps](https://dart.dev/tutorials/server/cmdline),
   a tutorial about writing command-line apps, includes information about
   files and directories.

## Dependencies

- FileSystemEntity

## Constructors

### Unnamed Constructor
Creates a [Directory] object.

 If [path] is a relative path, it will be interpreted relative to the
 current working directory (see [Directory.current]), when used.

 If [path] is an absolute path, it will be immune to changes to the
 current working directory.

### fromRawPath


#### Parameters

- `path`: `Uint8List`
### fromUri
Create a [Directory] from a URI.

 If [uri] cannot reference a directory this throws [UnsupportedError].

#### Parameters

- `uri`: `Uri`
