




updateUserProfile method - EditProfilePageViewModel class - edit\_profile\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/edit\_profile\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3. [EditProfilePageViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
4. updateUserProfile method

updateUserProfile


dark\_mode

light\_mode




# updateUserProfile method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
updateUserProfile({

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? firstName,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? lastName,
3. [File](https://api.flutter.dev/flutter/dart-io/File-class.html)? newImage,

})

Method to update user profile.

**params**:

* `firstName`: updated first name.
* `lastName`: updated last name.
* `newImage`: New profile picture that is to be updated.

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [edit\_profile\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3. [EditProfilePageViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
4. updateUserProfile method

##### EditProfilePageViewModel class





talawa
1.0.0+1






