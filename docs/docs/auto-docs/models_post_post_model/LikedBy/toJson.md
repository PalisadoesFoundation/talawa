




toJson method - LikedBy class - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../models_post_post_model/models_post_post_model-library.html)
3. [LikedBy](../../models_post_post_model/LikedBy-class.html)
4. toJson method

toJson


dark\_mode

light\_mode




# toJson method


Map<String, dynamic>
toJson()

Convert dart object to json.

**params**:
None

**returns**:

* `Map<String, dynamic>`: json is returned.

## Implementation

```
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_id'] = this.sId;
  return data;
}
```

 


1. [talawa](../../index.html)
2. [post\_model](../../models_post_post_model/models_post_post_model-library.html)
3. [LikedBy](../../models_post_post_model/LikedBy-class.html)
4. toJson method

##### LikedBy class





talawa
1.0.0+1






