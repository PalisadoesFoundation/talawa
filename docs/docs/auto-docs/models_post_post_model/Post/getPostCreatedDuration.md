




getPostCreatedDuration method - Post class - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../models_post_post_model/models_post_post_model-library.html)
3. [Post](../../models_post_post_model/Post-class.html)
4. getPostCreatedDuration method

getPostCreatedDuration


dark\_mode

light\_mode




# getPostCreatedDuration method


String
getPostCreatedDuration()

this is to get duration of post.

**params**:
None

**returns**:

* `String`: date is returned in ago form.

## Implementation

```
String getPostCreatedDuration() {
  if (DateTime.now().difference(this.createdAt!).inSeconds < 60) {
    return '${DateTime.now().difference(this.createdAt!).inSeconds} Seconds Ago';
  } else if (DateTime.now().difference(this.createdAt!).inMinutes < 60) {
    return '${DateTime.now().difference(this.createdAt!).inMinutes} Minutes Ago';
  } else if (DateTime.now().difference(this.createdAt!).inHours < 24) {
    return '${DateTime.now().difference(this.createdAt!).inHours} Hours Ago';
  } else if (DateTime.now().difference(this.createdAt!).inDays < 30) {
    return '${DateTime.now().difference(this.createdAt!).inDays} Days Ago';
  } else if (DateTime.now().difference(this.createdAt!).inDays < 365) {
    return '${DateTime.now().difference(this.createdAt!).inDays ~/ 30} Months Ago';
  } else {
    return '${DateTime.now().difference(this.createdAt!).inDays ~/ 365} Years Ago';
  }
}
```

 


1. [talawa](../../index.html)
2. [post\_model](../../models_post_post_model/models_post_post_model-library.html)
3. [Post](../../models_post_post_model/Post-class.html)
4. getPostCreatedDuration method

##### Post class





talawa
1.0.0+1






