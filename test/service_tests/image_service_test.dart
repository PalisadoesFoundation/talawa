import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/image_service.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  late ImageService imageService;
  setUpAll(() {
    testSetupLocator();
    registerServices();
  });
  setUp(() {
    imageService = ImageService();
  });
  tearDownAll(() {
    unregisterServices();
  });

  group('Tests for Crop Image', () {
    test("crop image method", () async {
      const path = "test";
      final fakefile = File(path);
      final croppedFile = CroppedFile("fakeCropped");

      when(
        imageCropper.cropImage(
          sourcePath: "test",
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((realInvocation) async => croppedFile);

      final file = await imageService.cropImage(imageFile: fakefile);

      expect(file?.path, croppedFile.path);
    });

    test('cropImage handles null CroppedFile', () async {
      final testFile = File('test.png');

      when(
        imageCropper.cropImage(
          sourcePath: 'test',
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((_) async => null);

      final result = await imageService.cropImage(imageFile: testFile);

      expect(result, isNull);
    });

    test("error in crop image", () {
      const path = "test";
      final fakefile = File(path);
      when(
        imageCropper.cropImage(
          sourcePath: "test",
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenThrow(Exception());
      expect(
        imageService.cropImage(imageFile: fakefile),
        throwsException,
      );
    });
  });

  group('Tests for convertToBase64', () {
    test('convertToBase64 converts file to base64 string', () async {
      // Create a temporary test file with known content
      const testContent = 'Test file content';
      final testBytes = utf8.encode(testContent);
      final tempFile = File('test_file.txt');
      await tempFile.writeAsBytes(testBytes);

      final fileString = await imageService.convertToBase64(tempFile);

      final List<int> decodedBytes = base64Decode(fileString);

      expect(decodedBytes, equals(testBytes));

      // Clean up
      await tempFile.delete();
    });

    test(
        'Check if convertToBase64 is working even if wrong file path is provided',
        () async {
      final file = File('fakePath');
      final fileString = await imageService.convertToBase64(file);
      expect(
        "",
        fileString,
      );
    });
  });
}
