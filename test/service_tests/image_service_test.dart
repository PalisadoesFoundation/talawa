// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/image_service.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockImageService extends Mock implements ImageService {
  static const throwException = 'throw Exception';
  @override
  Future<String> convertToBase64(File file) async {
    if (file.path == throwException) throw Exception('fake exception');
    return "base64";
  }

  @override
  Uint8List? decodeBase64(String base64String) {
    if (base64String == throwException) return null;
    return Uint8List.fromList([1, 2, 3]);
  }
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  group('Tests for Image Service', () {
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

      expect(file?.path, croppedFile.path);
    });

    test("error in crop image", () async {
      final mockImageCropper = locator<ImageCropper>();
      const path = "test";
      final fakefile = File(path);
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
      expect(
        imageService.cropImage(imageFile: fakefile),
        throwsException,
      );
    });

    group('Tests for convertToBase64', () {
      test('convertToBase64 converts file to base64 string', () async {
        final file = File('assets/images/Group 8948.png');
        final List<int> encodedBytes = file.readAsBytesSync();

        final fileString = await imageService.convertToBase64(file);

        final List<int> decodedBytes = base64Decode(fileString.split(',').last);

        expect(decodedBytes, equals(encodedBytes));
      });

      test('convertToBase64 includes correct MIME type for PNG', () async {
        final file = File('assets/images/Group 8948.png');
        final fileString = await imageService.convertToBase64(file);

        expect(fileString.startsWith('data:image/png;base64,'), isTrue);
      });

      test(
          'Check if convertToBase64 is working even if wrong file path is provided',
          () async {
        final file = File('fakePath');
        final fileString = await imageService.convertToBase64(file);
        expect('', fileString);
      });
    });

    group('Tests for decodeBase64', () {
      test('decodeBase64 successfully decodes valid base64 string', () {
        const validBase64 = 'data:image/png;base64,SGVsbG8gV29ybGQ=';
        final result = imageService.decodeBase64(validBase64);

        expect(result, isNotNull);
        expect(result, isA<Uint8List>());
      });

      test('decodeBase64 handles base64 string without MIME type prefix', () {
        const validBase64 = 'SGVsbG8gV29ybGQ=';
        final result = imageService.decodeBase64(validBase64);

        expect(result, isNotNull);
        expect(result, isA<Uint8List>());
      });

      test('decodeBase64 returns null for invalid base64 string', () {
        const invalidBase64 = 'invalid-base64-string';
        final result = imageService.decodeBase64(invalidBase64);

        expect(result, isNull);
      });
    });

    group('Tests for MIME type detection', () {
      test('correctly identifies JPEG image', () async {
        final jpegBytes = [0xFF, 0xD8, 0xFF, 0xE0];
        final file = await File('test.jpg').writeAsBytes(jpegBytes);

        final base64String = await imageService.convertToBase64(file);

        expect(base64String.startsWith('data:image/jpeg;base64,'), isTrue);

        await file.delete();
      });

      test('correctly identifies PNG image', () async {
        final pngBytes = [0x89, 0x50, 0x4E, 0x47];
        final file = await File('test.png').writeAsBytes(pngBytes);

        final base64String = await imageService.convertToBase64(file);

        expect(base64String.startsWith('data:image/png;base64,'), isTrue);

        await file.delete();
      });

      test('handles unknown image format', () async {
        final unknownBytes = [0x00, 0x00, 0x00, 0x00];
        final file = await File('test.bin').writeAsBytes(unknownBytes);

        final base64String = await imageService.convertToBase64(file);

        // Should return plain base64 without MIME type prefix
        expect(base64String.startsWith('data:'), isFalse);

        await file.delete();
      });
    });
  });
}
