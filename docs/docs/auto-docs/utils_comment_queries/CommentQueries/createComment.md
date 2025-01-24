




createComment method - CommentQueries class - comment\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/comment\_queries.dart](../../utils_comment_queries/utils_comment_queries-library.html)
3. [CommentQueries](../../utils_comment_queries/CommentQueries-class.html)
4. createComment method

createComment


dark\_mode

light\_mode




# createComment method


String
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
2. [comment\_queries](../../utils_comment_queries/utils_comment_queries-library.html)
3. [CommentQueries](../../utils_comment_queries/CommentQueries-class.html)
4. createComment method

##### CommentQueries class





talawa
1.0.0+1






