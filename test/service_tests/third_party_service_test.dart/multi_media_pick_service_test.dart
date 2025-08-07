// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/utils/app_localization.dart';
import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';
import '../../helpers/test_locator.dart';

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
    SizeConfig().test();
  });
  group('MultiMediaPickerService test', () {
    test(
        "test get photo from gallery method if camera option is false and image size is less than 5MB",
        () async {
      final mockPicker = imagePicker;
      final model = MultiMediaPickerService();
      const path = 'test';
      final image = MockXFile();
      when(image.path).thenReturn(path);
      when(image.name).thenReturn('test_image.png');
      when(image.mimeType).thenReturn('image/png');
      when(image.length()).thenAnswer((_) async => 1024);

      when(mockPicker.pickImage(source: ImageSource.gallery))
          .thenAnswer((realInvocation) async => image);
      when(
        mockImageCropper.cropImage(
          sourcePath: "test",
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((realInvocation) async => CroppedFile(path));

      final result = await model.getPhotoFromGallery(camera: false);

      expect(result?.path, path);
    });
    test(
        "test get photo from gallery method if camera option is true and image size is less than 5MB",
        () async {
      final mockPicker = imagePicker;
      final model = MultiMediaPickerService();
      const path = 'test';
      final image = MockXFile();
      when(image.path).thenReturn(path);
      when(image.name).thenReturn('test_image.png');
      when(image.mimeType).thenReturn('image/png');
      when(image.length()).thenAnswer((_) async => 1024);

      when(mockPicker.pickImage(source: ImageSource.camera))
          .thenAnswer((realInvocation) async => image);
      when(
        mockImageCropper.cropImage(
          sourcePath: "test",
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((realInvocation) async => CroppedFile(path));

      final result = await model.getPhotoFromGallery(camera: true);

      expect(result?.path, path);
    });

    test(
        "test get photo from gallery method with aspectRatioPresets in uiSettings",
        () async {
      final mockPicker = locator<ImagePicker>();
      final model = MultiMediaPickerService();
      const path = 'test';
      final image = MockXFile();
      when(image.path).thenReturn(path);
      when(image.name).thenReturn('test_image.png');
      when(image.mimeType).thenReturn('image/png');
      when(image.length()).thenAnswer((_) async => 1024);

      when(mockPicker.pickImage(source: ImageSource.gallery))
          .thenAnswer((_) async => image);
      when(
        mockImageCropper.cropImage(
          sourcePath: "test",
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((_) async => CroppedFile(path));

      await model.getPhotoFromGallery(camera: false);

      final capturedUiSettings = verify(
        mockImageCropper.cropImage(
          sourcePath: "test",
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
    test("test no photo provided for the pick image", () async {
      final model = MultiMediaPickerService();
      final file = await model.getPhotoFromGallery(camera: false);
      expect(file?.path, null);
    });
    test("camera access denied", () {
      final mockPicker = locator<ImagePicker>();
      final model = MultiMediaPickerService();
      final printed = <String>[];

      final error = PlatformException(code: 'camera_access_denied');
      when(mockPicker.pickImage(source: ImageSource.camera)).thenThrow(error);
      runZoned(
        () async {
          await model.getPhotoFromGallery(camera: true);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            printed.add(line);
          },
        ),
      );
      expect(
        printed[0],
        "MultiMediaPickerService : Exception occurred while choosing photo from the gallery $error",
      );
    });

    testWidgets('Test for permission_denied_dialog success action.',
        (tester) async {
      final service = MultiMediaPickerService();

      final Widget app = MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        navigatorObservers: [],
        locale: const Locale('en'),
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
          const Locale('fr', 'FR'),
          const Locale('hi', 'IN'),
          const Locale('zh', 'CN'),
          const Locale('de', 'DE'),
          const Locale('ja', 'JP'),
          const Locale('pt', 'PT'),
        ],
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(body: service.permissionDeniedDialog()),
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      final settingsFinder = find.textContaining('SETTINGS');

      expect(settingsFinder, findsOneWidget);

      await tester.tap(settingsFinder);

      verify(navigationService.pop());
    });

    testWidgets('Test for fileSizeExceededDialog success action.',
        (tester) async {
      final service = MultiMediaPickerService();
      bool onCompressCalled = false;

      final Widget app = MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        navigatorObservers: [],
        locale: const Locale('en'),
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
          const Locale('fr', 'FR'),
          const Locale('hi', 'IN'),
          const Locale('zh', 'CN'),
          const Locale('de', 'DE'),
          const Locale('ja', 'JP'),
          const Locale('pt', 'PT'),
        ],
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: service.fileSizeExceededDialog(() {
            onCompressCalled = true;
          }),
        ),
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      final okFinder = find.text('OK');

      expect(okFinder, findsOneWidget);
      expect(find.text('File Size Exceeded'), findsOneWidget);
      expect(find.text('Do you want to compress the file?'), findsOneWidget);

      await tester.tap(okFinder);

      expect(onCompressCalled, isTrue);
    });

    testWidgets('Test for compressionFailedDialog success action.',
        (tester) async {
      final service = MultiMediaPickerService();

      final Widget app = MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        navigatorObservers: [],
        locale: const Locale('en'),
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
          const Locale('fr', 'FR'),
          const Locale('hi', 'IN'),
          const Locale('zh', 'CN'),
          const Locale('de', 'DE'),
          const Locale('ja', 'JP'),
          const Locale('pt', 'PT'),
        ],
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(body: service.compressionFailedDialog()),
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      final okFinder = find.text('OK');

      expect(okFinder, findsOneWidget);
      expect(find.text('Compression Failed'), findsOneWidget);
      expect(
        find.text(
          'Unable to compress the image below the size limit. Try again with a smaller image.',
        ),
        findsOneWidget,
      );

      await tester.tap(okFinder);

      verify(navigationService.pop());
    });

    test("test get fileStream", () {
      final model = MultiMediaPickerService();
      expect(
        model.fileStream.toString(),
        "Instance of '_AsBroadcastStream<File>'",
      );
    });
  });
  group('MultiMediaPickerService.compressUntilSize', () {
    test('returns original file if already under size limit', () async {
      final service = MultiMediaPickerService();

      // Create a small file (1KB)
      final tempFile =
          await File('${Directory.systemTemp.path}/small_image.jpg').create();
      await tempFile.writeAsBytes(List.filled(1024, 0)); // 1KB

      final mockXFile = MockXFile();
      when(mockXFile.length()).thenAnswer((_) async => 1024); // 1KB
      when(mockXFile.path).thenReturn(tempFile.path);

      final result = await service.compressUntilSize(mockXFile);

      expect(result, equals(mockXFile));
      expect(await result!.length(), lessThan(service.maxImageSizeAllowed));

      // Cleanup
      await tempFile.delete();
    });
  });

  group('MultiMediaPickerService.getImageFormatInfo', () {
    test('should correctly detect all supported image formats and extensions',
        () {
      final service = MultiMediaPickerService();

      // Test PNG format
      final pngResult = service.getImageFormatInfo('/path/to/image.png');
      expect(pngResult['format'], equals(CompressFormat.png));
      expect(pngResult['extension'], equals('png'));

      // Test PNG with uppercase extension
      final pngUpperResult = service.getImageFormatInfo('/path/to/IMAGE.PNG');
      expect(pngUpperResult['format'], equals(CompressFormat.png));
      expect(pngUpperResult['extension'], equals('png'));

      // Test WebP format
      final webpResult = service.getImageFormatInfo('/path/to/image.webp');
      expect(webpResult['format'], equals(CompressFormat.webp));
      expect(webpResult['extension'], equals('webp'));

      // Test HEIC format
      final heicResult = service.getImageFormatInfo('/path/to/image.heic');
      expect(heicResult['format'], equals(CompressFormat.heic));
      expect(heicResult['extension'], equals('heic'));

      // Test JPEG format (jpg extension)
      final jpegResult = service.getImageFormatInfo('/path/to/image.jpg');
      expect(jpegResult['format'], equals(CompressFormat.jpeg));
      expect(jpegResult['extension'], equals('jpg'));

      // Test JPEG format (jpeg extension - should default to jpeg format)
      final jpegLongResult = service.getImageFormatInfo('/path/to/image.jpeg');
      expect(jpegLongResult['format'], equals(CompressFormat.jpeg));
      expect(jpegLongResult['extension'], equals('jpg'));

      // Test unknown format (should default to JPEG)
      final unknownResult = service.getImageFormatInfo('/path/to/image.tiff');
      expect(unknownResult['format'], equals(CompressFormat.jpeg));
      expect(unknownResult['extension'], equals('jpg'));

      // Test file with no extension (should default to JPEG)
      final noExtResult = service.getImageFormatInfo('/path/to/imagefile');
      expect(noExtResult['format'], equals(CompressFormat.jpeg));
      expect(noExtResult['extension'], equals('jpg'));

      // Test complex path with multiple dots
      final complexPathResult =
          service.getImageFormatInfo('/path/to/my.image.file.png');
      expect(complexPathResult['format'], equals(CompressFormat.png));
      expect(complexPathResult['extension'], equals('png'));
    });
  });

  group('MultiMediaPickerService.compressUntilSize comprehensive tests', () {
    late TestableMultiMediaPickerService service;
    late MockXFile mockInputFile;
    late Directory tempDir;

    setUp(() async {
      service = TestableMultiMediaPickerService();
      mockInputFile = MockXFile();
      tempDir = await Directory.systemTemp.createTemp('test_compress_');
    });

    tearDown(() async {
      try {
        await tempDir.delete(recursive: true);
      } catch (e) {
        // Ignore cleanup errors
      }
    });

    test('returns original file when already under size limit', () async {
      // Mock file that's already small enough (1MB)
      when(mockInputFile.length()).thenAnswer((_) async => 1024 * 1024);
      when(mockInputFile.path).thenReturn('/test/image.jpg');

      final result = await service.compressUntilSize(mockInputFile);

      expect(result, equals(mockInputFile));
      verify(mockInputFile.length()).called(1);
      // Path shouldn't be accessed for small files since we return early
    });

    test('performs binary search compression for oversized files', () async {
      // Mock large file (10MB)
      when(mockInputFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);
      when(mockInputFile.path).thenReturn('/test/large_image.png');

      // Setup mock compression behavior
      service.setupMockCompression((
        sourcePath,
        targetPath, {
        bool? autoCorrectionAngle,
        CompressFormat? format,
        int? inSampleSize,
        bool? keepExif,
        int? minHeight,
        int? minWidth,
        int? numberOfRetries,
        int? quality,
        int? rotate,
      }) async {
        // Simulate binary search behavior based on quality
        final fileSize = quality! >= 70
            ? 7 * 1024 * 1024 // Too large
            : quality >= 40
                ? 3 * 1024 * 1024 // Acceptable
                : 2 * 1024 * 1024; // Small

        await File(targetPath).writeAsBytes(List.filled(fileSize, 0));
        return XFile(targetPath);
      });

      final result = await service.compressUntilSize(mockInputFile);

      expect(result, isNotNull);
      expect(
        await result!.length(),
        lessThanOrEqualTo(service.maxImageSizeAllowed),
      );
      expect(
        service.compressionAttempts,
        greaterThan(1),
      ); // Should make multiple attempts

      // Verify original file was checked
      verify(mockInputFile.length()).called(1);
      // Path is accessed multiple times during binary search
      verify(mockInputFile.path).called(greaterThanOrEqualTo(1));
    });

    test('preserves PNG format during compression', () async {
      when(mockInputFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);
      when(mockInputFile.path).thenReturn('/test/image.png');

      CompressFormat? usedFormat;

      service.setupMockCompression((
        sourcePath,
        targetPath, {
        bool? autoCorrectionAngle,
        CompressFormat? format,
        int? inSampleSize,
        bool? keepExif,
        int? minHeight,
        int? minWidth,
        int? numberOfRetries,
        int? quality,
        int? rotate,
      }) async {
        usedFormat = format;
        // Create acceptable file size
        await File(targetPath).writeAsBytes(List.filled(4 * 1024 * 1024, 0));
        return XFile(targetPath);
      });

      final result = await service.compressUntilSize(mockInputFile);

      expect(result, isNotNull);
      expect(
        usedFormat,
        equals(CompressFormat.png),
      ); // Should preserve PNG format
    });

    test('handles compression failure gracefully', () async {
      when(mockInputFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);
      when(mockInputFile.path).thenReturn('/test/image.jpg');

      // Mock compression function that always fails
      service.setupMockCompression((
        sourcePath,
        targetPath, {
        bool? autoCorrectionAngle,
        CompressFormat? format,
        int? inSampleSize,
        bool? keepExif,
        int? minHeight,
        int? minWidth,
        int? numberOfRetries,
        int? quality,
        int? rotate,
      }) async {
        return null; // Simulate compression failure
      });

      final result = await service.compressUntilSize(mockInputFile);

      expect(result, isNull);
    });

    test('binary search finds optimal quality efficiently', () async {
      when(mockInputFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);
      when(mockInputFile.path).thenReturn('/test/image.jpg');

      final qualitiesUsed = <int>[];
      final filesCreated = <String, int>{}; // targetPath -> quality

      service.setupMockCompression((
        sourcePath,
        targetPath, {
        bool? autoCorrectionAngle,
        CompressFormat? format,
        int? inSampleSize,
        bool? keepExif,
        int? minHeight,
        int? minWidth,
        int? numberOfRetries,
        int? quality,
        int? rotate,
      }) async {
        qualitiesUsed.add(quality!);
        filesCreated[targetPath] = quality;

        // Simulate realistic compression behavior
        // Quality >= 70 = too large, 40-69 = acceptable, <40 = small
        final fileSize = quality >= 70
            ? 6 * 1024 * 1024 // Too large
            : quality >= 40
                ? 4 * 1024 * 1024 // Acceptable
                : 2 * 1024 * 1024; // Small

        await File(targetPath).writeAsBytes(List.filled(fileSize, 0));
        return XFile(targetPath);
      });

      final result = await service.compressUntilSize(mockInputFile);

      expect(result, isNotNull);
      expect(
        service.compressionAttempts,
        lessThanOrEqualTo(7),
      ); // Binary search should be efficient
      expect(
        qualitiesUsed.first,
        equals(52),
      ); // Should start with middle value (10+95)/2 = 52

      // Debug: Check what quality corresponds to the returned file
      final resultQuality = filesCreated[result!.path];

      // The algorithm searches for the HIGHEST quality that works
      // The returned file should correspond to quality 69 or less
      expect(resultQuality, isNotNull);
      expect(resultQuality, lessThan(70)); // Should be 69 or less
    });

    test('cleans up temporary files correctly', () async {
      when(mockInputFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);
      when(mockInputFile.path).thenReturn('/test/image.jpg');

      final createdFiles = <String>[];

      service.setupMockCompression((
        sourcePath,
        targetPath, {
        bool? autoCorrectionAngle,
        CompressFormat? format,
        int? inSampleSize,
        bool? keepExif,
        int? minHeight,
        int? minWidth,
        int? numberOfRetries,
        int? quality,
        int? rotate,
      }) async {
        createdFiles.add(targetPath);
        final fileSize = quality! >= 50 ? 7 * 1024 * 1024 : 3 * 1024 * 1024;
        await File(targetPath).writeAsBytes(List.filled(fileSize, 0));
        return XFile(targetPath);
      });

      final result = await service.compressUntilSize(mockInputFile);

      expect(result, isNotNull);
      expect(
        createdFiles.length,
        greaterThan(1),
      ); // Multiple files should be created

      // Check that only the best result file still exists
      var existingFiles = 0;
      for (final filePath in createdFiles) {
        if (await File(filePath).exists()) {
          existingFiles++;
        }
      }
      expect(existingFiles, equals(1)); // Only the best result should remain
    });

    test('handles different image formats correctly', () async {
      final testCases = [
        {'path': '/test/image.webp', 'expectedFormat': CompressFormat.webp},
        {'path': '/test/image.heic', 'expectedFormat': CompressFormat.heic},
        {'path': '/test/image.jpeg', 'expectedFormat': CompressFormat.jpeg},
      ];

      for (final testCase in testCases) {
        when(mockInputFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);
        when(mockInputFile.path).thenReturn(testCase['path']! as String);

        CompressFormat? usedFormat;

        service.setupMockCompression((
          sourcePath,
          targetPath, {
          bool? autoCorrectionAngle,
          CompressFormat? format,
          int? inSampleSize,
          bool? keepExif,
          int? minHeight,
          int? minWidth,
          int? numberOfRetries,
          int? quality,
          int? rotate,
        }) async {
          usedFormat = format;
          await File(targetPath).writeAsBytes(List.filled(3 * 1024 * 1024, 0));
          return XFile(targetPath);
        });

        await service.compressUntilSize(mockInputFile);

        expect(
          usedFormat,
          equals(testCase['expectedFormat']),
          reason: 'Failed for ${testCase['path']}',
        );
      }
    });
  });
}

/// Testable version of MultiMediaPickerService that allows mocking the compression function
class TestableMultiMediaPickerService extends MultiMediaPickerService {
  int compressionAttempts = 0;

  void setupMockCompression(
    Future<XFile?> Function(
      String,
      String, {
      bool? autoCorrectionAngle,
      CompressFormat? format,
      int? inSampleSize,
      bool? keepExif,
      int? minHeight,
      int? minWidth,
      int? numberOfRetries,
      test('executeCompressionWorkflow - successful compression and crop', () async {
        final service = MultiMediaPickerService();
        final mockXFile = MockXFile();
        when(mockXFile.path).thenReturn('/test/image.jpg');
        when(mockXFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);

        final mockCroppedFile = File('/test/cropped.jpg');
        when(imageService.cropImage(imageFile: File('/test/compressed.jpg')))
            .thenAnswer((_) async => mockCroppedFile);

        service.compressImageFunction = (
          String sourcePath,
          String targetPath, {
          bool autoCorrectionAngle = true,
          CompressFormat format = CompressFormat.jpeg,
          int inSampleSize = 1,
          bool keepExif = false,
          int minHeight = 0,
          int minWidth = 0,
          int numberOfRetries = 5,
          int quality = 95,
          int rotate = 0,
        }) async {
          await File(targetPath).writeAsBytes(List.filled(3 * 1024 * 1024, 0));
          return XFile('/test/compressed.jpg');
        };

        final result = await service.executeCompressionWorkflow(mockXFile);

        expect(result, equals(mockCroppedFile));
        verify(navigationService.pushDialog(argThat(isA<CustomProgressDialog>()))).called(1);
        verify(navigationService.pop()).called(1);
        verify(imageService.cropImage(imageFile: File('/test/compressed.jpg'))).called(1);
      });

      test('executeCompressionWorkflow - compression fails', () async {
        final service = MultiMediaPickerService();
        final mockXFile = MockXFile();
        when(mockXFile.path).thenReturn('/test/image.jpg');
        when(mockXFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);

        service.compressImageFunction = (
          String sourcePath,
          String targetPath, {
          bool autoCorrectionAngle = true,
          CompressFormat format = CompressFormat.jpeg,
          int inSampleSize = 1,
          bool keepExif = false,
          int minHeight = 0,
          int minWidth = 0,
          int numberOfRetries = 5,
          int quality = 95,
          int rotate = 0,
        }) async {
          return null;
        };

        final result = await service.executeCompressionWorkflow(mockXFile);

        expect(result, isNull);
        verify(navigationService.pushDialog(argThat(isA<CustomProgressDialog>()))).called(1);
        verify(navigationService.pushDialog(argThat(isA<CustomAlertDialog>()))).called(1);
        verify(navigationService.pop()).called(1);
      });

      test('executeCompressionWorkflow - exception during compression', () async {
        final service = MultiMediaPickerService();
        final mockXFile = MockXFile();
        when(mockXFile.path).thenReturn('/test/image.jpg');
        when(mockXFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);

        service.compressImageFunction = (
          String sourcePath,
          String targetPath, {
          bool autoCorrectionAngle = true,
          CompressFormat format = CompressFormat.jpeg,
          int inSampleSize = 1,
          bool keepExif = false,
          int minHeight = 0,
          int minWidth = 0,
          int numberOfRetries = 5,
          int quality = 95,
          int rotate = 0,
        }) async {
          throw Exception('Compression error');
        };

        final result = await service.executeCompressionWorkflow(mockXFile);

        expect(result, isNull);
        verify(navigationService.pushDialog(argThat(isA<CustomProgressDialog>()))).called(1);
        verify(navigationService.pushDialog(argThat(isA<CustomAlertDialog>()))).called(1);
        verify(navigationService.pop()).called(1);
      });

      test('executeCompressionWorkflow - cropping returns null', () async {
        final service = MultiMediaPickerService();
        final mockXFile = MockXFile();
        when(mockXFile.path).thenReturn('/test/image.jpg');
        when(mockXFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);

        when(imageService.cropImage(imageFile: File('/test/compressed.jpg')))
            .thenAnswer((_) async => null);

        service.compressImageFunction = (
          String sourcePath,
          String targetPath, {
          bool autoCorrectionAngle = true,
          CompressFormat format = CompressFormat.jpeg,
          int inSampleSize = 1,
          bool keepExif = false,
          int minHeight = 0,
          int minWidth = 0,
          int numberOfRetries = 5,
          int quality = 95,
          int rotate = 0,
        }) async {
          await File(targetPath).writeAsBytes(List.filled(3 * 1024 * 1024, 0));
          return XFile('/test/compressed.jpg');
        };

        final result = await service.executeCompressionWorkflow(mockXFile);

        expect(result, isNull);
        verify(navigationService.pushDialog(argThat(isA<CustomProgressDialog>()))).called(1);
        verify(navigationService.pop()).called(1);
        verify(imageService.cropImage(imageFile: File('/test/compressed.jpg'))).called(1);
      });

      test('getPhotoFromGallery - large image triggers compression workflow', () async {
        final mockPicker = imagePicker;
        final service = MultiMediaPickerService();
        const path = '/test/large_image.jpg';
        final image = MockXFile();
        when(image.path).thenReturn(path);
        when(image.length()).thenAnswer((_) async => 10 * 1024 * 1024);

        when(mockPicker.pickImage(source: ImageSource.gallery))
            .thenAnswer((_) async => image);

        final mockCroppedFile = File('/test/final_cropped.jpg');
        when(imageService.cropImage(imageFile: File('/test/compressed_large.jpg')))
            .thenAnswer((_) async => mockCroppedFile);

        service.compressImageFunction = (
          String sourcePath,
          String targetPath, {
          bool autoCorrectionAngle = true,
          CompressFormat format = CompressFormat.jpeg,
          int inSampleSize = 1,
          bool keepExif = false,
          int minHeight = 0,
          int minWidth = 0,
          int numberOfRetries = 5,
          int quality = 95,
          int rotate = 0,
        }) async {
          await File(targetPath).writeAsBytes(List.filled(3 * 1024 * 1024, 0));
          return XFile('/test/compressed_large.jpg');
        };

        final completer = Completer<File?>();
        
        when(navigationService.pushDialog(argThat(isA<CustomAlertDialog>())))
            .thenAnswer((_) async {
          // Simulate user clicking OK on the dialog
          await Future.delayed(Duration.zero);
          final result = await service.executeCompressionWorkflow(image);
          completer.complete(result);
        });

        final result = await service.getPhotoFromGallery(camera: false);

        expect(result, equals(mockCroppedFile));
        verify(navigationService.pushDialog(argThat(isA<CustomAlertDialog>()))).called(1);
      });

      test('compressUntilSize - handles cleanup on exception', () async {
        final service = TestableMultiMediaPickerService();
        final mockXFile = MockXFile();
        when(mockXFile.path).thenReturn('/test/image.jpg');
        when(mockXFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);

        final createdFiles = <String>[];

        service.setupMockCompression((
          sourcePath,
          targetPath, {
          bool? autoCorrectionAngle,
          CompressFormat? format,
          int? inSampleSize,
          bool? keepExif,
          int? minHeight,
          int? minWidth,
          int? numberOfRetries,
          int? quality,
          int? rotate,
        }) async {
          createdFiles.add(targetPath);
          await File(targetPath).writeAsBytes(List.filled(1024, 0));
          
          if (createdFiles.length > 2) {
            throw Exception('Compression error');
          }
          
          return XFile(targetPath);
        });

        expect(() => service.compressUntilSize(mockXFile), throwsA(isA<Exception>()));
      });

      test('compressUntilSize - binary search edge cases', () async {
        final service = TestableMultiMediaPickerService();
        final mockXFile = MockXFile();
        when(mockXFile.path).thenReturn('/test/image.jpg');
        when(mockXFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);

        final qualitiesUsed = <int>[];

        service.setupMockCompression((
          sourcePath,
          targetPath, {
          bool? autoCorrectionAngle,
          CompressFormat? format,
          int? inSampleSize,
          bool? keepExif,
          int? minHeight,
          int? minWidth,
          int? numberOfRetries,
          int? quality,
          int? rotate,
        }) async {
          qualitiesUsed.add(quality!);
          
          final fileSize = quality == 10 ? 4 * 1024 * 1024 : 7 * 1024 * 1024;
          
          await File(targetPath).writeAsBytes(List.filled(fileSize, 0));
          return XFile(targetPath);
        });

        final result = await service.compressUntilSize(mockXFile);

        expect(result, isNotNull);
        expect(qualitiesUsed, contains(10));
        expect(await result!.length(), lessThanOrEqualTo(service.maxImageSizeAllowed));
      });

      test('compressUntilSize - no acceptable quality found', () async {
        final service = TestableMultiMediaPickerService();
        final mockXFile = MockXFile();
        when(mockXFile.path).thenReturn('/test/image.jpg');
        when(mockXFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);

        service.setupMockCompression((
          sourcePath,
          targetPath, {
          bool? autoCorrectionAngle,
          CompressFormat? format,
          int? inSampleSize,
          bool? keepExif,
          int? minHeight,
          int? minWidth,
          int? numberOfRetries,
          int? quality,
          int? rotate,
        }) async {
          await File(targetPath).writeAsBytes(List.filled(7 * 1024 * 1024, 0));
          return XFile(targetPath);
        });

        final result = await service.compressUntilSize(mockXFile);

        expect(result, isNull);
        expect(service.compressionAttempts, greaterThan(0));
      });

      test('getImageFormatInfo - case insensitive extension handling', () {
        final service = MultiMediaPickerService();

        final mixedCaseResults = [
          service.getImageFormatInfo('/path/IMAGE.PNG'),
          service.getImageFormatInfo('/path/image.PNG'),
          service.getImageFormatInfo('/path/IMAGE.png'),
          service.getImageFormatInfo('/path/Image.Png'),
        ];

        for (final result in mixedCaseResults) {
          expect(result['format'], equals(CompressFormat.png));
          expect(result['extension'], equals('png'));
        }
      });

      test('getImageFormatInfo - path with multiple extensions', () {
        final service = MultiMediaPickerService();

        final result = service.getImageFormatInfo('/path/file.backup.old.png');
        expect(result['format'], equals(CompressFormat.png));
        expect(result['extension'], equals('png'));

        final result2 = service.getImageFormatInfo('/complex.path/my.file.name.jpeg');
        expect(result2['format'], equals(CompressFormat.jpeg));
        expect(result2['extension'], equals('jpg'));
      });

      test('fileStream - verify broadcast stream behavior', () async {
        final service = MultiMediaPickerService();
        final stream1 = service.fileStream;
        final stream2 = service.fileStream;

        expect(stream1, equals(stream2));
        expect(stream1.isBroadcast, isTrue);
      });

      test('getPhotoFromGallery - exception handling for non-camera errors', () async {
        final mockPicker = imagePicker;
        final model = MultiMediaPickerService();
        final printed = <String>[];

        final error = Exception('Network error');
        when(mockPicker.pickImage(source: ImageSource.gallery)).thenThrow(error);
        
        final result = await runZoned(
          () async => await model.getPhotoFromGallery(camera: false),
          zoneSpecification: ZoneSpecification(
            print: (self, parent, zone, line) {
              printed.add(line);
            },
          ),
        );

        expect(result, isNull);
        expect(
          printed[0],
          "MultiMediaPickerService : Exception occurred while choosing photo from the gallery $error",
        );
      });

      test('compressUntilSize - preserves file extension in temporary files', () async {
        final service = TestableMultiMediaPickerService();
        final mockXFile = MockXFile();
        when(mockXFile.path).thenReturn('/test/image.webp');
        when(mockXFile.length()).thenAnswer((_) async => 10 * 1024 * 1024);

        final createdPaths = <String>[];

        service.setupMockCompression((
          sourcePath,
          targetPath, {
          bool? autoCorrectionAngle,
          CompressFormat? format,
          int? inSampleSize,
          bool? keepExif,
          int? minHeight,
          int? minWidth,
          int? numberOfRetries,
          int? quality,
          int? rotate,
        }) async {
          createdPaths.add(targetPath);
          await File(targetPath).writeAsBytes(List.filled(3 * 1024 * 1024, 0));
          return XFile(targetPath);
        });

        await service.compressUntilSize(mockXFile);

        expect(createdPaths.isNotEmpty, isTrue);
        for (final path in createdPaths) {
          expect(path.endsWith('.webp'), isTrue);
        }
      });

      test('compressionFailedDialog - dialog properties', () {
        final service = MultiMediaPickerService();
        final dialog = service.compressionFailedDialog();

        expect(dialog.dialogTitle, equals('Compression Failed'));
        expect(
          dialog.dialogSubTitle,
          equals('Unable to compress the image below the size limit. Try again with a smaller image.'),
        );
        expect(dialog.successText, equals('OK'));
      });

      test('permissionDeniedDialog - dialog properties', () {
        final service = MultiMediaPickerService();
        final dialog = service.permissionDeniedDialog();

        expect(dialog.dialogTitle, equals('Permission Denied'));
        expect(dialog.successText, equals('SETTINGS'));
        expect(
          dialog.dialogSubTitle,
          equals('Camera permission is required, to use this feature, give permission from app settings'),
        );
      });

      test('fileSizeExceededDialog - dialog properties', () {
        final service = MultiMediaPickerService();
        bool callbackCalled = false;
        
        final dialog = service.fileSizeExceededDialog(() {
          callbackCalled = true;
        });

        expect(dialog.dialogTitle, equals('File Size Exceeded'));
        expect(dialog.dialogSubTitle, equals('Do you want to compress the file?'));
        expect(dialog.successText, equals('OK'));
        
        dialog.success!();
        expect(callbackCalled, isTrue);
      });
