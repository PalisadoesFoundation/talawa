# Method: `join`

## Description

Combines the string representation of elements into a single string.

 Each element is converted to a string using its [Object.toString] method.
 If [separator] is provided, it is inserted between element string
 representations.

 The returned future is completed with the combined string when this stream
 is done.

 If this stream emits an error, or the call to [Object.toString] throws,
 the returned future is completed with that error,
 and processing stops.

 Example:
 ```dart
 final result = await Stream.fromIterable(['Mars', 'Venus', 'Earth'])
     .join('--');
 print(result); // 'Mars--Venus--Earth'
 ```

## Return Type
`Future&lt;String&gt;`

## Parameters

- ``: `dynamic`
