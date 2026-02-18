
<div>

# getCommentsForPost method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)]\>]]
getCommentsForPost(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    postId]

)



This function is used to get all comments on the post.

To verify things are working, check out the native platform logs.
**params**:

-   `postId`: The post id for which comments are to be fetched.

**returns**:

-   `Future<List<dynamic>>`: promise that will be fulfilled with list of
    comments.



## Implementation

``` language-dart
Future<List<dynamic>> getCommentsForPost(String postId) async 
```







1.  [talawa](../../index.md)
2.  [comment_service](../../services_comment_service/)
3.  [CommentService](../../services_comment_service/CommentService-class.md)
4.  getCommentsForPost method

##### CommentService class







