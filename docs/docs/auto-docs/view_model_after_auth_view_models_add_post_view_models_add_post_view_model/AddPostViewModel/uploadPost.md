




uploadPost method - AddPostViewModel class - add\_post\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/add\_post\_view\_models/add\_post\_view\_model.dart](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/view_model_after_auth_view_models_add_post_view_models_add_post_view_model-library.html)
3. [AddPostViewModel](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4. uploadPost method

uploadPost


dark\_mode

light\_mode




# uploadPost method


Future<void>
uploadPost()

This function uploads the post finally, and navigate the success message or error message in Snack Bar.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> uploadPost() async {
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.postCreationFailed,
    action: () async {
      final variables = {
        "text": "${_controller.text} #${_textHashTagController.text}",
        "organizationId": _selectedOrg.id,
        "title": _titleController.text,
        if (_imageFile != null)
          "file": 'data:image/png;base64,${_imageInBase64!}',
      };
      navigationService.pushDialog(
        const CustomProgressDialog(
          key: Key('addPostProgress'),
        ),
      );
      final result = await _dbFunctions.gqlAuthMutation(
        PostQueries().uploadPost(),
        variables: variables,
      );
      return result;
    },
    onValidResult: (result) async {
      final Post newPost = Post.fromJson(
        result.data!['createPost'] as Map<String, dynamic>,
      );
      locator<PostService>().addNewpost(newPost);
      navigationService.pop();
    },
    apiCallSuccessUpdateUI: () {
      _navigationService.showTalawaErrorSnackBar(
        "Post is uploaded",
        MessageType.info,
      );
    },
    onActionException: (e) async {
      print(e);
      _navigationService.showTalawaErrorSnackBar(
        "Upload failed: $e",
        MessageType.error,
      );
    },
    onActionFinally: () async {
      removeImage();
      _controller.text = "";
      _titleController.text = "";
      notifyListeners();
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [add\_post\_view\_model](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/view_model_after_auth_view_models_add_post_view_models_add_post_view_model-library.html)
3. [AddPostViewModel](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4. uploadPost method

##### AddPostViewModel class





talawa
1.0.0+1






