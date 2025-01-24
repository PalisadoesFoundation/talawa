




removePost method - OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/view_model_after_auth_view_models_feed_view_models_organization_feed_view_model-library.html)
3. [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. removePost method

removePost


dark\_mode

light\_mode




# removePost method


Future<void>
removePost(

1. [Post](../../models_post_post_model/Post-class.html) post

)

function to remove the post.

**params**:

* `post`: post object

**returns**:
None


## Implementation

```
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
      navigationService.pop();
      navigationService.showTalawaErrorSnackBar(
        'Post was deleted if you had the rights!',
        MessageType.info,
      );
      notifyListeners();
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
      navigationService.pop();
      navigationService.showTalawaErrorSnackBar(
        'Post was deleted if you had the rights!',
        MessageType.info,
      );
      notifyListeners();
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [organization\_feed\_view\_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/view_model_after_auth_view_models_feed_view_models_organization_feed_view_model-library.html)
3. [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. removePost method

##### OrganizationFeedViewModel class





talawa
1.0.0+1






