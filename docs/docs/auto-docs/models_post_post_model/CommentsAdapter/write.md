




write method - CommentsAdapter class - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../models_post_post_model/models_post_post_model-library.html)
3. [CommentsAdapter](../../models_post_post_model/CommentsAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @override

void
write(

1. [BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer,
2. [Comments](../../models_post_post_model/Comments-class.html) obj

)
override

Is called when a value has to be encoded.


## Implementation

```
@override
void write(BinaryWriter writer, Comments obj) {
  writer
    ..writeByte(1)
    ..writeByte(0)
    ..write(obj.sId);
}
```

 


1. [talawa](../../index.html)
2. [post\_model](../../models_post_post_model/models_post_post_model-library.html)
3. [CommentsAdapter](../../models_post_post_model/CommentsAdapter-class.html)
4. write method

##### CommentsAdapter class





talawa
1.0.0+1






