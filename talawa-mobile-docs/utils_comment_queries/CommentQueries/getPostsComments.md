


# getPostsComments method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) getPostsComments
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postId)








## Implementation

```dart
String getPostsComments(String postId) {
  return """
  query{
    commentsByPost(id: "$postId"){
      _id
      text
      createdAt
      creator{
        firstName
        lastName
      }
    }
  }
  """;
}
```







