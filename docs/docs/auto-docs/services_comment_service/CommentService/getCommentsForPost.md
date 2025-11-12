



menu

1.  [talawa](../../index.md)
2.  [services/comment_service.dart](../../services_comment_service/)
3.  [CommentService](../../services_comment_service/CommentService-class.md)
4.  getCommentsForPost method


getCommentsForPost


 dark_mode   light_mode 




<div>

# getCommentsForPost method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
dynamic\>]]\>]]




This function is used to get comments on the post.

**params**:

-   `postId`: The post id for which comments are to be fetched.
-   `first`: The number of comments to fetch (default is 10).
-   `after`: The cursor for pagination to fetch comments after a
    specific point.
-   `last`: The number of comments to fetch from the end (optional).
-   `before`: The cursor for pagination to fetch comments before a
    specific point (optional).

**returns**:

-   `Future<Map<String, dynamic>>`: A map containing the list of
    comments and pagination information.



## Implementation

``` language-dart
Future<Map<String, dynamic>>  async 
```







1.  [talawa](../../index.md)
2.  [comment_service](../../services_comment_service/)
3.  [CommentService](../../services_comment_service/CommentService-class.md)
4.  getCommentsForPost method

##### CommentService class









 talawa 1.0.0+1 
