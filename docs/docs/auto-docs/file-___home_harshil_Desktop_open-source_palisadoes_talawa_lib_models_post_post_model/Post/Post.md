




Post constructor - Post - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. [Post](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post-class.html)
4. Post constructor

Post


dark\_mode

light\_mode




# Post constructor


Post({

1. required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) sId,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? description,
3. [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)? createdAt,
4. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? imageUrl,
5. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? base64String,
6. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? videoUrl,
7. required dynamic creator,
8. dynamic organization,
9. [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[LikedBy](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/LikedBy-class.html)>? likedBy,
10. [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[Comments](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Comments-class.html)>? comments,

})

## Implementation

```
Post({
  required this.sId,
  this.description,
  this.createdAt,
  this.imageUrl,
  this.base64String,
  this.videoUrl,
  required this.creator,
  this.organization,
  this.likedBy,
  this.comments,
});
```

 


1. [talawa](../../index.html)
2. [post\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. [Post](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post-class.html)
4. Post constructor

##### Post class





talawa
1.0.0+1






