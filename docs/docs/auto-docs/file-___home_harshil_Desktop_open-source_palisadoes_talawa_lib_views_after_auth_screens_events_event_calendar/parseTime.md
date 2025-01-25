




parseTime function - event\_calendar library - Dart API







menu

1. [talawa](../index.html)
2. [views/after\_auth\_screens/events/event\_calendar.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_event_calendar/)
3. parseTime function

parseTime


dark\_mode

light\_mode




# parseTime function


[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)
parseTime(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) time

)

a\_line\_ending\_with\_end\_punctuation.

**params**:

* `time`: define\_the\_param

**returns**:

* `DateTime`: define\_the\_return

## Implementation

```
DateTime parseTime(String time) {
  try {
    return DateFormat('h:mm a', 'en_US').parse(time);
  } on FormatException {
    print('Caught FormatException: $time');
    try {
      return DateFormat('Hms').parse(time);
    } catch (e) {
      print('Caught error: $e');
      throw Exception('Invalid time format: $time');
    }
  }
}
```

 


1. [talawa](../index.html)
2. [event\_calendar](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_event_calendar/)
3. parseTime function

##### event\_calendar library





talawa
1.0.0+1






