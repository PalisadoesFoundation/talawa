


# uploadPost method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> uploadPost
()





<p>This function uploads the post finally, and navigate the success message or error message in Snack Bar.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: Uploading post by contacting queries</li>
</ul>



## Implementation

```dart
Future<void> uploadPost() async {
  // {TODO: }
  if (_imageFile == null) {
    try {
      await _dbFunctions.gqlAuthMutation(
        PostQueries().uploadPost(),
        variables: {
          "text": _controller.text,
          "organizationId": _selectedOrg.id,
          "title": _titleController.text
        },
      );
      _navigationService.showTalawaErrorSnackBar(
        "Post is uploaded",
        MessageType.info,
      );
    } on Exception catch (_) {
      _navigationService.showTalawaErrorSnackBar(
        "Something went wrong",
        MessageType.error,
      );
    }
  }
  removeImage();
  _controller.text = "";
  _titleController.text = "";
  notifyListeners();
}
```







