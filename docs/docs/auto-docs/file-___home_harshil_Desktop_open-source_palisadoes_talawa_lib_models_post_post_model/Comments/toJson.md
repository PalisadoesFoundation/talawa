




toJson method - Comments class - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. [Comments](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Comments-class.html)
4. toJson method

toJson


dark\_mode

light\_mode




# toJson method


[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>
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
2. [post\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/)
3. [Comments](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_post_post_model/Comments-class.html)
4. toJson method

##### Comments class





talawa
1.0.0+1






