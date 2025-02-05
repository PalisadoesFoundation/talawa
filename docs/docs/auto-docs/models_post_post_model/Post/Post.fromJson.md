


# Post.fromJson constructor







Post.fromJson([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json)


<p>Creating a new Post instance from a map structure.</p>
<p>params:
None
returns:</p>
<ul>
<li><code>PostObject</code>: Dart Object for posts</li>
</ul>



## Implementation

```dart
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
  videoUrl = json['videoUrl'] as String?;
  creator = json['creator'] != null
      ? User.fromJson(json['creator'] as Map<String, dynamic>, fromOrg: true)
      : null;
  organization = json['organization'] != null
      ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
      : null;
  if (json['likedBy'] != null) {
    likedBy = <LikedBy>[];
    json['likedBy'].forEach((v) {
      likedBy?.add(LikedBy.fromJson(v as Map<String, dynamic>));
    });
  }
  if (json['comments'] != null) {
    comments = <Comments>[];
    json['comments'].forEach((v) {
      comments?.add(Comments.fromJson(v as Map<String, dynamic>));
    });
  }
}
```







