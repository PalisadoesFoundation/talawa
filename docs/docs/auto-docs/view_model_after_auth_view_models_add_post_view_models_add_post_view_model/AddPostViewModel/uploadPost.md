::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [uploadPost]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[uploadPost]{.name}()
:::

::: {.section .desc .markdown}
This function uploads the post finally, and navigate the success message
or error message in Snack Bar.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [add_post_view_model](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3.  [AddPostViewModel](../../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
4.  uploadPost method

##### AddPostViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
