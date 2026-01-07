# Method: `escape`

## Description

Creates regular expression syntax that matches the input [text].

 If [text] contains regular expression reserved characters,
 the resulting regular expression matches those characters literally.
 If [text] contains no regular expression reserved characters,
 Dart returns the expression unmodified.

 The reserved characters in regular expressions are:
 `(`, `)`, `[`, `]`, ``, `*`, `+`, `?`, `.`, `^`, `$`, `|` and `\`.

 Use this method to create a pattern to be included in a
 larger regular expression. Since a [String] is itself a [Pattern]
 which matches itself, converting the string to a regular expression
 isn't needed to search for that exact string.
 ```dart
 print(RegExp.escape('dash@example.com')); // dash@example\.com
 print(RegExp.escape('a+b')); // a\+b
 print(RegExp.escape('a*b')); // a\*b
 print(RegExp.escape('')); // \
 print(RegExp.escape('a?')); // a\?
 ```

## Return Type
`String`

## Parameters

- `text`: `String`
