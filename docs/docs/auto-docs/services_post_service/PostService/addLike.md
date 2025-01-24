




addLike method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. addLike method

addLike


dark\_mode

light\_mode




# addLike method


Future<bool>
addLike(

1. String postID

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
2. [post\_service](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. addLike method

##### PostService class





talawa
1.0.0+1






