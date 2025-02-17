
<div>

# removeLike method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
removeLike(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    postID]

)



Method to remove like in a Post.

This method basically update likedBy list of a Post and removes the like
of a user in database.

**params**:

-   `postID`: ID of the post to remove like in database.

**returns**:

-   `Future<void>`: nothing



## Implementation

``` language-dart
Future<bool> removeLike(String postID) async {
  bool isLiked = false;
  await actionHandlerService.performAction(
    actionType: ActionType.optimistic,
    action: () async {
      final String mutation = .;
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







1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  removeLike method

##### PostService class







