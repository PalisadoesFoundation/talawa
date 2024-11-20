import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:talawa/locator.dart';

/// ImageService class provides different functions as service in the context of Images.
///
/// Services include:
/// * `cropImage`
/// * `convertToBase64`
/// * `decodeBase64`
class ImageService {
  /// Global instance of ImageCropper.
  final ImageCropper _imageCropper = locator<ImageCropper>();

  /// Crops the image selected by the user.
  ///
  /// **params**:
  /// * `imageFile`: the image file to be cropped.
  ///
  /// **returns**:
  /// * `Future<File?>`: the image after been cropped.
  ///
  /// **throws**:
  /// - `Exception`: If an error occurs during the image cropping process.
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
      throw Exception(
        "ImageService : $e.",
      );
    }

    return null;
  }

  /// Converts the image into Base64 format.
  ///
  /// **params**:
  /// * `file`: Image as a File object.
  ///
  /// **returns**:
  /// * `Future<String>`: image in string format
  Future<String> convertToBase64(File file) async {
    try {
      final List<int> bytes = await file.readAsBytes();

      // Check the first few bytes (magic numbers) to identify the file type
      final String? mimeType = _getMimeType(bytes);

      // If mimeType is null, fallback to generic base64 encoding
      if (mimeType != null) {
        final String base64String = base64Encode(bytes);
        return 'data:$mimeType;base64,$base64String';
      } else {
        return base64Encode(bytes);
      }
    } catch (error) {
      return '';
    }
  }

  /// Decodes a base64 string back into an image File.
  ///
  /// **params**:
  /// * `base64String`: The base64 encoded string.
  ///
  /// **returns**:
  /// * `Uint8List?`: Decoded image file, null if an error occurs.
  Uint8List? decodeBase64(String base64String) {
    try {
      // Remove the prefix "data:image/...;base64," if it exists
      final regex = RegExp('data:image/[^;]+;base64,');
      final cleanedBase64 = base64String.replaceFirst(regex, '');
      final Uint8List bytes = base64Decode(cleanedBase64);

      return bytes;
    } catch (error) {
      print("Error decoding base64: $error");
      return null;
    }
  }

  /// method to get what format image is.
  ///
  /// **params**:
  /// * `bytes`: bytes data of the image
  ///
  /// **returns**:
  /// * `String?`: define_the_return
  String? _getMimeType(List<int> bytes) {
    if (bytes.length < 4) {
      return null;
    }

    // JPEG: starts with 0xFF, 0xD8, and ends with 0xFF, 0xD9
    if (bytes[0] == 0xFF && bytes[1] == 0xD8) {
      return 'image/jpeg';
    }

    // PNG: starts with 0x89, 'P', 'N', 'G'
    if (bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4E &&
        bytes[3] == 0x47) {
      return 'image/png';
    }

    // GIF: starts with 'G', 'I', 'F'
    if (bytes[0] == 0x47 && bytes[1] == 0x49 && bytes[2] == 0x46) {
      return 'image/gif';
    }

    // BMP: starts with 'B', 'M'
    if (bytes[0] == 0x42 && bytes[1] == 0x4D) {
      return 'image/bmp';
    }

    // WebP: starts with 'R', 'I', 'F', 'F' followed by 'W', 'E', 'B', 'P'
    if (bytes[0] == 0x52 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46 &&
        bytes[3] == 0x46) {
      if (bytes[8] == 0x57 &&
          bytes[9] == 0x45 &&
          bytes[10] == 0x42 &&
          bytes[11] == 0x50) {
        return 'image/webp';
      }
    }

    // Add more file type checks here if needed (e.g., TIFF, HEIC, etc.)

    return null;
  }
}
