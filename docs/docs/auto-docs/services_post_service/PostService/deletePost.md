



menu

1.  [talawa](../../index.md)
2.  [services/post_service.dart](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.md)
4.  deletePost method


deletePost


 dark_mode   light_mode 




<div>

# deletePost method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
deletePost(

1.  [[[Post](../../models_post_post_model/Post-class.md)]
    post]

)



Method to delete a post from the feed.

**params**:

-   `post`: Post object to be deleted from the feed

**returns**:

-   `Future<QueryResult<Object?>>`: returns the result of the GraphQL
    mutation to delete the post.



## Implementation

``` language-dart
Future<QueryResult<Object?>> deletePost(Post post) async 
```







1.  [talawa](../../index.md)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.md)
4.  deletePost method

##### PostService class









 talawa 1.0.0+1 
