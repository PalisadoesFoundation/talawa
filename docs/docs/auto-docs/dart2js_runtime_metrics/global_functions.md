# Global Functions and Variables

## startupMetrics

A collection of metrics for events that happen before `` is entered.

 The contents of the map depend on the platform. The map values are simple
 objects (strings, numbers, Booleans). There is always an entry for the key
 `'runtime'` with a [String] value.

 This implementation for dart2js has the content (subject to change):

 - `runtime`: `'dart2js'`

 - `firstMs`: First `performance.` reading taken from the main.dart.js
   file. This is the earliest time that the script is executing. The script
   has already been loaded and parsed (otherwise the script load would fail)
   and these earlier events may be available from the `performance` API.

 - `dartProgramMs`: `performance.` immediately inside the large function
   with the name 'dartProgram' that wraps all the Dart code, before doing any
   program setup actions.

 - `callMainMs`: performance. just before calling , after doing
   all program setup actions.

 The injected code uses `Date.` if `performance.` is not defined.

- **Return Type:** `Map&lt;String, Object&gt;`

## runtimeMetrics

A collection of metrics collected during the runtime of a Dart app.

 The contents of the map depend on the platform. The map values are simple
 objects (strings, numbers, Booleans). There is always an entry for the key
 `'runtime'` with a [String] value.

 This implementation for dart2js has the content (subject to change):

 - `runtime`: `'dart2js'`

 - `allocations`: A JSON Map&lt;String, Object&gt; that holds every
   runtime-allocated class or closure. The key contains a resolved path of
   the class or closure. The value is currently unused.

- **Return Type:** `Map&lt;String, Object&gt;`

