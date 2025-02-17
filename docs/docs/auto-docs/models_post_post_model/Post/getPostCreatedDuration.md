
<div>

# getPostCreatedDuration method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




this is to get duration of post.

**params**: None

**returns**:

-   `String`: date is returned in ago form.



## Implementation

``` language-dart
String  {
  if (DateTime..difference(this.createdAt!).inSeconds < 60) {
    return '${DateTime..difference(this.createdAt!).inSeconds} Seconds Ago';
  } else if (DateTime..difference(this.createdAt!).inMinutes < 60) {
    return '${DateTime..difference(this.createdAt!).inMinutes} Minutes Ago';
  } else if (DateTime..difference(this.createdAt!).inHours < 24) {
    return '${DateTime..difference(this.createdAt!).inHours} Hours Ago';
  } else if (DateTime..difference(this.createdAt!).inDays < 30) {
    return '${DateTime..difference(this.createdAt!).inDays} Days Ago';
  } else if (DateTime..difference(this.createdAt!).inDays < 365) {
    return '${DateTime..difference(this.createdAt!).inDays ~/ 30} Months Ago';
  } else {
    return '${DateTime..difference(this.createdAt!).inDays ~/ 365} Years Ago';
  }
}
```







1.  [talawa](../../index.md)
2.  [post_model](../../models_post_post_model/)
3.  [Post](../../models_post_post_model/Post-class.md)
4.  getPostCreatedDuration method

##### Post class







