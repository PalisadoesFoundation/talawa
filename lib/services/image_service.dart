import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:talawa/locator.dart';

/// ImageService class provides different functions as service in the context of Images.
///
/// Services include:
/// * `cropImage`
/// * `convertToBase64`
class ImageService {
  /// instance of ImageCropper.
  final ImageCropper _imageCropper = locator<ImageCropper>();

  /// This function is used to crop the image selected by the user.
  ///
  /// The function accepts a `File` type image and returns `File` type of cropped image.
  ///
  /// **params**:
  /// * `imageFile`: the image file to be cropped.
  ///
  /// **returns**:
  /// * `Future<File?>`: the image after been cropped.
  Future<File?> cropImage({required File imageFile}) async {
    // try, to crop the image and returns a File with cropped image path.
    try {
      final CroppedFile? croppedImage = await _imageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.original,
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: const Color(0xff18191A),
            toolbarWidgetColor: Colors.white,
            backgroundColor: Colors.black,
            cropGridColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
          ),
        ],
      );
      if (croppedImage != null) {
        return File(croppedImage.path);
      }
    } catch (e) {
      print(
        "MultiMediaPickerService : Exception occurred while cropping Image",
      );
    }
    return null;
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
      final String base64String = base64Encode(bytes);
      print(base64String);
      return base64String;
    } catch (error) {
      return '';
    }
  }
}
