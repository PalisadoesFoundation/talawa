
<div>

# toMap method

</div>


[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
toMap(

1.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.md)]
    index]

)



converts post to mapped string.

**params**:

-   `index`: current index

**returns**:

-   `Map<String, String>`: returns a map



## Implementation

``` language-dart
Map<String, String> toMap(int index) {
  return {
    'title': this.pinnedPost[index].description!,
    'postId': this.pinnedPost[index].sId,
    'imageUrl': this.pinnedPost[index].imageUrl!,
    'time': getTimeDifferenceInHours(
      this.pinnedPost[index].createdAt!.,
    ),
  };
}
```







1.  [talawa](../../index.md)
2.  [pinned_post](../../widgets_pinned_post/)
3.  [PinnedPost](../../widgets_pinned_post/PinnedPost-class.md)
4.  toMap method

##### PinnedPost class







