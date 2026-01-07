# Overview for `StringBuffer`

## Description

A class for concatenating strings efficiently.

 Allows for the incremental building of a string using `write*` methods.
 The strings are concatenated to a single string only when [toString] is
 called.

 Example:
 ```dart
 final buffer = StringBuffer('DART');
 print(buffer.length); // 4
 ```
 To add the string representation of an object, as returned by
 [Object.toString], to the buffer, use [write].
 Is also used for adding a string directly.
 ```
 buffer.write(' is open source');
 print(buffer.length); // 19
 print(buffer); // DART is open source

 const int dartYear = 2011;
 buffer
   ..write(' since ') // Writes a string.
   ..write(dartYear); // Writes an int.
 print(buffer); // DART is open source since 2011
 print(buffer.length); // 30
 ```
 To add a newline after the object's string representation, use [writeln].
 Calling [writeln] with no argument adds a single newline to the buffer.
 ```
 buffer.; // Contains "DART is open source since 2011\n".
 buffer.writeln('-' * (buffer.length - 1)); // 30 '-'s and a newline.
 print(buffer.length); // 62
 ```
 To write multiple objects to the buffer, use [writeAll].
 ```
 const separator = '-';
 buffer.writeAll(['Dart', 'is', 'fun!'], separator);
 print(buffer.length); // 74
 print(buffer);
 // DART is open source since 2011
 // ------------------------------
 // Dart-is-fun!
 ```
 To add the string representation of a Unicode code point, `charCode`,
 to the buffer, use [writeCharCode].
 ```
 buffer.writeCharCode(0x0A); // LF (line feed)
 buffer.writeCharCode(0x44); // 'D'
 buffer.writeCharCode(0x61); // 'a'
 buffer.writeCharCode(0x72); // 'r'
 buffer.writeCharCode(0x74); // 't'
 print(buffer.length); // 79
 ```
 To convert the content to a single string, use [toString].
 ```
 final text = buffer.;
 print(text);
 // DART is open source since 2011
 // ------------------------------
 // Dart-is-fun!
 // Dart
 ```
 To clear the buffer, so that it can be reused, use [clear].
 ```
 buffer.;
 print(buffer.isEmpty); // true
 print(buffer.length); // 0
 ```

## Dependencies

- StringSink

## Constructors

### Unnamed Constructor
Creates a string buffer containing the provided [content].

