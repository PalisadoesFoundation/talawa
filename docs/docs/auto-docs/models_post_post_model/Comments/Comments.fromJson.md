
<div>

# Comments.fromJson constructor

</div>


Comments.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



Convert json to dart object.

params: None returns:

-   `Map<String, dynamic>`: Dart object is returned.



## Implementation

``` language-dart
Comments.fromJson(Map<String, dynamic> json) {
  sId = json['_id'] as String?;
}
```







1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [Comments](../../models_post_post_model/Comments-class.html)
4.  Comments.fromJson constructor

##### Comments class







