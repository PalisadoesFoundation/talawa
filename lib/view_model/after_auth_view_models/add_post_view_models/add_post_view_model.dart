import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// AddPostViewModel class have different functions that are used.
///
/// to interact with the model to add a new post in the organization.
class AddPostViewModel extends BaseModel {
  //Services
  late MultiMediaPickerService _multiMediaPickerService;
  late NavigationService _navigationService;

  // ignore: unused_field
  late File? _imageFile;
  late String? _imageInBase64;
  late User _currentUser;
  late OrgInfo _selectedOrg;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _textHashTagController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  /// The image file that is to be uploaded.
  ///
  /// params:
  /// None
  /// returns:
  /// * `File?`: The image file
  File? get imageFile => _imageFile;

  /// Getter to access the base64 type.
  String? get imageInBase64 => _imageInBase64;

  /// The Username.
  ///
  /// params:
  /// None
  /// returns:
  /// * `String`: The username of the currentUser
  String get userName => _currentUser.firstName! + _currentUser.lastName!;

  /// The organisation name.
  ///
  /// params:
  /// None
  /// returns:
  /// * `String`: The organisation name
  String get orgName => _selectedOrg.name!;

  /// Post body text controller.
  ///
  /// params:
  /// None
  /// returns:
  /// * `TextEditingController`: The main text controller of the post body
  TextEditingController get controller => _controller;

  /// hashtag text controller.
  ///
  /// params:
  /// None
  /// returns:
  /// * `TextEditingController`: The main text controller of the hashtag
  TextEditingController get textHashTagController => _textHashTagController;

  /// Post title text controller.
  ///
  /// params:
  /// None
  /// returns:
  /// * `TextEditingController`: The text controller of the title body
  TextEditingController get titleController => _titleController;
  late DataBaseMutationFunctions _dbFunctions;

  /// This function is usedto do initialisation of stuff in the view model.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialise() {
    _currentUser = locator<UserConfig>().currentUser;
    _navigationService = locator<NavigationService>();
    _selectedOrg = locator<UserConfig>().currentOrg;
    _imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
    _dbFunctions = locator<DataBaseMutationFunctions>();
  }

  /// to convert the image in base64.
  ///
  ///
  /// **params**:
  /// * `file`: file of image clicked.
  ///
  /// **returns**:
  /// * `Future<String>`: Future string containing the base 64 format image
  Future<String> convertToBase64(File file) async {
    try {
      final List<int> bytes = await file.readAsBytes();
      String base64String = base64Encode(bytes);
      base64String = base64String;
      print(base64String);
      _imageInBase64 = base64String;
      return base64String;
    } catch (error) {
      return '';
    }
  }

  /// This function is used to get the image from gallery.
  ///
  /// The function uses the `_multiMediaPickerService` services.
  ///
  /// **params**:
  /// * `camera`: if true then open camera for image, else open gallery to select image.
  ///
  /// **returns**:
  /// * `Future<void>`: Getting image from gallery returns future
  Future<void> getImageFromGallery({bool camera = false}) async {
    final image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    // convertImageToBase64(image!.path);
    if (image != null) {
      _imageFile = image;
      // convertImageToBase64(image.path);
      convertToBase64(image);
      // print(_imageInBase64);
      _navigationService.showTalawaErrorSnackBar(
        "Image is added",
        MessageType.info,
      );
      notifyListeners();
    }
  }

  /// This function uploads the post finally, and navigate the success message or error message in Snack Bar.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: Uploading post by contacting queries
  Future<void> uploadPost() async {
    // {TODO: Image not getting uploaded}
    if (_imageFile == null) {
      try {
        await _dbFunctions.gqlAuthMutation(
          PostQueries().uploadPost(),
          variables: {
            "text": "${_controller.text} #${_textHashTagController.text}",
            "organizationId": _selectedOrg.id,
            "title": _titleController.text,
          },
        );
        _navigationService.showTalawaErrorSnackBar(
          "Post is uploaded",
          MessageType.info,
        );
      } on Exception catch (e) {
        print(e);
        _navigationService.showTalawaErrorSnackBar(
          "Something went wrong",
          MessageType.error,
        );
      }
    } else {
      try {
        await _dbFunctions.gqlAuthMutation(
          PostQueries().uploadPost(),
          variables: {
            "text": _controller.text,
            "organizationId": _selectedOrg.id,
            "title": _titleController.text,
            "file": 'data:image/png;base64,${_imageInBase64!}',
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

  /// This function removes the image selected.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void removeImage() {
    _imageFile = null;
    notifyListeners();
  }
}
