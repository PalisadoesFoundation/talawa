




addLike method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. addLike method

addLike


dark\_mode

light\_mode




# addLike method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>
addLike(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID

)

Method to add like on a Post.

This method basically update likedBy list of a Post
in database.

**params**:

* `postID`: ID of the post to add like in database

**returns**:

* `Future<void>`: define\_the\_return

## Implementation

```
Future<bool> addLike(String postID) async {
  bool isLiked = false;
  await actionHandlerService.performAction(
    actionType: ActionType.optimistic,
    action: () async {
      final String mutation = PostQueries().addLike();
      // run the graphQl mutation.
      return await _dbFunctions
          .gqlAuthMutation(mutation, variables: {"postID": postID});
      // return result
    },
    onValidResult: (result) async {
      isLiked = (result.data?["_id"] != null);
    },
    updateUI: () {
      _localAddLike(postID);
    },
  );
  return isLiked;
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. [PostService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService-class.html)
4. addLike method

##### PostService class





talawa
1.0.0+1






