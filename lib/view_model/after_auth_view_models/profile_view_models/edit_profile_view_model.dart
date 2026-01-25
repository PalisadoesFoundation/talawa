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
<<<<<<< HEAD
  late File? imageFile;

  /// profile image in base64.
  String? base64Image;

  /// first name controller.
  late TextEditingController firstNameTextController;

  /// last name controller.
  late TextEditingController lastNameTextController;

  /// Focus node tpo control focus.
  FocusNode firstNameFocus = FocusNode();

  /// Focus node tpo control focus.
  FocusNode lastNameFocus = FocusNode();
=======
  File? imageFile;

  /// first name controller.
  late TextEditingController nameTextController;

  /// email controller.
  late TextEditingController emailTextController;

  /// Focus node tpo control focus.
  FocusNode nameFocus = FocusNode();

  /// Focus node to control focus.
  FocusNode emailFocus = FocusNode();
>>>>>>> upstream/develop

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
<<<<<<< HEAD
    firstNameTextController = TextEditingController(text: user.firstName);
    lastNameTextController = TextEditingController(text: user.lastName);
=======
    emailTextController = TextEditingController(text: user.email);
    nameTextController = TextEditingController(text: user.name);
>>>>>>> upstream/develop
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

<<<<<<< HEAD
  /// This function is used to convert the image into Base64 format.
  ///
  /// **params**:
  /// * `file`:  Takes the image in format of file.
  ///
  /// **returns**:
  /// * `Future<String>`: image in string format
  Future<String> convertToBase64(File file) async {
    try {
      base64Image = await imageService.convertToBase64(file);
      return base64Image!;
    } catch (error) {
      print(error);
      return '';
    }
  }

  /// Method to update user profile.
  ///
  /// **params**:
  /// * `firstName`: updated first name.
  /// * `lastName`: updated last name.
=======
  /// Method to update user profile.
  ///
  /// **params**:
  /// * `name`: updated name.
  /// * `email`: updated email.
>>>>>>> upstream/develop
  /// * `newImage`: New profile picture that is to be updated.
  ///
  /// **returns**:
  ///   None
  Future<void> updateUserProfile({
<<<<<<< HEAD
    String? firstName,
    String? lastName,
    File? newImage,
  }) async {
    if (firstName == user.firstName &&
        newImage == null &&
        lastName == user.lastName) {
=======
    String? name,
    String? email,
    File? newImage,
  }) async {
    if (name == user.name && email == user.email && newImage == null) {
>>>>>>> upstream/develop
      return;
    }
    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      criticalActionFailureMessage: TalawaErrors.userProfileUpdateFailed,
      action: () async {
        final Map<String, dynamic> variables = {};
<<<<<<< HEAD
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
=======
        if (name != null && name != user.name) {
          variables["name"] = name;
        }
        if (email != null && email != user.email) {
          variables["emailAddress"] = email;
        }
        if (newImage != null) {
          variables["avatar"] = newImage;
>>>>>>> upstream/develop
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
<<<<<<< HEAD
        final List users = result.data!['users'] as List;

        final User userInfo = User.fromJson(
          users[0] as Map<String, dynamic>,
          fromOrg: false,
=======
        final user = result.data!['user'] as Map<String, dynamic>;

        final User userInfo = User.fromJson(
          user,
>>>>>>> upstream/develop
        );
        userInfo.authToken = userConfig.currentUser.authToken;
        userInfo.refreshToken = userConfig.currentUser.refreshToken;

        await userConfig.updateUser(userInfo);
<<<<<<< HEAD
        user.firstName = firstName ?? user.firstName;
        user.lastName = lastName ?? user.lastName;
        firstNameTextController.text = user.firstName!;
        lastNameTextController.text = user.lastName!;
=======
>>>>>>> upstream/develop
      },
      apiCallSuccessUpdateUI: () {
        notifyListeners();
        navigationService.showTalawaErrorSnackBar(
          "Profile updated successfully",
          MessageType.info,
        );
<<<<<<< HEAD
        print('cccccccccccccccccccccccccccccccccccccccc');
=======
>>>>>>> upstream/develop
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
<<<<<<< HEAD
=======

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    super.dispose();
  }
>>>>>>> upstream/develop
}
