import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';

import 'package:talawa/locator.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/attachment_queries.dart';

/// ImageService class provides different functions as service in the context of Images.
///
/// Services include:
/// * `cropImage`
/// * `convertToBase64`
/// * `uploadFileToMinio`
/// * `getFileFromMinio`
/// * `calculateFileHash`
class ImageService {
  /// Global instance of ImageCropper.
  final ImageCropper _imageCropper = locator<ImageCropper>();

  /// Database mutation service instance
  final _databaseMutationFunctions = locator<DataBaseMutationFunctions>();

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
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: const Color(0xff18191A),
            toolbarWidgetColor: Colors.white,
            backgroundColor: Colors.black,
            cropGridColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            cropStyle: CropStyle.rectangle,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ],
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ],
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
      final String base64String = base64Encode(bytes);
      return base64String;
    } catch (error) {
      return '';
    }
  }

  /// Calculates SHA-256 hash of a file.
  ///
  /// **params**:
  /// * `file`: File to calculate hash for.
  ///
  /// **returns**:
  /// * `Future<String>`: hex-encoded SHA-256 hash of the file
  Future<String> calculateFileHash(File file) async {
    try {
      final bytes = await file.readAsBytes();
      final digest = sha256.convert(bytes);
      return digest.toString();
    } catch (error) {
      throw Exception('Error calculating file hash: $error');
    }
  }

  /// Uploads a file to Minio storage.
  ///
  /// **params**:
  /// * `file`: File to upload.
  /// * `organizationId`: ID of the organization the file belongs to.
  ///
  /// **returns**:
  /// * `Future<Map<String, String>>`: Object containing objectName and fileHash
  Future<Map<String, String>> uploadFileToMinio({
    required File file,
    required String organizationId,
  }) async {
    try {
      final fileHash = await calculateFileHash(file);
      final fileName = file.path.split('/').last;

      final mutation = AttachmentQueries().createPresignedUrlMutation();
      final variables = {
        'fileName': fileName,
        'organizationId': organizationId,
        'fileHash': fileHash,
      };

      final QueryResult result =
          await _databaseMutationFunctions.gqlAuthMutation(
        mutation,
        variables: variables,
      );
      if (result.hasException) {
        throw Exception('Failed to get presigned URL: ${result.exception}');
      }
      final data = result.data?['createPresignedUrl'] as Map<String, dynamic>?;

      if (data == null) {
        throw Exception('Failed to get presigned URL: No data returned');
      }

      final presignedUrl = data['presignedUrl'] as String?;
      final objectName = data['objectName'] as String?;
      final requiresUpload = data['requiresUpload'] as bool?;

      if (objectName == null) {
        throw Exception('Failed to get object name');
      }
      if (requiresUpload == true && presignedUrl != null) {
        final bytes = await file.readAsBytes();
        final String contentType = getContentType(fileName);
        final response = await http.put(
          Uri.parse(presignedUrl),
          body: bytes,
          headers: {
            'Content-Type': contentType,
          },
        );
        if (response.statusCode != 200) {
          throw Exception(
            'File upload failed: ${response.statusCode} ${response.body}',
          );
        }
      }

      // Return the object name and file hash
      return {
        'objectName': objectName,
        'fileHash': fileHash,
        'name': fileName,
      };
    } catch (error) {
      throw Exception('Error in file upload process: $error');
    }
  }

  /// Gets a file from Minio storage using a presigned URL.
  ///
  /// **params**:
  /// * `objectName`: Name of the object in Minio.
  /// * `organizationId`: ID of the organization the file belongs to.
  ///
  /// **returns**:
  /// * `Future<String>`: Presigned URL for downloading/displaying the file
  Future<String> getFileFromMinio({
    required String objectName,
    required String organizationId,
  }) async {
    try {
      final getFileUrlMutation = AttachmentQueries().getFileUrlMutation();

      final variables = {
        'objectName': objectName,
        'organizationId': organizationId,
      };

      // Execute the mutation
      final QueryResult result =
          await _databaseMutationFunctions.gqlAuthMutation(
        getFileUrlMutation,
        variables: variables,
      );
      // Check for errors
      if (result.hasException) {
        throw Exception('Failed to get file URL: ${result.exception}');
      }
      // Extract presigned URL from result
      final data = result.data?['createGetfileUrl'] as Map<String, dynamic>?;

      if (data == null) {
        throw Exception('Failed to get file URL: No data returned');
      }

      final presignedUrl = data['presignedUrl'] as String?;

      if (presignedUrl == null || presignedUrl.isEmpty) {
        throw Exception('Failed to get presigned URL');
      }

      return presignedUrl;
    } catch (error) {
      throw Exception('Error fetching file from Minio: $error');
    }
  }

  /// Helper method to determine content type from file name.
  ///
  /// **params**:
  /// * `fileName`: Name of the file.
  ///
  /// **returns**:
  /// * `String`: MIME type for the file
  String getContentType(String fileName) {
    final extension = fileName.toLowerCase().split('.').last;

    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'xls':
        return 'application/vnd.ms-excel';
      case 'xlsx':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      case 'mp4':
        return 'video/mp4';
      case 'mp3':
        return 'audio/mpeg';
      default:
        return 'application/octet-stream';
    }
  }
}
