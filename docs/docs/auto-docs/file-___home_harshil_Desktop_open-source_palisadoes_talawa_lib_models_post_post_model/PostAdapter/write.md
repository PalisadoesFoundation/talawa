




write method - PostAdapter class - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. [PostAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/PostAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
write(

1. dynamic writer,
2. [Post](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Post-class.html) obj

)

## Implementation

```
@override
void write(BinaryWriter writer, Post obj) {
  writer
    ..writeByte(10)
    ..writeByte(0)
    ..write(obj.sId)
    ..writeByte(1)
    ..write(obj.description)
    ..writeByte(2)
    ..write(obj.createdAt)
    ..writeByte(3)
    ..write(obj.imageUrl)
    ..writeByte(4)
    ..write(obj.base64String)
    ..writeByte(5)
    ..write(obj.videoUrl)
    ..writeByte(6)
    ..write(obj.creator)
    ..writeByte(7)
    ..write(obj.organization)
    ..writeByte(8)
    ..write(obj.likedBy)
    ..writeByte(9)
    ..write(obj.comments);
}
```

 


1. [talawa](../../index.html)
2. [post\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. [PostAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/PostAdapter-class.html)
4. write method

##### PostAdapter class





talawa
1.0.0+1






