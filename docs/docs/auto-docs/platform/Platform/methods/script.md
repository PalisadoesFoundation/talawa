# Method: `script`

## Description

The absolute URI of the script being run in this isolate.

 If the script argument on the command line is relative,
 it is resolved to an absolute URI before fetching the script, and
 that absolute URI is returned.

 URI resolution only does string manipulation on the script path, and this
 may be different from the file system's path resolution behavior. For
 example, a symbolic link immediately followed by '..' will not be
 looked up.

 If a compiled Dart script is being executed the URI to the compiled
 script is returned, for example, `file:full/path/to/script_name.exe`.

 If running on the Dart VM the URI to the running Dart script is returned,
 for example, `file:full/path/to/script_name.dart`.

 If the executable environment does not support [script],
 the URI is empty.

## Return Type
`Uri`

