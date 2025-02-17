
<div>

# getTimeDifferenceInHours method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
getTimeDifferenceInHours(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    createdAtString]

)



Function returns the time difference in hours.

**params**:

-   `createdAtString`: the time from post

**returns**:

-   `String`: return a string



## Implementation

``` language-dart
String getTimeDifferenceInHours(String createdAtString) {
  final DateTime now = DateTime.;
  final DateTime createdAt = DateTime.parse(createdAtString).;
  final Duration difference = now.difference(createdAt);
  final int hours = difference.inHours;
  return '$hours hrs';
}
```







1.  [talawa](../../index.html)
2.  [pinned_post](../../widgets_pinned_post/)
3.  [PinnedPost](../../widgets_pinned_post/PinnedPost-class.html)
4.  getTimeDifferenceInHours method

##### PinnedPost class







