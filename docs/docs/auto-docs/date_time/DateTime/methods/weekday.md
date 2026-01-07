# Method: `weekday`

## Description

The day of the week [monday]..[sunday].

 In accordance with ISO 8601
 a week starts with Monday, which has the value 1.

 ```dart
 final moonLanding = DateTime.parse('1969-07-20 20:18:04Z');
 print(moonLanding.weekday); // 7
 assert(moonLanding.weekday == DateTime.sunday);
 ```

## Return Type
`int`

