
<div>

# getPostsComments method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
getPostsComments(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    postId]

)



Get all comments for a post.

**params**:

-   `postId`: The id of the post to get comments for.

**returns**:

-   `String`: The query for getting all comments for a post.



## Implementation

``` language-dart
String getPostsComments(String postId) {
  return """
   query {
      post(id: "$postId")
      {  _id,
        comments{
           _id,
          text,
           createdAt
      creator{
        firstName
        lastName
      }
        }
      }
    }
""";
}
```







1.  [talawa](../../index.html)
2.  [comment_queries](../../utils_comment_queries/)
3.  [CommentQueries](../../utils_comment_queries/CommentQueries-class.html)
4.  getPostsComments method

##### CommentQueries class







