


# initialise method








void initialise
({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isTest = false})








## Implementation

```dart
void initialise(
    // bool forTest,
    {
  bool isTest = false,
}) {
  // For caching/initializing the current organization after the stream subscription has canceled and the stream is updated

  _currentOrgName = _userConfig.currentOrg.name!;
  // ------
  // Attaching the stream subscription to rebuild the widgets automatically
  _currentOrganizationStreamSubscription =
      _userConfig.currentOrgInfoStream.listen(
    (updatedOrganization) =>
        setCurrentOrganizationName(updatedOrganization.name!),
  );
  _postsSubscription = _postService.postStream.listen((newPosts) {
    return buildNewPosts(newPosts);
  });

  _updatePostSubscription =
      _postService.updatedPostStream.listen((post) => updatedPost(post));
  if (isTest) {
    istest = true;
  }
}
```







