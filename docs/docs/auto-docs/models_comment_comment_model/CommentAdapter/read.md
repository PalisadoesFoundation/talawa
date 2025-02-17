
<div>

# read method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Comment](../../models_comment_comment_model/Comment-class.html)]
read(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html)]
    reader]

)


override




Is called when a value has to be decoded.



## Implementation

``` language-dart
@override
Comment read(BinaryReader reader) {
  final numOfFields = reader.;
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.: reader.,
  };
  return Comment(
    text: fields[0] as String?,
    createdAt: fields[1] as String?,
    creator: fields[2] as User?,
    post: fields[3] as String?,
    likeCount: fields[4] as String?,
  );
}
```







1.  [talawa](../../index.html)
2.  [comment_model](../../models_comment_comment_model/)
3.  [CommentAdapter](../../models_comment_comment_model/CommentAdapter-class.html)
4.  read method

##### CommentAdapter class







