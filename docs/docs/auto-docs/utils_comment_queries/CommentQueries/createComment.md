
<div>

# createComment method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Creating a comment.

**params**: None

**returns**:

-   `String`: The query for creating a comment



## Implementation

``` language-dart
String  {
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







1.  [talawa](../../index.html)
2.  [comment_queries](../../utils_comment_queries/)
3.  [CommentQueries](../../utils_comment_queries/CommentQueries-class.html)
4.  createComment method

##### CommentQueries class







