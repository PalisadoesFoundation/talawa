
<div>

# write method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

void write(

1.  [[[BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html)]
    writer, ]
2.  [[[Post](../../models_post_post_model/Post-class.html)]
    obj]

)


override




Is called when a value has to be encoded.



## Implementation

``` language-dart
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







1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [PostAdapter](../../models_post_post_model/PostAdapter-class.html)
4.  write method

##### PostAdapter class







