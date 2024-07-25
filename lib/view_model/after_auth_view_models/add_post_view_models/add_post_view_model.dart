import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/image_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// AddPostViewModel class have different functions.
///
/// They are used to interact with the model to add a new post in the
///  organization.
class AddPostViewModel extends BaseModel {
  AddPostViewModel({this.demoMode = false});

  // Services
  late MultiMediaPickerService _multiMediaPickerService;
  late NavigationService _navigationService;
  late ImageService _imageService;

  late File? _imageFile;
  late String? _imageInBase64;
  late OrgInfo _selectedOrg;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _textHashTagController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  /// Whether the app is running in Demo Mode.
  late bool demoMode;

  /// The image file that is to be uploaded.
  ///
  /// params:
  /// None
  /// returns:
  /// * `File?`: The image file
  File? get imageFile => _imageFile;

  /// Method to set image.
  ///
  ///
  /// **params**:
  /// * `file`: The file to set
  ///
  /// **returns**:
  ///   None
  void setImageFile(File? file) {
    _imageFile = file;
    notifyListeners();
  }

  /// Getter to access the base64 type.
  String? get imageInBase64 => _imageInBase64;

  /// Method to set Image in Bsse64.
  ///
  /// **params**:
  /// * `file`: The file to convert.
  ///
  /// **returns**:
  ///   None
  Future<void> setImageInBase64(File file) async {
    _imageInBase64 = await _imageService.convertToBase64(file);
    notifyListeners();
  }

  /// The username of the currentUser.
  String get userName =>
      userConfig.currentUser.firstName! + userConfig.currentUser.lastName!;

  /// User profile picture.
  String? get userPic => userConfig.currentUser.image;

  /// The organisation name.
  String get orgName => _selectedOrg.name!;

  /// The main text controller of the post body.
  TextEditingController get controller => _controller;

  /// The main text controller of the hashtag.
  TextEditingController get textHashTagController => _textHashTagController;

  /// The text controller of the title body.
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
    _navigationService = locator<NavigationService>();
    _imageFile = null;
    _imageInBase64 = null;
    _multiMediaPickerService = locator<MultiMediaPickerService>();
    _imageService = locator<ImageService>();
    if (!demoMode) {
      _dbFunctions = locator<DataBaseMutationFunctions>();
      _selectedOrg = locator<UserConfig>().currentOrg;
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
  ///   None
  Future<void> getImageFromGallery({bool camera = false}) async {
    final image =
        await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
    // convertImageToBase64(image!.path);
    if (image != null) {
      _imageFile = image;
      // convertImageToBase64(image.path);
      _imageInBase64 = await _imageService.convertToBase64(image);
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
  ///   None
  Future<void> uploadPost() async {
    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      criticalActionFailureMessage: TalawaErrors.postCreationFailed,
      action: () async {
        final variables = {
          "text": "${_controller.text} #${_textHashTagController.text}",
          "organizationId": _selectedOrg.id,
          "title": _titleController.text,
          if (_imageFile != null)
            "file": 'data:image/png;base64,${_imageInBase64!}',
        };

        final result = await _dbFunctions.gqlAuthMutation(
          PostQueries().uploadPost(),
          variables: variables,
        );

        return result;
      },
      onValidResult: (result) async {
        final Post newPost = Post.fromJson(
          result.data!['createPost'] as Map<String, dynamic>,
        );
        locator<PostService>().addNewpost(newPost);
      },
      apiCallSuccessUpdateUI: () {
        _navigationService.showTalawaErrorSnackBar(
          "Post is uploaded",
          MessageType.info,
        );
      },
      onActionException: (e) async {
        print(e);
        _navigationService.showTalawaErrorSnackBar(
          "Something went wrong",
          MessageType.error,
        );
      },
      onActionFinally: () async {
        removeImage();
        _controller.text = "";
        _titleController.text = "";
        notifyListeners();
      },
    );
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
