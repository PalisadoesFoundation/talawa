
<div>

# read method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Post](../../models_post_post_model/Post-class.md)]
read(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.md)]
    reader]

)


override




Is called when a value has to be decoded.



## Implementation

``` language-dart
@override
Post read(BinaryReader reader) {
  final numOfFields = reader.;
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.: reader.,
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







1.  [talawa](../../index.md)
2.  [post_model](../../models_post_post_model/)
3.  [PostAdapter](../../models_post_post_model/PostAdapter-class.md)
4.  read method

##### PostAdapter class







