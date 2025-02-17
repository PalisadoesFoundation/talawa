
<div>

# deletePost method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
deletePost(

1.  [[[Post](../../models_post_post_model/Post-class.md)]
    post]

)



## Implementation

``` language-dart
Future<QueryResult<Object?>> deletePost(Post post) async {
  return await _dbFunctions.gqlAuthMutation(
    .,
    variables: {
      "id": post.sId,
    },
  );
}
```







1.  [talawa](../../index.md)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.md)
4.  deletePost method

##### PostService class







