// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

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

/// AddPostViewModel class have different functions that are used
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
  File? get imageFile => _imageFile;
  String get userName => _currentUser.firstName! + _currentUser.lastName!;
  String get orgName => _selectedOrg.name!;
  TextEditingController get controller => _controller;
  late DataBaseMutationFunctions _dbFunctions;

  // initialisation
  void initialise() {
    _currentUser = locator<UserConfig>().currentUser;
    _navigationService = locator<NavigationService>();
    _selectedOrg = locator<UserConfig>().currentOrg;
    _imageFile = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
    _dbFunctions = locator<DataBaseMutationFunctions>();
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
      _imageFile = image;
      notifyListeners();
    }
  }

  /// This function uploads the post finally, and navigate the success message in Snack Bar.
  Future<void> uploadPost() async {
    // {TODO: }
    if (_imageFile == null) {
      final result = await _dbFunctions.gqlAuthMutation(
        PostQueries().uploadPost(),
        variables: {
          "text": _controller.text,
          "organizationId": _selectedOrg.id,
          "title": "New"
        },
      );
      print(result);
    }
    removeImage();
    _controller.text = "";
    _navigationService.showTalawaErrorSnackBar(
      "Post is uploaded",
      MessageType.info,
    );
  }

  /// This function removes the image selected.
  void removeImage() {
    _imageFile = null;
    notifyListeners();
  }
}
