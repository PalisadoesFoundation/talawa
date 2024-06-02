


# navigateToPinnedPostPage method








void navigateToPinnedPostPage
()





<p>This function navigate to pinned post page.</p>



## Implementation

```dart
void navigateToPinnedPostPage() {
  // uses `pushScreen` method by `navigationService` service.
  _navigationService.pushScreen(
    Routes.pinnedPostPage,
    arguments: _pinnedPosts,
  );
}
```







