




getPostsComments method - CommentQueries class - comment\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/comment\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_comment_queries/)
3. [CommentQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_comment_queries/CommentQueries-class.html)
4. getPostsComments method

getPostsComments


dark\_mode

light\_mode




# getPostsComments method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
getPostsComments(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) postId

)

Get all comments for a post.

**params**:

* `postId`: The id of the post to get comments for.

**returns**:

* `String`: The query for getting all comments for a post.

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [comment\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_comment_queries/)
3. [CommentQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_comment_queries/CommentQueries-class.html)
4. getPostsComments method

##### CommentQueries class





talawa
1.0.0+1






