# Overview for `File`

## Description

A reference to a file on the file system.

 A `File` holds a [path] on which operations can be performed.
 You can get the parent directory of the file using [parent],
 a property inherited from [FileSystemEntity].

 Create a new `File` object with a pathname to access the specified file on the
 file system from your program.
 ```dart
 var myFile = File('file.txt');
 ```
 The `File` class contains methods for manipulating files and their contents.
 Using methods in this class, you can open and close files, read to and write
 from them, create and delete them, and check for their existence.

 When reading or writing a file, you can use streams (with [openRead]),
 random access operations (with [open]),
 or convenience methods such as [readAsString],

 Most methods in this class occur in synchronous and asynchronous pairs,
 for example, [readAsString] and [readAsStringSync].
 Unless you have a specific reason for using the synchronous version
 of a method, prefer the asynchronous version to avoid blocking your program.

 ## If path is a link

 If [path] is a symbolic link, rather than a file,
 then the methods of `File` operate on the ultimate target of the
 link, except for [delete] and [deleteSync], which operate on
 the link.

 ## Read from a file

 The following code sample reads the entire contents from a file as a string
 using the asynchronous [readAsString] method:
 ```dart
 import 'dart:async';
 import 'dart:io';

 void  
 ```
 A more flexible and useful way to read a file is with a [Stream].
 Open the file with [openRead], which returns a stream that
 provides the data in the file as chunks of bytes.
 Read the stream to process the file contents when available.
 You can use various transformers in succession to manipulate the
 file content into the required format, or to prepare it for output.

 You might want to use a stream to read large files,
 to manipulate the data with transformers,
 or for compatibility with another API, such as [WebSocket]s.
 ```dart
 import 'dart:io';
 import 'dart:convert';
 import 'dart:async';

 void  async 
 ```
 ## Write to a file

 To write a string to a file, use the [writeAsString] method:
 ```dart
 import 'dart:io';

 void  async 
 ```
 You can also write to a file using a [Stream]. Open the file with
 [openWrite], which returns an [IOSink] to which you can write data.
 Be sure to close the sink with the [IOSink.close] method.
 ```dart
 import 'dart:io';

 void  async 
 ```
 ## The use of asynchronous methods

 To avoid unintentional blocking of the program,
 several methods are asynchronous and return a [Future]. For example,
 the [length] method, which gets the length of a file, returns a [Future].
 Wait for the future to get the result when it's ready.
 ```dart
 import 'dart:io';

 void  async 
 ```
 In addition to length, the [exists], [lastModified], [stat], and
 other methods, are asynchronous.

 ## Special 'nul' file

 On Linux and Mac '/dev/null' and on Windows '\\?\NUL' refer to a special file,
 such that all writes to it get consumed and disappear, and all reads produce empty
 output. Note that on Windows 'nul'(without '\\?\'-prefix) refers to a regular file
 named  'nul' in current directory.

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
Creates a [File] object.

 If [path] is a relative path, it will be interpreted relative to the
 current working directory (see [Directory.current]), when used.

 If [path] is an absolute path, it will be immune to changes to the
 current working directory.

### fromUri
Create a [File] object from a URI.

 If [uri] cannot reference a file this throws [UnsupportedError].

#### Parameters

- `uri`: `Uri`
### fromRawPath
Creates a [File] object from a raw path.

 A raw path is a sequence of bytes, as paths are represented by the OS.

#### Parameters

- `rawPath`: `Uint8List`
