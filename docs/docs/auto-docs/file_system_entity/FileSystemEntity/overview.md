# Overview for `FileSystemEntity`

## Description

The common superclass of [File], [Directory], and [Link].

 [FileSystemEntity] objects are returned from directory listing
 operations. To determine whether a [FileSystemEntity] is a [File], a
 [Directory], or a [Link] perform a type check:
 ```dart
 if (entity is File) (entity as File).;
 ```
 You can also use the [type] or [typeSync] methods to determine
 the type of a file system object.

 Most methods in this class exist both in synchronous and asynchronous
 versions, for example, [exists] and [existsSync].
 Unless you have a specific reason for using the synchronous version
 of a method, prefer the asynchronous version to avoid blocking your program.

 Here's the exists method in action:
 ```dart
 var isThere = await entity.;
 print(isThere ? 'exists' : 'nonexistent');
 ```

 ## Other resources

 * The [Files and directories](https://dart.dev/guides/libraries/library-tour#files-and-directories)
   section of the library tour.

 * [Write Command-Line Apps](https://dart.dev/tutorials/server/cmdline),
   a tutorial about writing command-line apps, includes information about
   files and directories.

## Members

- **_backslashChar**: `dynamic`
- **_slashChar**: `dynamic`
- **_colonChar**: `dynamic`
- **_absoluteWindowsPathPattern**: `RegExp`
- **_parentRegExp**: `RegExp`
