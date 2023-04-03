// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// EditProfilePageViewModel class helps to interact with model to serve data to edit profile views.
///
/// Methods include:
/// * `getImageFromGallery`
class EditProfilePageViewModel extends BaseModel {
  final user = userConfig.currentUser;
  late MultiMediaPickerService _multiMediaPickerService;
  late File? imageFile;
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  final databaseService = databaseFunctions;

  // initialiser
  void initialize() {
    imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
  }

  /// This function is used to get the image from gallery.
  /// The function uses the `_multiMediaPickerService` services.
  ///
  /// params:
  /// * [camera] : if true then open camera for image, else open gallery to select image.
  Future<void> getImageFromGallery({bool camera = false}) async {
    final image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (image != null) {
      imageFile = image;
      notifyListeners();
    }
  }

  /// This function remove the selected image.
  void removeImage() {
    imageFile = null;
    notifyListeners();
  }
}
