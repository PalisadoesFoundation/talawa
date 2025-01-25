




read method - CommentsAdapter class - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. [CommentsAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/CommentsAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Comments](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Comments-class.html)
read(

1. dynamic reader

)

## Implementation

```
@override
Comments read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return Comments(
    sId: fields[0] as String?,
  );
}
```

 


1. [talawa](../../index.html)
2. [post\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. [CommentsAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/CommentsAdapter-class.html)
4. read method

##### CommentsAdapter class





talawa
1.0.0+1






