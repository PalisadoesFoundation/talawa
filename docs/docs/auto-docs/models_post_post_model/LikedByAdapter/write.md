




write method - LikedByAdapter class - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../models_post_post_model/models_post_post_model-library.html)
3. [LikedByAdapter](../../models_post_post_model/LikedByAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @override

void
write(

1. [BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer,
2. [LikedBy](../../models_post_post_model/LikedBy-class.html) obj

)
override

Is called when a value has to be encoded.


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
2. [post\_model](../../models_post_post_model/models_post_post_model-library.html)
3. [LikedByAdapter](../../models_post_post_model/LikedByAdapter-class.html)
4. write method

##### LikedByAdapter class





talawa
1.0.0+1






