


# Post constructor







Post({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) sId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? description, [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)? createdAt, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? imageUrl, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? videoUrl, required [User](../../models_user_user_info/User-class.md)? creator, [OrgInfo](../../models_organization_org_info/OrgInfo-class.md)? organization, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[LikedBy](../../models_post_post_model/LikedBy-class.md)>? likedBy, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Comments](../../models_post_post_model/Comments-class.md)>? comments})





## Implementation

```dart
Post({
  required this.sId,
  this.description,
  this.createdAt,
  this.imageUrl,
  this.videoUrl,
  required this.creator,
  this.organization,
  this.likedBy,
  this.comments,
});
```







