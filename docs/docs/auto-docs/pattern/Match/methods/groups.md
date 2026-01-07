# Method: `groups`

## Description

A list of the groups with the given indices.

 The list contains the strings returned by [group] for each index in
 [groupIndices].
 ```dart import:convert

 final string = '[00:13.37] This is a chat message.';
 final regExp = RegExp(r'^\[\s*(\d+):(\d+)\.(\d+)\]\s*(.*)$');
 final match = regExp.firstMatch(string)!;
 final message = jsonEncode(match.groups([1, 2, 3, 4]));
 // ['00','13','37','This is a chat message.']
 ```

## Return Type
`List<String?>`

## Parameters

- `groupIndices`: `List&lt;int&gt;`
