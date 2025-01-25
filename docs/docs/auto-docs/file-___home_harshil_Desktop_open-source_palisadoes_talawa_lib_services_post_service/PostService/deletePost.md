




deletePost method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. deletePost method

deletePost


dark\_mode

light\_mode




# deletePost method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
deletePost(

1. dynamic post

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
2. [post\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. deletePost method

##### PostService class





talawa
1.0.0+1






