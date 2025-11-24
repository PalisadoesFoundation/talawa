/* This is an abstraction service for picking up Photos/videos
Library used: image_picker (https://pub.dev/packages/image_picker)
Service usage: "add_post_view_model.dart"
*/

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/image_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';

/// This is a third party service which provide the service to select the image from.
///
/// gallery and then image can be cropped as well.
///
/// Services include:
/// * `getPhotoFromGallery` - Used to select photo from gallery.
/// * `cropImage` - Used to crop the selected image.
class MultiMediaPickerService {
  MultiMediaPickerService() {
    _picker = locator<ImagePicker>();
    _fileStream = _fileStreamController.stream.asBroadcastStream();
    _imageService = imageService;
  }

  /// Controller for handling the stream of selected files.
  final StreamController<File> _fileStreamController = StreamController();

  /// Stream of selected files.
  late Stream<File> _fileStream;

  /// [ImagePicker] used for selecting images or videos.
  late ImagePicker _picker;

  /// [ImageService] for additional image-related operations.
  late ImageService _imageService;

  /// Provides a stream of selected multimedia files.
  ///
  /// params:
  /// None.
  ///
  /// returns:
  /// * `Stream<dynamic>`: Stream of files.
  Stream get fileStream => _fileStream;

  /// Picks the image from gallery or to click the image from user's camera.
  ///
  /// First ask for the permission to access the camera, if denied then returns a message in.
  /// custom Dialog Box. Returns a File type for which `camera` variable is false by default.
  ///
  /// **params**:
  /// * `camera`: if true then open camera for image, else open gallery to select image.
  ///
  /// **returns**:
  /// * `Future<File?>`: the image the user choosed.
  Future<File?> getPhotoFromGallery({bool camera = false}) async {
    // asking for user's camera access permission.
    try {
      // checking for the image source, it could be camera or gallery.
      final image = await _picker.pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
      );
      // if image is selected or not null, call the cropImage function that provide service to crop the selected image.
      if (image != null) {
        return await _imageService.cropImage(
          imageFile: File(image.path),
        );
      }
    } catch (e) {
      // if the permission denied or error occurs.
      if (e is PlatformException && e.code == 'camera_access_denied') {
        // push the dialog alert with the message.
        locator<NavigationService>().pushDialog(
          permissionDeniedDialog(),
        );
      }
      debugPrint(
        "MultiMediaPickerService : Exception occurred while choosing photo from the gallery $e",
      );
    }

    return null;
  }

  /// Generates a custom alert dialog for permission denial.
  ///
  /// When called, it creates and returns a `CustomAlertDialog` widget with pre-defined settings.
  /// This dialog prompts the user to grant camera permissions from the app settings.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `CustomAlertDialog`: Custom Alert Dialog widget.
  CustomAlertDialog permissionDeniedDialog() {
    return CustomAlertDialog(
      success: () {
        locator<NavigationService>().pop();
        openAppSettings();
      },
      dialogTitle: 'Permission Denied',
      successText: 'SETTINGS',
      dialogSubTitle:
          "Camera permission is required, to use this feature, give permission from app settings",
    );
  }
}
