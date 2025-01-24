




write method - CommentAdapter class - comment\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/comment/comment\_model.dart](../../models_comment_comment_model/models_comment_comment_model-library.html)
3. [CommentAdapter](../../models_comment_comment_model/CommentAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @override

void
write(

1. [BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer,
2. [Comment](../../models_comment_comment_model/Comment-class.html) obj

)
override

Is called when a value has to be encoded.


## Implementation

```
@override
void write(BinaryWriter writer, Comment obj) {
  writer
    ..writeByte(5)
    ..writeByte(0)
    ..write(obj.text)
    ..writeByte(1)
    ..write(obj.createdAt)
    ..writeByte(2)
    ..write(obj.creator)
    ..writeByte(3)
    ..write(obj.post)
    ..writeByte(4)
    ..write(obj.likeCount);
}
```

 


1. [talawa](../../index.html)
2. [comment\_model](../../models_comment_comment_model/models_comment_comment_model-library.html)
3. [CommentAdapter](../../models_comment_comment_model/CommentAdapter-class.html)
4. write method

##### CommentAdapter class





talawa
1.0.0+1






