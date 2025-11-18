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
import 'package:uuid/uuid.dart';

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

  /// Function for compressing the image.
  Future<XFile?> Function(
    String,
    String, {
    bool autoCorrectionAngle,
    CompressFormat format,
    int inSampleSize,
    bool keepExif,
    int minHeight,
    int minWidth,
    int numberOfRetries,
    int quality,
    int rotate,
  }) compressImageFunction = FlutterImageCompress.compressAndGetFile;

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

  /// Detects the image format and extension from file path.
  ///
  /// **params**:
  /// * `filePath`: Path to the image file
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: Map containing 'format' (CompressFormat) and 'extension' (String)
  Map<String, dynamic> getImageFormatInfo(String filePath) {
    final extension = filePath.toLowerCase().split('.').last;
    switch (extension) {
      case 'png':
        return {'format': CompressFormat.png, 'extension': 'png'};
      case 'webp':
        return {'format': CompressFormat.webp, 'extension': 'webp'};
      case 'heic':
        return {'format': CompressFormat.heic, 'extension': 'heic'};
      default:
        return {'format': CompressFormat.jpeg, 'extension': 'jpg'};
    }
  }

  /// Compresses the image file until it meets the specified size limit.
  ///
  /// **params**:
  /// * `file`: The original image file to be compressed.
  ///
  /// **returns**:
  /// * `Future<XFile?>`: The compressed image file if successful, or null if it fails.
  Future<XFile?> compressUntilSize(
    XFile file,
  ) async {
    final originalSize = await file.length();
    // If already under the limit, return original
    if (originalSize <= maxImageSizeAllowed) return file;

    // Detect original image format to preserve it
    final formatInfo = getImageFormatInfo(file.path);
    final format = formatInfo['format'] as CompressFormat;
    final extension = formatInfo['extension'] as String;
    const Uuid uuid = Uuid();
    XFile? compressedFile;
    final List<String> tempFilesToCleanup = [];

    try {
      // Binary search for optimal quality (between 10 and 95)
      int minQuality = 10;
      int maxQuality = 95;
      XFile? bestResult;

      while (minQuality <= maxQuality) {
        final quality = (minQuality + maxQuality) ~/ 2;
        final tempDir = Directory.systemTemp;
        final targetPath =
            '${tempDir.path}/compressed_${uuid.v4()}_$quality.$extension';

        final resultFile = await compressImageFunction(
          file.path,
          targetPath,
          quality: quality,
          format: format,
        );

        if (resultFile == null) {
          maxQuality = quality - 1;
          continue;
        }

        tempFilesToCleanup.add(resultFile.path);

        compressedFile = XFile(resultFile.path);
        final newSize = await compressedFile.length();

        if (newSize <= maxImageSizeAllowed) {
          bestResult = compressedFile;
          minQuality = quality + 1;
        } else {
          maxQuality = quality - 1;
        }
      }

      if (bestResult != null) {
        for (final tempPath in tempFilesToCleanup) {
          if (tempPath != bestResult.path) {
            try {
              await File(tempPath).delete();
            } catch (e) {
              debugPrint(
                'Failed to delete temporary file $tempPath: $e',
              );
            }
          }
        }
        return bestResult;
      }

      // If unable to compress below limit, clean up all temporary files
      for (final tempPath in tempFilesToCleanup) {
        try {
          await File(tempPath).delete();
        } catch (e) {
          debugPrint('Failed to delete temporary file $tempPath: $e');
        }
      }
      return null;
    } catch (e) {
      // In case of any error, ensure cleanup of temporary files
      for (final tempPath in tempFilesToCleanup) {
        try {
          await File(tempPath).delete();
        } catch (cleanupError) {
          debugPrint(
            'Failed to delete temporary file $tempPath during error cleanup: $cleanupError',
          );
        }
      }
      rethrow;
    }
  }

  /// Executes the complete compression workflow including progress dialogs and error handling.
  ///
  /// **params**:
  /// * `file`: The XFile to compress and crop
  ///
  /// **returns**:
  /// * `Future<File?>`: The final cropped file or null if failed
  Future<File?> executeCompressionWorkflow(XFile file) async {
    try {
      navigationService.pushDialog(
        const CustomProgressDialog(key: Key('compressing_loader')),
      );

      final compressed = await compressUntilSize(file);
      navigationService.pop();

      if (compressed == null) {
        navigationService.pushDialog(compressionFailedDialog());
        return null;
      }

      final cropped = await _imageService.cropImage(
        imageFile: File(compressed.path),
      );

      return cropped;
    } catch (e) {
      navigationService.pop();
      navigationService.pushDialog(compressionFailedDialog());
      return null;
    }
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
          fileSizeExceededDialog(
            () async {
              navigationService.pop();
              final result = await executeCompressionWorkflow(file);
              completer.complete(result);
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

  /// Generates a custom alert dialog for file size exceeded.
  ///
  /// When called, it creates and returns a `CustomAlertDialog` widget with pre-defined settings.
  /// This dialog prompts the user to compress the file when size exceeds the limit.
  ///
  /// **params**:
  /// * `onCompress`: Callback function to execute when user chooses to compress
  ///
  /// **returns**:
  /// * `CustomAlertDialog`: Custom Alert Dialog widget.
  CustomAlertDialog fileSizeExceededDialog(VoidCallback onCompress) {
    return CustomAlertDialog(
      dialogTitle: 'File Size Exceeded',
      dialogSubTitle: 'Do you want to compress the file?',
      successText: 'OK',
      success: onCompress,
    );
  }

  /// Generates a custom alert dialog for compression failure.
  ///
  /// When called, it creates and returns a `CustomAlertDialog` widget with pre-defined settings.
  /// This dialog informs the user that compression failed.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `CustomAlertDialog`: Custom Alert Dialog widget.
  CustomAlertDialog compressionFailedDialog() {
    return CustomAlertDialog(
      dialogTitle: 'Compression Failed',
      dialogSubTitle:
          'Unable to compress the image below the size limit. Try again with a smaller image.',
      successText: 'OK',
      success: () => navigationService.pop(),
    );
  }
}
