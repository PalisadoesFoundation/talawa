::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3.  [EditProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
4.  updateUserProfile method

::: self-name
updateUserProfile
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [updateUserProfile]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[updateUserProfile]{.name}({

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [firstName]{.parameter-name}, ]{#updateUserProfile-param-firstName
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [lastName]{.parameter-name}, ]{#updateUserProfile-param-lastName
    .parameter}
3.  [[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]{.type-annotation}
    [newImage]{.parameter-name}, ]{#updateUserProfile-param-newImage
    .parameter}

})
:::

::: {.section .desc .markdown}
Method to update user profile.

**params**:

-   `firstName`: updated first name.
-   `lastName`: updated last name.
-   `newImage`: New profile picture that is to be updated.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> updateUserProfile({
  String? firstName,
  String? lastName,
  File? newImage,
}) async {
  if (firstName == user.firstName &&
      newImage == null &&
      lastName == user.lastName) {
    return;
  }
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.userProfileUpdateFailed,
    action: () async {
      final Map<String, dynamic> variables = {};
      if (firstName != null) {
        variables["firstName"] = firstName;
      }
      if (lastName != null) {
        variables["lastName"] = lastName;
      }
      if (newImage != null) {
        final String imageAsString = await convertToBase64(newImage);
        print('data:image/png;base64,$imageAsString');
        variables["file"] = 'data:image/png;base64,$imageAsString';
      }
      if (variables.isNotEmpty) {
        await userProfileService.updateUserProfile(variables);
        // Fetch updated user info from the database and save it in hivebox.

        final result = await userProfileService.getUserProfileInfo(user);

        return result;
      }
      return databaseFunctions.noData;
    },
    onValidResult: (result) async {
      final List users = result.data!['users'] as List;

      final User userInfo = User.fromJson(
        users[0] as Map<String, dynamic>,
        fromOrg: false,
      );
      userInfo.authToken = userConfig.currentUser.authToken;
      userInfo.refreshToken = userConfig.currentUser.refreshToken;

      await userConfig.updateUser(userInfo);
      user.firstName = firstName ?? user.firstName;
      user.lastName = lastName ?? user.lastName;
      firstNameTextController.text = user.firstName!;
      lastNameTextController.text = user.lastName!;
    },
    apiCallSuccessUpdateUI: () {
      notifyListeners();
      navigationService.showTalawaErrorSnackBar(
        "Profile updated successfully",
        MessageType.info,
      );
      print('cccccccccccccccccccccccccccccccccccccccc');
    },
    onActionException: (_) async {
      navigationService.showTalawaErrorSnackBar(
        "Something went wrong",
        MessageType.error,
      );
    },
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [edit_profile_view_model](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3.  [EditProfilePageViewModel](../../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
4.  updateUserProfile method

##### EditProfilePageViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
