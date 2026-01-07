# Method: `firstMatch`

## Description

Finds the first match of the regular expression in the string [input].

 Returns `null` if there is no match.
 ```dart
 final string = '[00:13.37] This is a chat message.';
 final regExp = RegExp(r'c\w*');
 final match = regExp.firstMatch(string)!;
 print(match[0]); // chat
 ```

## Return Type
`RegExpMatch?`

## Parameters

- `input`: `String`
