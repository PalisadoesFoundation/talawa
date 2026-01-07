# Method: `allMatches`

## Description

Matches this pattern against the string repeatedly.

 If [start] is provided, matching will start at that index.

 The returned iterable lazily finds non-overlapping matches
 of the pattern in the [string].
 If a user only requests the first match,
 this function should not compute all possible matches.

 The matches are found by repeatedly finding the first match
 of the pattern in the string, initially starting from [start],
 and then from the end of the previous match (but always
 at least one position later than the *start* of the previous
 match, in case the pattern matches an empty substring).
 ```dart
 RegExp exp = RegExp(r'(\w+)');
 var str = 'Dash is a bird';
 Iterable&lt;Match&gt; matches = exp.allMatches(str, 8);
 for (final Match m in matches) 
 ```
 The output of the example is:
 ```
 a
 bird
 ```

## Return Type
`Iterable&lt;Match&gt;`

## Parameters

- `string`: `String`
- ``: `dynamic`
