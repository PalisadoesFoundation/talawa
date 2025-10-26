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
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// AddPostViewModel class have different functions.
///
/// They are used to interact with the model to add a new post in the
///  organization.
class AddPostViewModel extends BaseModel {
  AddPostViewModel();

  /// Maximum number of images allowed per post..
  static const int maxImages = 5;

  // Services
  late MultiMediaPickerService _multiMediaPickerService;
  late NavigationService _navigationService;
  late ImageService _imageService;

  /// List of image files to be uploaded.
  List<File> _imageFiles = [];

  /// The organization ID for which to fetch the presigned URL.
  late OrgInfo _selectedOrg;

  /// Controller for caption text field.
  final TextEditingController captionController = TextEditingController();

  /// The username of the currentUser.
  String get userName => userConfig.currentUser.name!;

  /// User profile picture.
  String? get userPic => userConfig.currentUser.image;

  /// The organisation name.
  String get orgName => _selectedOrg.name!;

  /// The database functions instance.
  late DataBaseMutationFunctions _dbFunctions;

  /// The list of image files to be uploaded.
  ///
  /// params:
  /// None
  /// returns:
  /// * `List<File>`: The list of image files
  List<File> get imageFiles => _imageFiles;

  /// The first image file (for backward compatibility).
  ///
  /// params:
  /// None
  /// returns:
  /// * `File?`: The first image file or null
  File? get imageFile => _imageFiles.isNotEmpty ? _imageFiles.first : null;

  /// This function is used to do initialisation of stuff in the view model.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialise() {
    _navigationService = locator<NavigationService>();
    _imageFiles = [];
    _multiMediaPickerService = locator<MultiMediaPickerService>();
    _imageService = locator<ImageService>();
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _selectedOrg = locator<UserConfig>().currentOrg;
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
    if (image != null) {
      // Crop the image
      final croppedImage = await _imageService.cropImage(imageFile: image);
      if (croppedImage != null) {
        addImage(croppedImage);
      }
    }
  }

  /// Method to add image to the list.
  ///
  /// **params**:
  /// * `file`: The file to add
  ///
  /// **returns**:
  ///   None
  void addImage(File file) {
    if (_imageFiles.length < maxImages) {
      _imageFiles.add(file);
      notifyListeners();
    }
  }

  /// Method to remove image from the list.
  ///
  /// **params**:
  /// * `index`: The index of the file to remove
  ///
  /// **returns**:
  ///   None
  void removeImageAt(int index) {
    if (index >= 0 && index < _imageFiles.length) {
      _imageFiles.removeAt(index);
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
    // Validate that at least one image is selected
    if (_imageFiles.isEmpty) {
      _navigationService.showTalawaErrorSnackBar(
        "At least one image is required to create a post",
        MessageType.error,
      );
      return;
    }

    // Validate that caption is not empty
    if (captionController.text.trim().isEmpty) {
      _navigationService.showTalawaErrorSnackBar(
        "Caption cannot be empty",
        MessageType.error,
      );
      return;
    }

    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      criticalActionFailureMessage: TalawaErrors.postCreationFailed,
      action: () async {
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('addPostProgress'),
          ),
        );

        // Upload images to Minio if available
        final List<Map<String, String>> attachmentsList = [];
        if (_imageFiles.isNotEmpty) {
          for (final imageFile in _imageFiles) {
            final fileInfo = await _imageService.uploadFileToMinio(
              file: imageFile,
              organizationId: _selectedOrg.id!,
            );
            attachmentsList.add(
              prepareAttachmentData(
                fileInfo['objectName']!,
                fileInfo['fileHash']!,
                fileInfo['name']!,
                getPostAttachmentMimeType(imageFile.path),
              ),
            );
          }
        }

        final Map<String, dynamic> variables = {
          "caption": captionController.text,
          "organizationId": _selectedOrg.id,
        };

        // Add file information to variables if we uploaded files
        if (attachmentsList.isNotEmpty) {
          variables["attachments"] = attachmentsList;
        }

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
        newPost.getPresignedUrl(_selectedOrg.id);
        locator<PostService>().addNewpost(newPost);
        navigationService.pop();
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
          "Upload failed: $e",
          MessageType.error,
        );
      },
      onActionFinally: () async {
        removeImage();
        captionController.clear();
        notifyListeners();
      },
    );
  }

  /// This function removes all images selected.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void removeImage() {
    _imageFiles.clear();
    notifyListeners();
  }

  /// Checks if the post can be uploaded (at least one image is required).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `bool`: True if post can be uploaded, false otherwise
  bool canUploadPost() {
    return _imageFiles.isNotEmpty && captionController.text.trim().isNotEmpty;
  }

  /// Gets the total number of images selected.
  ///
  /// **returns**:
  /// * `int`: Number of images selected
  int get imageCount => _imageFiles.length;

  /// Prepares attachment data for upload.
  ///
  /// **params**:
  /// * `objectName`: The name of the object in Minio storage.
  /// * `fileHash`: The SHA-256 hash of the file.
  /// * `name`: The name of the file.
  /// * `mimeType`: The MIME type of the file.
  ///
  /// **returns**:
  /// * `Map<String, String>`: A map containing attachment data.
  Map<String, String> prepareAttachmentData(
    String objectName,
    String fileHash,
    String name,
    String mimeType,
  ) {
    return {
      "objectName": objectName,
      "fileHash": fileHash,
      "mimeType": mimeType,
      "name": name,
    };
  }

  /// This function is used to get the query related to updating post vote.
  ///
  /// **params**:
  /// * `fileName`: The name of the file whose MIME type is to be determined.
  ///
  /// **returns**:
  /// * `String`: The mutation for updating vote on a post
  String getPostAttachmentMimeType(String fileName) {
    final ext = fileName.toLowerCase().split('.').last;
    switch (ext) {
      case 'avif':
        return 'IMAGE_AVIF';
      case 'jpg':
      case 'jpeg':
        return 'IMAGE_JPEG';
      case 'png':
        return 'IMAGE_PNG';
      case 'webp':
        return 'IMAGE_WEBP';
      case 'mp4':
        return 'VIDEO_MP4';
      case 'webm':
        return 'VIDEO_WEBM';
      default:
        throw Exception('Unsupported file type');
    }
  }
}
