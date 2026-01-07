# Method: `isCaseSensitive`

## Description

Whether this regular expression is case sensitive.

 If the regular expression is not case sensitive, it will match an input
 letter with a pattern letter even if the two letters are different case
 versions of the same letter.
 ```dart
 final text = 'Parse my string';
 var regExp = RegExp(r'STRING', caseSensitive: false);
 print(regExp.isCaseSensitive); // false
 print(regExp.hasMatch(text)); // true, matches.

 regExp = RegExp(r'STRING', caseSensitive: true);
 print(regExp.isCaseSensitive); // true
 print(regExp.hasMatch(text)); // false, no match.
 ```

## Return Type
`bool`

