// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:convert';
import 'dart:io';

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
}

void main() {
  late ImageCropper mockImageCropper;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });
  setUp(() {
    mockImageCropper = locator<ImageCropper>();
    reset(mockImageCropper); // Reset mock before each test
  });

  group('Tests for Crop Image', () {
    test("crop image method", () async {
      const path = "test";
      final fakefile = File(path);
      final croppedFile = CroppedFile("fakeCropped");

      when(
        mockImageCropper.cropImage(
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
        mockImageCropper.cropImage(
          sourcePath: 'test',
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((_) async => null);

      final result = await imageService.cropImage(imageFile: testFile);

      expect(result, isNull);
    });

    test('cropImage uses correct aspectRatioPresets', () async {
      const path = "test";

      final testFile = File(path);
      final croppedFile = CroppedFile('cropped_test.png');

      when(
        mockImageCropper.cropImage(
          sourcePath: 'test',
          uiSettings: captureAnyNamed('uiSettings'),
        ),
      ).thenAnswer((_) async => croppedFile);

      await imageService.cropImage(imageFile: testFile);

      final capturedUiSettings = verify(
        mockImageCropper.cropImage(
          sourcePath: 'test',
          uiSettings: captureAnyNamed('uiSettings'),
        ),
      ).captured.single as List<PlatformUiSettings>;

      final androidSettings =
          capturedUiSettings.whereType<AndroidUiSettings>().single;
      final iosSettings = capturedUiSettings.whereType<IOSUiSettings>().single;

      expect(
        androidSettings.aspectRatioPresets,
        contains(CropAspectRatioPreset.square),
      );
      expect(
        androidSettings.aspectRatioPresets,
        contains(CropAspectRatioPreset.original),
      );
      expect(
        androidSettings.aspectRatioPresets,
        contains(CropAspectRatioPreset.ratio3x2),
      );
      expect(
        androidSettings.aspectRatioPresets,
        contains(CropAspectRatioPreset.ratio4x3),
      );
      expect(
        androidSettings.aspectRatioPresets,
        contains(CropAspectRatioPreset.ratio16x9),
      );
      expect(
        iosSettings.aspectRatioPresets,
        contains(CropAspectRatioPreset.square),
      );
      expect(
        iosSettings.aspectRatioPresets,
        contains(CropAspectRatioPreset.original),
      );
      expect(
        iosSettings.aspectRatioPresets,
        contains(CropAspectRatioPreset.ratio3x2),
      );
      expect(
        iosSettings.aspectRatioPresets,
        contains(CropAspectRatioPreset.ratio4x3),
      );
      expect(
        iosSettings.aspectRatioPresets,
        contains(CropAspectRatioPreset.ratio16x9),
      );
    });

    test("error in crop image", () {
      const path = "test";
      final fakefile = File(path);
      when(
        mockImageCropper.cropImage(
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
      //using this asset as the test asset
      final file = File('assets/images/Group 8948.png');
      final List<int> encodedBytes = file.readAsBytesSync();

      final fileString = await imageService.convertToBase64(file);

      final List<int> decodedBytes = base64Decode(fileString);

      expect(decodedBytes, equals(encodedBytes));
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
