import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
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
  late File? imageFile;

  /// profile image in base64.
  String? base64Image;

  /// first name controller.
  TextEditingController firstNameTextController = TextEditingController();

  /// last name controller.
  TextEditingController lastNameTextController = TextEditingController();

  /// Focus node tpo control focus.
  FocusNode firstNameFocus = FocusNode();

  /// Focus node tpo control focus.
  FocusNode lastNameFocus = FocusNode();

  /// Graphql client.
  final databaseService = databaseFunctions;

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
  }

  /// This function is used to get the image from gallery.
  ///
  /// The function uses the `_multiMediaPickerService` services.
  ///
  /// **params**:
  /// * `camera`: if true then open camera for image, else open gallery to select image.
  ///
  /// **returns**:
  /// * `Future<void>`: None
  Future<void> getImage({bool camera = false}) async {
    final image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (image != null) {
      imageFile = image;
      notifyListeners();
    }
  }

  /// Method to select image from gallery or camera.
  ///
  /// **params**:
  /// * `camera`: for true it will select from camera otherwise gallery
  ///
  /// **returns**:
  /// * `Future<void>`: none
  Future<void> selectImage({bool camera = false}) async {
    if (camera) {
      getImage(camera: true);
    } else {
      getImage();
    }
  }

  /// This function is used to convert the image into Base64 format.
  ///
  /// **params**:
  /// * `file`:  Takes the image in format of file.
  ///
  /// **returns**:
  /// * `Future<String>`: image in string format
  Future<String> convertToBase64(File file) async {
    try {
      final List<int> bytes = await file.readAsBytes();
      base64Image = base64Encode(bytes);
      return base64Image!;
    } catch (error) {
      return '';
    }
  }

  /// Method to update user profile.
  ///
  /// **params**:
  /// * `firstName`: updated first name.
  /// * `lastName`: updated last name.
  /// * `newImage`: New profile picture that is to be updated.
  ///
  /// **returns**:
  /// * `Future<void>`: none
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
    try {
      final Map<String, dynamic> variables = {};
      if (firstName != null) {
        variables["firstName"] = firstName;
      }
      if (lastName != null) {
        variables["lastName"] = lastName;
      }
      if (newImage != null) {
        final String imageAsString = await convertToBase64(newImage);
        variables["file"] = 'data:image/png;base64,$imageAsString';
      }
      if (variables.isNotEmpty) {
        await databaseService.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: variables,
        );
        // Fetch updated user info from the database and save it in hivebox.
        final QueryResult result1 = await databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo,
          variables: {'id': user.id},
        ) as QueryResult;
        final User userInfo = User.fromJson(
          ((result1.data!['users'] as List<dynamic>)[0])
              as Map<String, dynamic>,
          fromOrg: true,
        );
        userInfo.authToken = userConfig.currentUser.authToken;
        userInfo.refreshToken = userConfig.currentUser.refreshToken;
        userConfig.updateUser(userInfo);
        notifyListeners();

        user.firstName = firstName ?? user.firstName;
        user.lastName = lastName ?? user.lastName;
        firstNameTextController.text = user.firstName!;
        lastNameTextController.text = user.lastName!;

        navigationService.showTalawaErrorSnackBar(
          "Profile updated successfully",
          MessageType.info,
        );
        notifyListeners();
      }
    } on Exception catch (_) {
      navigationService.showTalawaErrorSnackBar(
        "Something went wrong",
        MessageType.error,
      );
    }
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
}
