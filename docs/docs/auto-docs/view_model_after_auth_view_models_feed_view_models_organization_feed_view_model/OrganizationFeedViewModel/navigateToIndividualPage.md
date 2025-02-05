


# navigateToIndividualPage method








void navigateToIndividualPage
([Post](../../models_post_post_model/Post-class.md) post)





<p>This function navigate to individual post page.</p>



## Implementation

```dart
void navigateToIndividualPage(Post post) {
  // uses `pushScreen` method by `navigationService` service.
  _navigationService.pushScreen(Routes.individualPost, arguments: post);
}
```







