


# Comment.fromJson constructor







Comment.fromJson([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json)





## Implementation

```dart
factory Comment.fromJson(Map<String, dynamic> json) {
  return Comment(
    text: json['text'] as String?,
    createdAt: json['createdAt'] as String?,
    creator: json['creator'] == null
        ? null
        //Creating a new User instance from a map structure.
        : User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          ),
    post: json['post'] as String?,
    likeCount: json['likeCount'] as String?,
  );
}
```







