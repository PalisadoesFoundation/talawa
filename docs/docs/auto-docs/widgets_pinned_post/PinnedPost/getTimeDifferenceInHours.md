




getTimeDifferenceInHours method - PinnedPost class - pinned\_post library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/pinned\_post.dart](../../widgets_pinned_post/widgets_pinned_post-library.html)
3. [PinnedPost](../../widgets_pinned_post/PinnedPost-class.html)
4. getTimeDifferenceInHours method

getTimeDifferenceInHours


dark\_mode

light\_mode




# getTimeDifferenceInHours method


String
getTimeDifferenceInHours(

1. String createdAtString

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
2. [pinned\_post](../../widgets_pinned_post/widgets_pinned_post-library.html)
3. [PinnedPost](../../widgets_pinned_post/PinnedPost-class.html)
4. getTimeDifferenceInHours method

##### PinnedPost class





talawa
1.0.0+1






