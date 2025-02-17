
<div>

# Post.fromJson constructor

</div>


Post.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



Creating a new Post instance from a map structure.

params: None returns:

-   `PostObject`: Dart Object for posts



## Implementation

``` language-dart
///
/// params:
/// None
/// returns:
/// * `PostObject`: Dart Object for posts
Post.fromJson(Map<String, dynamic> json) {
  sId = json['_id'] as String;
  description = json['text'] as String?;
  createdAt = DateTime.parse(json['createdAt'] as String);
  imageUrl = json['imageUrl'] as String?;
  base64String = json['base64String'] as String?;
  videoUrl = json['videoUrl'] as String?;
  creator = json['creator'] != null
      ? User.fromJson(json['creator'] as Map<String, dynamic>, fromOrg: true)
      : null;
  organization = json['organization'] != null
      ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
      : null;
  if (json['likedBy'] != null) {
    likedBy = <LikedBy>[];
    (json['likedBy'] as List).forEach((v) {
      likedBy?.add(LikedBy.fromJson(v as Map<String, dynamic>));
    });
  }
  if (json['comments'] != null) {
    comments = <Comments>[];
    (json['comments'] as List).forEach((v) {
      comments?.add(Comments.fromJson(v as Map<String, dynamic>));
    });
  }
}
```







1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [Post](../../models_post_post_model/Post-class.html)
4.  Post.fromJson constructor

##### Post class







