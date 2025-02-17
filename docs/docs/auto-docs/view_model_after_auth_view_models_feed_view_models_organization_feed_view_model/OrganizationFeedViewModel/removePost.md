
<div>

# removePost method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
removePost(

1.  [[[Post](../../models_post_post_model/Post-class.md)]
    post]

)



function to remove the post.

**params**:

-   `post`: post object

**returns**: None



## Implementation

``` language-dart
Future<void> removePost(Post post) async {
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.postDeletionFailed,
    action: () async {
      final result = await _postService.deletePost(post);
      return result;
    },
    onValidResult: (result) async {
      _posts.remove(post);
    },
    apiCallSuccessUpdateUI: () {
      navigationService.;
      navigationService.showTalawaErrorSnackBar(
        'Post was deleted if you had the rights!',
        MessageType.info,
      );
      ;
    },
  );
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.postDeletionFailed,
    action: () async {
      final result = await _postService.deletePost(post);
      return result;
    },
    onValidResult: (result) async {
      _posts.remove(post);
    },
    apiCallSuccessUpdateUI: () {
      navigationService.;
      navigationService.showTalawaErrorSnackBar(
        'Post was deleted if you had the rights!',
        MessageType.info,
      );
      ;
    },
  );
}
```







1.  [talawa](../../index.md)
2.  [organization_feed_view_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.md)
4.  removePost method

##### OrganizationFeedViewModel class







