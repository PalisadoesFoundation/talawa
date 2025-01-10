


# createComment method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) createComment
()








## Implementation

```dart
String createComment() {
  return """
   mutation createComment(\$postId: ID!, \$text: String!) {
    createComment(postId: \$postId,
      data:{
        text: \$text,
      }
    ){
      _id
    }
  }
""";
}
```







