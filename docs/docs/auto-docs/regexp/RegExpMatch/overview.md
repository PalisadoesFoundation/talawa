# Overview for `RegExpMatch`

## Description

A regular expression match.

 Regular expression matches are [Match]es. They also include the ability
 to retrieve the names for any named capture groups and to retrieve
 matches for named capture groups by name instead of by their index.

 Example:
 ```dart
 const pattern =
     r'^\[(?<Time>\s*((?<hour>\d+)):((?<minute>\d+))\.((?<second>\d+)))\]'
     r'\s(?<Message>\s*(.*)$)';

 final regExp = RegExp(
   pattern,
   multiLine: true,
 );

 const multilineText = '[00:13.37] This is a first message.\n'
     '[01:15.57] This is a second message.\n';

 RegExpMatch regExpMatch = regExp.firstMatch(multilineText)!;
 print(regExpMatch.groupNames.join('-')); // hour-minute-second-Time-Message.
 final time = regExpMatch.namedGroup('Time'); // 00:13.37
 final hour = regExpMatch.namedGroup('hour'); // 00
 final minute = regExpMatch.namedGroup('minute'); // 13
 final second = regExpMatch.namedGroup('second'); // 37
 final message =
     regExpMatch.namedGroup('Message'); // This is the first message.
 final date = regExpMatch.namedGroup('Date'); // Undefined `Date`, throws.

 Iterable&lt;RegExpMatch&gt; matches = regExp.allMatches(multilineText);
 for (final m in matches) 
 ```

## Dependencies

- Match

