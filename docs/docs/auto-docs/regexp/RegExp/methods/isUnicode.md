# Method: `isUnicode`

## Description

Whether this regular expression uses Unicode mode.

 In Unicode mode, Dart treats UTF-16 surrogate pairs in the original
 string as a single code point and will not match each code unit in the
 pair separately. Otherwise,
 Dart treats the target string as a sequence of individual code
 units and does not treat surrogates as special.

 In Unicode mode, Dart restricts the syntax of the RegExp pattern,
 for example disallowing some unescaped uses
 of restricted regexp characters,
 and disallowing unnecessary `\`-escapes ("identity escapes"),
 which have both historically been allowed in non-Unicode mode.
 Dart also allows some pattern features, like Unicode property escapes,
 only in this mode.
 ```dart
 var regExp = RegExp(r'^\p$', unicode: true);
 print(regExp.hasMatch('a')); // true
 print(regExp.hasMatch('b')); // true
 print(regExp.hasMatch('?')); // false
 print(regExp.hasMatch(r'p')); // false

 // U+1F600 (😀), one code point, two code units.
 var smiley = '\ud83d\ude00';

 regExp = RegExp(r'^.$', unicode: true); // Matches one code point.
 print(regExp.hasMatch(smiley)); // true
 regExp = RegExp(r'^..$', unicode: true); // Matches two code points.
 print(regExp.hasMatch(smiley)); // false

 regExp = RegExp(r'^\p$', unicode: false);
 print(regExp.hasMatch('a')); // false
 print(regExp.hasMatch('b')); // false
 print(regExp.hasMatch('?')); // false
 print(regExp.hasMatch(r'p')); // true

 regExp = RegExp(r'^.$', unicode: false);  // Matches one code unit.
 print(regExp.hasMatch(smiley)); // false
 regExp = RegExp(r'^..$', unicode: false);  // Matches two code units.
 print(regExp.hasMatch(smiley)); // true
 ```

## Return Type
`bool`

