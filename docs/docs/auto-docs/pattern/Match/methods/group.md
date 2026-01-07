# Method: `group`

## Description

The string matched by the given [group].

 If [group] is 0, returns the entire match of the pattern.

 The result may be `null` if the pattern didn't assign a value to it
 as part of this match.
 ```dart import:convert

 final string = '[00:13.37] This is a chat message.';
 final regExp = RegExp(r'^\[\s*(\d+):(\d+)\.(\d+)\]\s*(.*)$');
 final match = regExp.firstMatch(string)!;
 final message = jsonEncode(match[0]!); // '[00:13.37] This is a chat message.'
 final hours = jsonEncode(match[1]!); // '00'
 final minutes = jsonEncode(match[2]!); // '13'
 final seconds = jsonEncode(match[3]!); // '37'
 final text = jsonEncode(match[4]!); // 'This is a chat message.'
 ```

## Return Type
`String?`

## Parameters

- `group`: `int`
