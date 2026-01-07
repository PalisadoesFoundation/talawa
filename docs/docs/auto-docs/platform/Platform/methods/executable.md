# Method: `executable`

## Description

The path of the executable used to run the script in this isolate.
 Usually `dart` when running on the Dart VM or the
 compiled script name (`script_name.exe`).

 The literal path used to identify the executable.
 This path might be relative or just be a name from which the executable
 was found by searching the system path.

 Use [resolvedExecutable] to get an absolute path to the executable.

## Return Type
`String`

