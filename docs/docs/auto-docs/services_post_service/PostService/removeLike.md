




removeLike method - PostService class - post\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/post\_service.dart](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. removeLike method

removeLike


dark\_mode

light\_mode




# removeLike method


Future<bool>
removeLike(

1. String postID

)

Method to remove like in a Post.

This method basically update likedBy list of a Post
and removes the like of a user in database.

**params**:

* `postID`: ID of the post to remove like in database.

**returns**:

* `Future<void>`: nothing

## Implementation

```
Future<bool> removeLike(String postID) async {
  bool isLiked = false;
  await actionHandlerService.performAction(
    actionType: ActionType.optimistic,
    action: () async {
      final String mutation = PostQueries().removeLike();
      return await _dbFunctions
          .gqlAuthMutation(mutation, variables: {"postID": postID});
    },
    onValidResult: (result) async {
      isLiked = (result.data?["_id"] != null);
    },
    updateUI: () {
      _removeLocal(postID);
    },
  );
  return isLiked;
}
```

 


1. [talawa](../../index.html)
2. [post\_service](../../services_post_service/services_post_service-library.html)
3. [PostService](../../services_post_service/PostService-class.html)
4. removeLike method

##### PostService class





talawa
1.0.0+1






