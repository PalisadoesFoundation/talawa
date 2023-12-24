// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/image_service.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockImageService extends Mock implements ImageService {
  @override
  Future<String> convertToBase64(File file) async {
    return "";
  }
}

void main() {
  testSetupLocator();

  setUpAll(() {
    registerServices();
  });

  group('Tests for Crop Image', () {
    test("test no image provided for the image cropper", () async {
      const path = 'test';
      final file = await imageService.cropImage(imageFile: File(path));
      expect(file?.path, null);
    });

    test("crop image method", () async {
      final mockImageCropper = imageCropper;

      const path = "test";
      final fakefile = File(path);
      final croppedFile = CroppedFile("fakeCropped");

      when(
        mockImageCropper.cropImage(
          sourcePath: "test",
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
          ],
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((realInvocation) async => croppedFile);
      final file = await imageService.cropImage(imageFile: fakefile);
      // verify(mockImageCropper.cropImage(sourcePath: fakefile.path));
      expect(file?.path, croppedFile.path);
    });

    test("error in crop image", () async {
      final mockImageCropper = locator<ImageCropper>();
      const path = "test";
      final fakefile = File(path);
      final printed = <String>[];
      when(
        mockImageCropper.cropImage(
          sourcePath: "test",
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
          ],
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenThrow(Exception());
      runZoned(
        () async {
          await imageService.cropImage(imageFile: fakefile);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            printed.add(line);
          },
        ),
      );
      expect(
        printed[0],
        "ImageService : Exception occurred while cropping Image",
      );
    });
  });

  group('Tests for convertToBase64', () {
    test('convertToBase64 converts file to base64 string', () async {
      //using this asset as the test asset
      final file = File('assets/images/Group 8948.png');
      final fileString = await imageService.convertToBase64(file);
      print(fileString);
    });

    test(
        'Check if convertToBase64 is working even if wrong file path is provided',
        () async {
      final file = File('fakePath');
      final fileString = await imageService.convertToBase64(file);
      expect('', fileString);
    });
  });
}
