




read method - LikedByAdapter class - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../models_post_post_model/models_post_post_model-library.html)
3. [LikedByAdapter](../../models_post_post_model/LikedByAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @override

[LikedBy](../../models_post_post_model/LikedBy-class.html)
read(

1. [BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader

)
override

Is called when a value has to be decoded.


## Implementation

```
@override
LikedBy read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return LikedBy(
    sId: fields[0] as String?,
  );
}
```

 


1. [talawa](../../index.html)
2. [post\_model](../../models_post_post_model/models_post_post_model-library.html)
3. [LikedByAdapter](../../models_post_post_model/LikedByAdapter-class.html)
4. read method

##### LikedByAdapter class





talawa
1.0.0+1






