import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
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
  late User _currentUser;
  late OrgInfo _selectedOrg;
  final TextEditingController _controller = TextEditingController();

  // Getters

  /// This function is used to get the image file provided by the user.
  ///
  /// params:
  /// None
  ///
  /// returns:
  /// * `File?`:image selected by user.
  File? get imageFile => _imageFile;

  /// This fucntion is used to get the name of the user.
  ///
  /// params:
  /// None
  ///
  /// returns:
  /// * `String`:Name of the user.
  String get userName => _currentUser.firstName! + _currentUser.lastName!;

  /// This fucntion is used to get the name of the organization.
  ///
  /// params:
  /// None
  ///
  /// returns:
  /// * `String`:Name of the organization.
  String get orgName => _selectedOrg.name!;

  /// This function is used to get the text typed be the used in the post.
  ///
  /// params:
  /// None
  ///
  /// returns:
  /// * `TextEditingController`: Text entererd by the user in the post.
  TextEditingController get controller => _controller;

  /// initialisation.
  ///
  /// params:
  /// None
  void initialise() {
    _currentUser = locator<UserConfig>().currentUser;
    _navigationService = locator<NavigationService>();
    _selectedOrg = locator<UserConfig>().currentOrg;
    _imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
  }

  /// This function is used to get the image from gallery.
  ///
  /// The function uses the `_multiMediaPickerService` services.
  ///
  /// params:
  /// * `camera`: if true then open camera for image, else open gallery to select image.
  ///
  /// returns:
  /// * `Future<void>`: image selected by user.
  Future<void> getImageFromGallery({bool camera = false}) async {
    final image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (image != null) {
      _imageFile = image;
      _navigationService.showTalawaErrorSnackBar(
        "Image is added",
        MessageType.info,
      );
      notifyListeners();
    }
  }

  /// This function uploads thoe post finally, and navigate the success message in Snack Bar.
  ///
  /// params:
  /// None
  void uploadPost() {
    removeImage();
    _controller.text = "";
    _navigationService.showTalawaErrorSnackBar(
      "Post is uploaded",
      MessageType.info,
    );
  }

  /// This function removes the image selected.
  ///
  /// params:
  /// None
  void removeImage() {
    _imageFile = null;
    notifyListeners();
  }
}
