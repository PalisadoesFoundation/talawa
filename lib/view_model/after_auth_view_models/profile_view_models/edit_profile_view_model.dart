import 'dart:io';
import 'package:flutter/material.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_profile_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// EditProfilePageViewModel class helps to interact with model to serve data to edit profile views.
///
/// Methods include:
/// * `getImageFromGallery`
class EditProfilePageViewModel extends BaseModel {
  /// current user.
  final user = userConfig.currentUser;
  late MultiMediaPickerService _multiMediaPickerService;

  /// profile image.
  File? imageFile;

  /// first name controller.
  late TextEditingController nameTextController;

  /// email controller.
  late TextEditingController emailTextController;

  /// Focus node tpo control focus.
  FocusNode nameFocus = FocusNode();

  /// Focus node to control focus.
  FocusNode emailFocus = FocusNode();

  /// Graphql client.
  final databaseService = databaseFunctions;

  /// GetIt of user profile service.
  final userProfileService = locator<UserProfileService>();

  /// initialization function.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialize() {
    imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
    emailTextController = TextEditingController(text: user.email);
    nameTextController = TextEditingController(text: user.name);
  }

  /// This function is used to get the image from gallery.
  ///
  /// The function uses the `_multiMediaPickerService` services.
  ///
  /// **params**:
  /// * `camera`: if true then open camera for image, else open gallery to select image.
  ///
  /// **returns**:
  ///   None
  Future<void> selectImage({bool camera = false}) async {
    final image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (image != null) {
      imageFile = image;
      notifyListeners();
    }
  }

  /// Method to update user profile.
  ///
  /// **params**:
  /// * `name`: updated name.
  /// * `email`: updated email.
  /// * `newImage`: New profile picture that is to be updated.
  ///
  /// **returns**:
  ///   None
  Future<void> updateUserProfile({
    String? name,
    String? email,
    File? newImage,
  }) async {
    if (name == user.name && email == user.email && newImage == null) {
      return;
    }
    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      criticalActionFailureMessage: TalawaErrors.userProfileUpdateFailed,
      action: () async {
        final Map<String, dynamic> variables = {};
        if (name != null && name != user.name) {
          variables["name"] = name;
        }
        if (email != null && email != user.email) {
          variables["emailAddress"] = email;
        }
        if (newImage != null) {
          variables["avatar"] = newImage;
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
        // ActionHandlerService.executeApiCall() already validates result.data is not null
        final user = result.data!['user'] as Map<String, dynamic>;

        final User userInfo = User.fromJson(
          user,
        );
        userInfo.authToken = userConfig.currentUser.authToken;
        userInfo.refreshToken = userConfig.currentUser.refreshToken;

        await userConfig.updateUser(userInfo);
      },
      apiCallSuccessUpdateUI: () {
        notifyListeners();
        navigationService.showTalawaErrorSnackBar(
          "Profile updated successfully",
          MessageType.info,
        );
      },
      onActionException: (_) async {
        navigationService.showTalawaErrorSnackBar(
          "Something went wrong",
          MessageType.error,
        );
      },
    );
  }

  /// This function remove the selected image.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void removeImage() {
    imageFile = null;
    notifyListeners();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    super.dispose();
  }
}
