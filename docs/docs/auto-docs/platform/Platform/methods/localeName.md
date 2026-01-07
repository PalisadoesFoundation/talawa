# Method: `localeName`

## Description

Get the name of the current locale.

 The result usually consists of
  - a language (e.g., "en"), or
  - a language and country code (e.g. "en_US", "de_AT"), or
  - a language, country code and character set (e.g. "en_US.UTF-8").

 On macOS and iOS, the locale is taken from CFLocaleGetIdentifier.

 On Linux and Fuchsia, the locale is taken from the "LANG" environment
 variable, which may be set to any value. For example:
 ```shell
 LANG=kitten dart myfile.dart  # localeName is "kitten"
 ```

 On Android, the value will not change while the application is running,
 even if the user adjusts their language settings.

 See https://en.wikipedia.org/wiki/Locale_(computer_software)

## Return Type
`String`

