




write method - CommentAdapter class - comment\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/comment/comment\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_comment_comment_model/)
3. [CommentAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_comment_comment_model/CommentAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
write(

1. dynamic writer,
2. [Comment](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_comment_comment_model/Comment-class.html) obj

)

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
2. [comment\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_comment_comment_model/)
3. [CommentAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_comment_comment_model/CommentAdapter-class.html)
4. write method

##### CommentAdapter class





talawa
1.0.0+1






