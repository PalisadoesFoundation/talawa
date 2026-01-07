# Method: `stringMatch`

## Description

Finds the string of the first match of this regular expression
 in [input].

 Searches for a match for this regular expression in [input],
 just like [firstMatch],
 but returns only the matched substring if a match is found,
 not a [RegExpMatch].

 ```dart
 var string = 'Dash is a bird';
 var regExp = RegExp(r'(humming)?bird');
 var match = regExp.stringMatch(string); // Match

 regExp = RegExp(r'dog');
 match = regExp.stringMatch(string); // No match
 ```

## Return Type
`String?`

## Parameters

- `input`: `String`
