



menu

1.  [talawa](../../index.md)
2.  [services/comment_service.dart](../../services_comment_service/)
3.  [CommentService](../../services_comment_service/CommentService-class.md)
4.  createComments method


createComments


 dark_mode   light_mode 




<div>

# createComments method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
createComments(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    postId, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    body]

)



This function is used to add comment on the post.

To verify things are working, check out the native platform logs.
**params**:

-   `postId`: The post id on which comment is to be added.
-   `body`: The comment text.

**returns**: None



## Implementation

``` language-dart
Future<void> createComments(String postId, String body) async 
```







1.  [talawa](../../index.md)
2.  [comment_service](../../services_comment_service/)
3.  [CommentService](../../services_comment_service/CommentService-class.md)
4.  createComments method

##### CommentService class









 talawa 1.0.0+1 
