# Method: `hasMatch`

## Description

Checks whether this regular expression has a match in the [input].

 ```dart
 var string = 'Dash is a bird';
 var regExp = RegExp(r'(humming)?bird');
 var match = regExp.hasMatch(string); // true

 regExp = RegExp(r'dog');
 match = regExp.hasMatch(string); // false
 ```

## Return Type
`bool`

## Parameters

- `input`: `String`
