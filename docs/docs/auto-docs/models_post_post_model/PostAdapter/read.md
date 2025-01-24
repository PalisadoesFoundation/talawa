




read method - PostAdapter class - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../models_post_post_model/models_post_post_model-library.html)
3. [PostAdapter](../../models_post_post_model/PostAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @override

[Post](../../models_post_post_model/Post-class.html)
read(

1. [BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader

)
override

Is called when a value has to be decoded.


## Implementation

```
@override
Post read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return Post(
    sId: fields[0] as String,
    description: fields[1] as String?,
    createdAt: fields[2] as DateTime?,
    imageUrl: fields[3] as String?,
    base64String: fields[4] as String?,
    videoUrl: fields[5] as String?,
    creator: fields[6] as User?,
    organization: fields[7] as OrgInfo?,
    likedBy: (fields[8] as List?)?.cast<LikedBy>(),
    comments: (fields[9] as List?)?.cast<Comments>(),
  );
}
```

 


1. [talawa](../../index.html)
2. [post\_model](../../models_post_post_model/models_post_post_model-library.html)
3. [PostAdapter](../../models_post_post_model/PostAdapter-class.html)
4. read method

##### PostAdapter class





talawa
1.0.0+1






