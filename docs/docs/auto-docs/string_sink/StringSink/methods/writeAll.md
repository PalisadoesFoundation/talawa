# Method: `writeAll`

## Description

Writes the elements of [objects] separated by [separator].

 Writes the string representation of every element of [objects],
 in iteration order, and writes [separator] between any two elements.

 ```dart
 sink.writeAll(["Hello", "World"], " Beautiful ");
 ```
 is equivalent to:
 ```dart
 sink
   ..write("Hello");
   ..write(" Beautiful ");
   ..write("World");
 ```

## Return Type
`void`

## Parameters

- `objects`: `Iterable&lt;dynamic&gt;`
- ``: `dynamic`
