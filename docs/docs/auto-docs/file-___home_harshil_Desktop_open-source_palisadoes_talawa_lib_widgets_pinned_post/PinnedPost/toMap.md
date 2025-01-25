




toMap method - PinnedPost class - pinned\_post library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/pinned\_post.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/)
3. [PinnedPost](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/PinnedPost-class.html)
4. toMap method

toMap


dark\_mode

light\_mode




# toMap method


[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>
toMap(

1. [int](https://api.flutter.dev/flutter/dart-core/int-class.html) index

)

converts post to mapped string.

**params**:

* `index`: current index

**returns**:

* `Map<String, String>`: returns a map

## Implementation

```
Map<String, String> toMap(int index) {
  return {
    'title': this.pinnedPost[index].description!,
    'postId': this.pinnedPost[index].sId,
    'imageUrl': this.pinnedPost[index].imageUrl!,
    'time': getTimeDifferenceInHours(
      this.pinnedPost[index].createdAt!.toIso8601String(),
    ),
  };
}
```

 


1. [talawa](../../index.html)
2. [pinned\_post](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/)
3. [PinnedPost](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/PinnedPost-class.html)
4. toMap method

##### PinnedPost class





talawa
1.0.0+1






