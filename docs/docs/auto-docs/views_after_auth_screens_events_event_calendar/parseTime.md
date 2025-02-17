
<div>

# parseTime function

</div>


[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
parseTime(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    time]

)



a_line_ending_with_end_punctuation.

**params**:

-   `time`: define_the_param

**returns**:

-   `DateTime`: define_the_return



## Implementation

``` language-dart
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







1.  [talawa](../index.md)
2.  [event_calendar](../views_after_auth_screens_events_event_calendar/)
3.  parseTime function

##### event_calendar library







