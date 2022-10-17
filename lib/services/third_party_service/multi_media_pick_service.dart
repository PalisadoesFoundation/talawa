/* This is an abstraction service for picking up Photos/videos
Library used: image_picker (https://pub.dev/packages/image_picker)
Service usage: "add_post_view_model.dart"
*/

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';

/// MultiMediaPickerService is a third party service which provide the service
/// to select the image from gallery and then image can be cropped as well.
class MultiMediaPickerService {
  MultiMediaPickerService() {
    _picker = ImagePicker();
    _fileStream = _fileStreamController.stream.asBroadcastStream();
  }

  //Local Variables
  final StreamController<File> _fileStreamController = StreamController();
  late Stream<File> _fileStream;
  late ImagePicker _picker;

  //Getters
  Stream get fileStream => _fileStream;

  // getPhotoFromGallery function returns a File type for which `camera` variable is false by default.
  // This function used to pick the image from gallery or to click the image from user's camera.
  Future<File?> getPhotoFromGallery({bool camera = false}) async {
    // asking for user's camera access permission.
    try {
      // checking for the image source, it could be camera or gallery.
      final _image = await _picker.pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
      );
      // if image is selected or not null, call the cropImage function that provide service to crop the selected image.
      if (_image != null) {
        return await cropImage(imageFile: File(_image.path));
      }
    } catch (e) {
      // if the permission denied or error occurs.
      if (e is PlatformException && e.code == 'camera_access_denied') {
        // push the dialog alert with the message.
        locator<NavigationService>().pushDialog(
          CustomAlertDialog(
            success: () {
              locator<NavigationService>().pop();
              openAppSettings();
            },
            dialogTitle: 'Permission Denied',
            successText: 'SETTINGS',
            dialogSubTitle:
                "Camera permission is required, to use this feature, give permission from app settings",
          ),
        );
      }
      print(
        "MultiMediaPickerService : Exception occurred while choosing photo from the gallery $e",
      );
    }
    return null;
  }

  // cropImage functions returns a file type and is used to crop the selected image from picker.
  // This function required the imageFile.
  Future<File?> cropImage({required File imageFile}) async {
    // try, to crop the image and returns a File with cropped image path.
    try {
      final File? croppedImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.original,
        ],
        androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Color(0xff18191A),
          toolbarWidgetColor: Colors.white,
          backgroundColor: Colors.black,
          cropGridColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );
      if (croppedImage != null) {
        return File(croppedImage.path);
      }
    } catch (e) {
      print(
          "MultiMediaPickerService : Exception occurred while cropping Image");
    }
    return null;
  }
}
