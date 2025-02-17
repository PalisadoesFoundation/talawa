
<div>

# read method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[LikedBy](../../models_post_post_model/LikedBy-class.html)]
read(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html)]
    reader]

)


override




Is called when a value has to be decoded.



## Implementation

``` language-dart
@override
LikedBy read(BinaryReader reader) {
  final numOfFields = reader.;
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.: reader.,
  };
  return LikedBy(
    sId: fields[0] as String?,
  );
}
```







1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [LikedByAdapter](../../models_post_post_model/LikedByAdapter-class.html)
4.  read method

##### LikedByAdapter class







