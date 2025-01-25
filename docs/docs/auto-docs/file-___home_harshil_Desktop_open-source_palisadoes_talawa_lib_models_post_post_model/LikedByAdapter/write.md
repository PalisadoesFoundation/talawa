




write method - LikedByAdapter class - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. [LikedByAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/LikedByAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
write(

1. dynamic writer,
2. [LikedBy](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/LikedBy-class.html) obj

)

## Implementation

```
@override
void write(BinaryWriter writer, LikedBy obj) {
  writer
    ..writeByte(1)
    ..writeByte(0)
    ..write(obj.sId);
}
```

 


1. [talawa](../../index.html)
2. [post\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. [LikedByAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/LikedByAdapter-class.html)
4. write method

##### LikedByAdapter class





talawa
1.0.0+1






