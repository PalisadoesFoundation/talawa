




read method - CommentAdapter class - comment\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/comment/comment\_model.dart](../../models_comment_comment_model/models_comment_comment_model-library.html)
3. [CommentAdapter](../../models_comment_comment_model/CommentAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @override

[Comment](../../models_comment_comment_model/Comment-class.html)
read(

1. [BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader

)
override

Is called when a value has to be decoded.


## Implementation

```
@override
Comment read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return Comment(
    text: fields[0] as String?,
    createdAt: fields[1] as String?,
    creator: fields[2] as User?,
    post: fields[3] as String?,
    likeCount: fields[4] as String?,
  );
}
```

 


1. [talawa](../../index.html)
2. [comment\_model](../../models_comment_comment_model/models_comment_comment_model-library.html)
3. [CommentAdapter](../../models_comment_comment_model/CommentAdapter-class.html)
4. read method

##### CommentAdapter class





talawa
1.0.0+1






