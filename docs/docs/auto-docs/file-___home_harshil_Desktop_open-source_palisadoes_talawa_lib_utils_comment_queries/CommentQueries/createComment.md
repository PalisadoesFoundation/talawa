




createComment method - CommentQueries class - comment\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/comment\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_comment_queries/)
3. [CommentQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_comment_queries/CommentQueries-class.html)
4. createComment method

createComment


dark\_mode

light\_mode




# createComment method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
createComment()

Creating a comment.

**params**:
None

**returns**:

* `String`: The query for creating a comment

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [comment\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_comment_queries/)
3. [CommentQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_comment_queries/CommentQueries-class.html)
4. createComment method

##### CommentQueries class





talawa
1.0.0+1






