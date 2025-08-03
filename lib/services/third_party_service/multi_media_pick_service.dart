import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/image_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

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

  /// Maximum size allowed for image upload in mb.
  final maxImageSizeAllowed = 5 * 1024 * 1024; // 5 MB

  /// Stream of selected files.
  late Stream<File> _fileStream;

  /// [ImagePicker] used for selecting images or videos.
  late ImagePicker _picker;

  /// [ImageService] for additional image-related operations.
  late ImageService _imageService;

  /// Navigation service for the app.
  final navigationService = locator<NavigationService>();

  /// Provides a stream of selected multimedia files.
  ///
  /// params:
  /// None.
  ///
  /// returns:
  /// * `Stream<dynamic>`: Stream of files.
  Stream get fileStream => _fileStream;

  /// Compresses the image file until it meets the specified size limit.
  ///
  /// **params**:
  /// * `file`: The original image file to be compressed.
  /// * `maxImageSizeAllowed`: The maximum allowed size for the compressed image in bytes
  ///
  /// **returns**:
  /// * `Future<XFile?>`: The compressed image file if successful, or null if it fails.
  Future<XFile?> compressUntilSize(
    XFile file,
  ) async {
    final originalSize = await file.length();
    // If already under the limit, return original
    if (originalSize <= maxImageSizeAllowed) return file;

    // Estimate initial quality based on size ratio (clamp between 10 and 95)
    final int estimatedQuality =
        ((maxImageSizeAllowed / originalSize) * 95).clamp(10, 95).toInt();

    XFile? compressedFile;
    int quality = estimatedQuality;

    while (quality >= 10) {
      final tempDir = Directory.systemTemp;
      final targetPath =
          '${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}_$quality.jpg';
      final resultFile = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetPath,
        quality: quality,
      );
      if (resultFile == null) break;
      compressedFile = XFile(resultFile.path);
      final newSize = await compressedFile.length();
      if (newSize <= maxImageSizeAllowed) return compressedFile;
      quality -= 10;
    }

    // If unable to compress below limit, return null
    return null;
  }

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
    try {
      final file = await _picker.pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
      );
      if (file == null) return null;

      final bytes = await file.length();

      if (bytes > maxImageSizeAllowed) {
        final completer = Completer<File?>();
        navigationService.pushDialog(
          CustomAlertDialog(
            dialogTitle: 'File Size Exceeded',
            dialogSubTitle: 'Do you want to compress the file?',
            successText: 'OK',
            success: () async {
              navigationService.pop();
              navigationService.pushDialog(
                const CustomProgressDialog(key: Key('compressing_loader')),
              );
              final compressed = await compressUntilSize(file);
              navigationService.pop(); // Remove loader
              if (compressed == null) {
                navigationService.pushDialog(
                  CustomAlertDialog(
                    dialogTitle: 'Compression Failed',
                    dialogSubTitle:
                        'Unable to compress the image below the size limit. Try again with a smaller image.',
                    successText: 'OK',
                    success: () => navigationService.pop(),
                  ),
                );
                completer.complete(null);
              } else {
                final cropped = await _imageService.cropImage(
                  imageFile: File(compressed.path),
                );
                completer.complete(cropped);
              }
            },
          ),
        );
        return await completer.future;
      }

      return await _imageService.cropImage(imageFile: File(file.path));
    } catch (e) {
      if (e is PlatformException && e.code == 'camera_access_denied') {
        navigationService.pushDialog(permissionDeniedDialog());
      }
      debugPrint(
        "MultiMediaPickerService : Exception occurred while choosing photo from the gallery $e",
      );
      return null;
    }
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
        navigationService.pop();
        openAppSettings();
      },
      dialogTitle: 'Permission Denied',
      successText: 'SETTINGS',
      dialogSubTitle:
          "Camera permission is required, to use this feature, give permission from app settings",
    );
  }
}
