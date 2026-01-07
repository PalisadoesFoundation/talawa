# Overview for `LineSplitter`

## Description

A [StreamTransformer] that splits a [String] into individual lines.

 A line is terminated by either:
 * a CR, carriage return: U+000D ('\r')
 * a LF, line feed (Unix line break): U+000A ('\n') or
 * a CR+LF sequence (DOS/Windows line break), and
 * a final non-empty line can be ended by the end of the input.

 The resulting lines do not contain the line terminators.

 Example:
 ```dart
 const splitter = ;
 const sampleText =
     'Dart is: \r an object-oriented \n class-based \n garbage-collected '
     '\r\n language with C-style syntax \r\n';

 final sampleTextLines = splitter.convert(sampleText);
 for (var i = 0; i < sampleTextLines.length; i++) 
 // 0: Dart is:
 // 1:  an object-oriented
 // 2:  class-based
 // 3:  garbage-collected
 // 4:  language with C-style syntax
 ```

## Dependencies

- StreamTransformerBase

## Constructors

### Unnamed Constructor


