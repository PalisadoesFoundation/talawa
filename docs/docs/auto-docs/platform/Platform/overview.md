# Overview for `Platform`

## Description

Information about the environment in which the current program is running.

 Platform provides information such as the operating system,
 the hostname of the computer, the value of environment variables,
 the path to the running program,
 and other global properties of the program being run.

 ## Get the URI of the current Dart script

 Use the [script] getter to get the URI to the currently running
 Dart script.
 ```dart
 import 'dart:io' show Platform;

 void  
 ```
 ## Get the value of an environment variable

 The [environment] getter returns a the names and values of environment
 variables in a [Map] that contains key-value pairs of strings. The Map is
 unmodifiable. This sample shows how to get the value of the `PATH`
 environment variable.
 ```dart
 import 'dart:io' show Platform;

 void  
 ```
 ## Determine the OS

 You can get the name of the operating system as a string with the
 [operatingSystem] getter. You can also use one of the static boolean
 getters: [isMacOS], [isLinux], [isWindows], etc.
 ```dart
 import 'dart:io' show Platform;

 void  
 ```

## Members

- **numberOfProcessors**: `dynamic`
  The number of individual execution units of the machine.

- **pathSeparator**: `dynamic`
  The path separator used by the operating system to separate
 components in file paths.

- **operatingSystem**: `dynamic`
  A string representing the operating system or platform.

 Possible values include:
 * "android"
 * "fuchsia"
 * "ios"
 * "linux"
 * "macos"
 * "windows"

 Note that this list may change over time so platform-specific logic
 should be guarded by the appropriate Boolean getter e.g. [isMacOS].

- **operatingSystemVersion**: `dynamic`
  A string representing the version of the operating system or platform.

 The format of this string will vary by operating system, platform and
 version and is not suitable for parsing. For example:
   "Linux 5.11.0-1018-gcp #20~20.04.2-Ubuntu SMP Fri Sep 3 01:01:37 UTC 2021"
   "Version 14.5 (Build 18E182)"
   '"Windows 10 Pro" 10.0 (Build 19043)'

- **localHostname**: `dynamic`
  The local hostname for the system.

 For example:
   "mycomputer.corp.example.com"
   "mycomputer"

 Uses the platform
 [`gethostname`](https://pubs.opengroup.org/onlinepubs/9699919799/functions/gethostname.html)
 implementation.

- **version**: `dynamic`
  The version of the current Dart runtime.

 The value is a [semantic versioning](http://semver.org)
 string representing the version of the current Dart runtime,
 possibly followed by whitespace and other version and
 build details.

- **isLinux**: `bool`
  Whether the operating system is a version of
 [Linux](https://en.wikipedia.org/wiki/Linux).

 This value is `false` if the operating system is a specialized
 version of Linux that identifies itself by a different name,
 for example Android (see [isAndroid]).

- **isMacOS**: `bool`
  Whether the operating system is a version of
 [macOS](https://en.wikipedia.org/wiki/MacOS).

- **isWindows**: `bool`
  Whether the operating system is a version of
 [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).

- **isAndroid**: `bool`
  Whether the operating system is a version of
 [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29).

- **isIOS**: `bool`
  Whether the operating system is a version of
 [iOS](https://en.wikipedia.org/wiki/IOS).

- **isFuchsia**: `bool`
  Whether the operating system is a version of
 [Fuchsia](https://en.wikipedia.org/wiki/Google_Fuchsia).

