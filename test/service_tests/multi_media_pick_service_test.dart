// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/utils/app_localization.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';
import '../helpers/test_locator.dart';

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

    test("test get fileStream", () {
      final model = MultiMediaPickerService();
      expect(
        model.fileStream.toString(),
        "Instance of '_AsBroadcastStream<File>'",
      );
    });
  });
}
