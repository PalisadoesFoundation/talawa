




Comment.fromJson constructor - Comment - comment\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/comment/comment\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_comment_comment_model/)
3. [Comment](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_comment_comment_model/Comment-class.html)
4. Comment.fromJson factory constructor

Comment.fromJson


dark\_mode

light\_mode




# Comment.fromJson constructor


Comment.fromJson(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json

)

## Implementation

```
factory Comment.fromJson(Map<String, dynamic> json) {
  return Comment(
    text: json['text'] as String?,
    createdAt: json['createdAt'] as String?,
    creator: json['creator'] == null
        ? null
        //Creating a new User instance from a map structure.
        : User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          ),
    post: json['post'] as String?,
    likeCount: json['likeCount'] as String?,
  );
}
```

 


1. [talawa](../../index.html)
2. [comment\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_comment_comment_model/)
3. [Comment](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_comment_comment_model/Comment-class.html)
4. Comment.fromJson factory constructor

##### Comment class





talawa
1.0.0+1






