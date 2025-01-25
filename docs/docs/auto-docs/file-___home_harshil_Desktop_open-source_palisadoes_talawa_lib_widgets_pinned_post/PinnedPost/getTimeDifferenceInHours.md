




getTimeDifferenceInHours method - PinnedPost class - pinned\_post library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/pinned\_post.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/)
3. [PinnedPost](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/PinnedPost-class.html)
4. getTimeDifferenceInHours method

getTimeDifferenceInHours


dark\_mode

light\_mode




# getTimeDifferenceInHours method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
getTimeDifferenceInHours(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) createdAtString

)

Function returns the time difference in hours.

**params**:

* `createdAtString`: the time from post

**returns**:

* `String`: return a string

## Implementation

```
String getTimeDifferenceInHours(String createdAtString) {
  final DateTime now = DateTime.now();
  final DateTime createdAt = DateTime.parse(createdAtString).toLocal();
  final Duration difference = now.difference(createdAt);
  final int hours = difference.inHours;
  return '$hours hrs';
}
```

 


1. [talawa](../../index.html)
2. [pinned\_post](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/)
3. [PinnedPost](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/PinnedPost-class.html)
4. getTimeDifferenceInHours method

##### PinnedPost class





talawa
1.0.0+1






