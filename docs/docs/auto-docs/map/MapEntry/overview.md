# Overview for `MapEntry`

## Description

A key/value pair representing an entry in a [Map].

 The [Map] interface contains various methods that can
 inspect or modify the map based on entry objects.
 ```dart
 final map = ;
 map.addEntries([
  MapEntry('3', 'C'),
  MapEntry('4', 'D'),
 ]);
 print(map); // 
 ```

 Do not extend or implement the `MapEntry` class.
 If the Dart language introduces value types,
 the `MapEntry` class will be changed to such a type,
 and will likely no longer be able to be implemented or extended
 by classes.

## Members

- **key**: `K`
  The key of the entry.

 ```dart
 final map = ; // Map&lt;String, String&gt;
 var entry = map.entries.first; // MapEntry&lt;String, String&gt;
 print(entry.key); // 'theKey'
 ```

- **value**: `V`
  The value associated to [key] in a map.

 ```dart
 final map = ; // Map&lt;String, String&gt;
 var entry = map.entries.first; // MapEntry&lt;String, String&gt;
 print(entry.value); // 'theValue'
 ```

## Constructors

### Unnamed Constructor
Creates an entry with [key] and [value].

### _


#### Parameters

- `key`: `dynamic`
- `value`: `dynamic`
