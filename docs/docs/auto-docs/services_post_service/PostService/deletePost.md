




deletePost method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. deletePost method

deletePost


dark\_mode

light\_mode




# deletePost method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
deletePost(

1. [Post](../../models_post_post_model/Post-class.html) post

)

## Implementation

```
Future<QueryResult<Object?>> deletePost(Post post) async {
  return await _dbFunctions.gqlAuthMutation(
    PostQueries().removePost(),
    variables: {
      "id": post.sId,
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. deletePost method

##### PostService class





talawa
1.0.0+1






