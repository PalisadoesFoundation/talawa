
<div>

# addLike method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
addLike(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    postID]

)



Method to add like on a Post.

This method basically update likedBy list of a Post in database.

**params**:

-   `postID`: ID of the post to add like in database

**returns**:

-   `Future<void>`: define_the_return



## Implementation

``` language-dart
Future<bool> addLike(String postID) async {
  bool isLiked = false;
  await actionHandlerService.performAction(
    actionType: ActionType.optimistic,
    action: () async {
      final String mutation = .;
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







1.  [talawa](../../index.md)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.md)
4.  addLike method

##### PostService class







