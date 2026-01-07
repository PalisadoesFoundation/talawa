# Method: `matchAsPrefix`

## Description

Matches this pattern against the start of `string`.

 Returns a match if the pattern matches a substring of [string]
 starting at [start], and `null` if the pattern doesn't match
 at that point.

 The [start] must be non-negative and no greater than `string.length`.
 ```dart
 final string = 'Dash is a bird';

 var regExp = RegExp(r'bird');
 var match = regExp.matchAsPrefix(string, 10); // Match found.

 regExp = RegExp(r'bird');
 match = regExp.matchAsPrefix(string); // null
 ```

## Return Type
`Match?`

## Parameters

- `string`: `String`
- ``: `dynamic`
