# Method: `packageConfig`

## Description

The location of the package configuration file of the current isolate.

 If the isolate was spawned without specifying its package configuration
 file then the returned value is `null`.

 Otherwise, the returned value is an absolute URI specifying the location
 of isolate's package configuration file.

 The package configuration file is usually named `package_config.json`,
 and you can use [`package:package_config`](https://pub.dev/documentation/package_config/latest/)
 to read and parse it.

## Return Type
`Future<Uri?>`

