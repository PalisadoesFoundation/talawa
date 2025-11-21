// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/image_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/utils/app_localization.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
  });

  setUp(() {
    registerServices();
    SizeConfig().test();
  });

  tearDown(() {
    unregisterServices();
  });
  group('MultiMediaPickerService test', () {
    test("test get photo from gallery method if camera option is false",
        () async {
      final mockPicker = imagePicker;
      final model = MultiMediaPickerService();
      const path = 'test';
      final image = XFile(path);
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

    test("test get photo from gallery method if camera option is true",
        () async {
      final mockPicker = locator<ImagePicker>();
      final model = MultiMediaPickerService();
      const path = 'test';
      final image = XFile(path);
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

    test("test no photo provided for the pick image", () async {
      final model = MultiMediaPickerService();
      final mockPicker = locator<ImagePicker>();
      when(mockPicker.pickImage(source: ImageSource.camera))
          .thenAnswer((realInvocation) async => null);
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

    test("test get fileStream", () {
      final model = MultiMediaPickerService();
      expect(
        model.fileStream.toString(),
        "Instance of '_AsBroadcastStream<File>'",
      );
    });
  });

  group('Image Format Detection Tests', () {
    test('should detect PNG format correctly', () {
      final service = MultiMediaPickerService();
      final result = service.getImageFormatInfo('test_image.png');

      expect(result['format'], equals(CompressFormat.png));
      expect(result['extension'], equals('png'));
    });

    test('should detect WEBP format correctly', () {
      final service = MultiMediaPickerService();
      final result = service.getImageFormatInfo('test_image.webp');

      expect(result['format'], equals(CompressFormat.webp));
      expect(result['extension'], equals('webp'));
    });

    test('should detect HEIC format correctly', () {
      final service = MultiMediaPickerService();
      final result = service.getImageFormatInfo('test_image.heic');

      expect(result['format'], equals(CompressFormat.heic));
      expect(result['extension'], equals('heic'));
    });

    test('should default to JPEG format for unknown extensions', () {
      final service = MultiMediaPickerService();
      final result = service.getImageFormatInfo('test_image.bmp');

      expect(result['format'], equals(CompressFormat.jpeg));
      expect(result['extension'], equals('jpg'));
    });

    test('should handle JPG extension correctly', () {
      final service = MultiMediaPickerService();
      final result = service.getImageFormatInfo('test_image.jpg');

      expect(result['format'], equals(CompressFormat.jpeg));
      expect(result['extension'], equals('jpg'));
    });

    test('should handle JPEG extension correctly', () {
      final service = MultiMediaPickerService();
      final result = service.getImageFormatInfo('test_image.jpeg');

      expect(result['format'], equals(CompressFormat.jpeg));
      expect(result['extension'], equals('jpg'));
    });

    test('should handle uppercase extensions', () {
      final service = MultiMediaPickerService();
      final result = service.getImageFormatInfo('test_image.PNG');

      expect(result['format'], equals(CompressFormat.png));
      expect(result['extension'], equals('png'));
    });

    test('should handle mixed case extensions', () {
      final service = MultiMediaPickerService();
      final result = service.getImageFormatInfo('test_image.WeBp');

      expect(result['format'], equals(CompressFormat.webp));
      expect(result['extension'], equals('webp'));
    });
  });

  group('Dialog Tests', () {
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

    testWidgets('Test for permission_denied_dialog UI elements',
        (tester) async {
      final service = MultiMediaPickerService();

      final Widget app = MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(body: service.permissionDeniedDialog()),
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      expect(find.text('Permission Denied'), findsOneWidget);
      expect(find.text('SETTINGS'), findsOneWidget);
      expect(
        find.textContaining('Camera permission is required'),
        findsOneWidget,
      );
    });

    testWidgets('Test for fileSizeExceededDialog UI elements', (tester) async {
      final service = MultiMediaPickerService();
      bool callbackCalled = false;

      final Widget app = MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: service.fileSizeExceededDialog(() {
            callbackCalled = true;
          }),
        ),
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      expect(find.text('File Size Exceeded'), findsOneWidget);
      expect(find.text('Do you want to compress the file?'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(callbackCalled, isTrue);
    });

    testWidgets('Test for compressionFailedDialog UI elements', (tester) async {
      final service = MultiMediaPickerService();

      final Widget app = MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(body: service.compressionFailedDialog()),
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      expect(find.text('Compression Failed'), findsOneWidget);
      expect(
        find.textContaining(
            'Unable to compress the image below the size limit'),
        findsOneWidget,
      );
      expect(find.text('OK'), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      verify(navigationService.pop()).called(1);
    });
  });

  group('Error Handling Tests', () {
    test('should handle general exception during photo picking', () {
      final mockPicker = locator<ImagePicker>();
      final model = MultiMediaPickerService();
      final printed = <String>[];

      final error = Exception('Test exception');
      when(mockPicker.pickImage(source: ImageSource.gallery)).thenThrow(error);

      runZoned(
        () async {
          final result = await model.getPhotoFromGallery(camera: false);
          expect(result, isNull);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            printed.add(line);
          },
        ),
      );
    });

    test('should handle PlatformException with different error code', () {
      final mockPicker = locator<ImagePicker>();
      final model = MultiMediaPickerService();
      final printed = <String>[];

      final error = PlatformException(code: 'other_error');
      when(mockPicker.pickImage(source: ImageSource.gallery)).thenThrow(error);

      runZoned(
        () async {
          final result = await model.getPhotoFromGallery(camera: false);
          expect(result, isNull);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            printed.add(line);
          },
        ),
      );
    });
  });

  group('Service Initialization Tests', () {
    test('should initialize file stream correctly', () {
      final service = MultiMediaPickerService();
      expect(service.fileStream, isNotNull);
      expect(service.fileStream, isA<Stream>());
    });

    test('should have correct max image size', () {
      final service = MultiMediaPickerService();
      expect(service.maxImageSizeAllowed, equals(5 * 1024 * 1024)); // 5 MB
    });
  });
}
