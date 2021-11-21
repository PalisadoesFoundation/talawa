import 'dart:io';
import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class EditProfilePageViewModel extends BaseModel {
  final user = userConfig.currentUser;
  late MultiMediaPickerService _multiMediaPickerService;
  late File? _imageFile;
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  final databaseService = databaseFunctions;
  File? get imageFile => _imageFile;

  initialize() {
    _imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
  }

  Future<void> getImageFromGallery({bool camera = false}) async {
    final _image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (_image != null) {
      _imageFile = _image;
      notifyListeners();
    }
  }

  void removeImage() {
    _imageFile = null;
    notifyListeners();
  }
}
