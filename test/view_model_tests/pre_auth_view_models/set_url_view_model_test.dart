// ignore_for_file: talawa_api_doc

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/set_url_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';

/// This is a TestWidget class.
class TestWidget extends StatelessWidget {
  const TestWidget(this.model, {Key? key}) : super(key: key);

  /// State.
  final SetUrlViewModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingActionButton(
        onPressed: () => model.scanQR(context),
      ),
    );
  }
}

/// This is a class for mock url for testing.
class SetUrlMock extends StatelessWidget {
  const SetUrlMock({required this.formKey, Key? key}) : super(key: key);

  /// formKey.
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Form(
        key: formKey,
        child: Container(),
      ),
      navigatorKey: navigationService.navigatorKey,
    );
  }
}

/// This is a class for mock url for testing.
///
/// **params**:
/// * `themeMode`: dark
///
/// **returns**:
/// * `Widget`: widget

Widget forTest({ThemeMode themeMode = ThemeMode.dark}) => BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        final model1 = SetUrlViewModel();
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          theme: TalawaTheme.darkTheme,
          home: FloatingActionButton(
            onPressed: () async {
              model1.initialise();
            },
          ),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
        );
      },
    );

Future<void> main() async {
  SizeConfig().test();

  Hive.init('test/fixtures/core');
  await Hive.openBox('url');

  late SetUrlViewModel model;

  setUp(() async {
    registerServices();
    registerViewModels();
    model = SetUrlViewModel();
  });
  tearDown(() async {
    unregisterViewModels();
  });

  group('SetUrlViewModel Test -', () {
    testWidgets(
        'Check if checkURLandNavigate() is working fine when urlPresent is true',
        (tester) async {
      locator.registerSingleton(Validator());

      await tester.pumpWidget(Form(key: model.formKey, child: Container()));

      await model.checkURLandNavigate('/', 'arguments');

      final captured = verify(
        (navigationService as MockNavigationService).pushDialog(captureAny),
      ).captured;
      expect(
        captured[0],
        isA<CustomProgressDialog>().having(
          (e) => e.key,
          'key',
          const Key('UrlCheckProgress'),
        ),
      );
      verify(navigationService.pop());
      verify(navigationService.pushScreen('/', arguments: 'arguments'));
      verify(graphqlConfig.getOrgUrl());

      final box = Hive.box('url');
      expect(box.get(SetUrlViewModel.urlKey), '');
      expect(box.get(SetUrlViewModel.imageUrlKey), '/talawa/');

      File('test/fixtures/core/url.hive').delete();
      File('test/fixtures/core/url.lock').delete();
    });
    testWidgets('Check if initialize is working fine ', (tester) async {
      final model = SetUrlViewModel();

      await tester.pumpWidget(SetUrlMock(formKey: model.formKey));

      model.initialise();
    });
    testWidgets('Check if initialize is working fine when we give url',
        (tester) async {
      final model = SetUrlViewModel();

      await tester.pumpWidget(SetUrlMock(formKey: model.formKey));

      model.initialise(inviteUrl: "http://www.youtube.com");
    });

    testWidgets(
        'Check if checkURLandNavigate() is working fine when urlPresent is false',
        (tester) async {
      await locator.unregister<Validator>();
      final service = MockValidator();

      locator.registerSingleton<Validator>(service);

      await tester.pumpWidget(Form(key: model.formKey, child: Container()));

      when(service.validateUrlExistence('')).thenAnswer((_) async => false);

      await model.checkURLandNavigate('/', 'arguments');

      verify(
        navigationService.showTalawaErrorSnackBar(
          "URL doesn't exist/no connection please check",
          MessageType.error,
        ),
      );

      locator.unregister<Validator>();
    });

    testWidgets(
        'Check if checkURLandShowPopUp() is working fine when urlPresent is true',
        (tester) async {
      locator.registerSingleton(Validator());

      await tester.pumpWidget(Form(key: model.formKey, child: Container()));

      await model.checkURLandShowPopUp('arguments');

      final captured = verify(
        (navigationService as MockNavigationService).pushDialog(captureAny),
      ).captured;
      expect(
        captured[0],
        isA<CustomProgressDialog>().having(
          (e) => e.key,
          'key',
          const Key('UrlCheckProgress'),
        ),
      );
      verify(navigationService.pop());
      verify(graphqlConfig.getOrgUrl());
      verify(navigationService.showSnackBar("Url is valid"));

      final box = Hive.box('url');
      expect(box.get(SetUrlViewModel.urlKey), '');
      expect(box.get(SetUrlViewModel.imageUrlKey), '/talawa/');

      File('test/fixtures/core/url.hive').delete();
      File('test/fixtures/core/url.lock').delete();
    });

    testWidgets(
        'Check if checkURLandShowPopUp() is working fine when urlPresent is false',
        (tester) async {
      //await locator.unregister<Validator>();
      final service = MockValidator();
      //locator.registerSingleton<Validator>(service);

      await tester.pumpWidget(Form(key: model.formKey, child: Container()));

      when(service.validateUrlExistence('')).thenAnswer((_) async => false);

      await model.checkURLandShowPopUp('arguments');

      verify(navigationService.pop());
      verifyNever(
        navigationService.showTalawaErrorSnackBar(
          "URL doesn't exist/no connection please check",
          MessageType.info,
        ),
      );
    });

    testWidgets('Check if scanQR() is working fine', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TestWidget(model)));

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(QRView), findsOneWidget);
    });

    testWidgets('Check if _onQRViewCreated() is working fine', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode('qr?orgId=1&scan', BarcodeFormat.qrcode, null);
      });

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);
    });

    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws CameraException',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode('qr?orgId=1&scan', BarcodeFormat.qrcode, null);
      });
      // when(controller.stopCamera())
      //     .thenThrow(Exception({"errorType": "error"}));

      when(controller.stopCamera())
          .thenThrow(CameraException("200", "cameraException"));
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws QrEmbeddedImageException',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode('qr?orgId=1&scan', BarcodeFormat.qrcode, null);
      });
      // when(controller.stopCamera())
      //     .thenThrow(Exception({"errorType": "error"}));

      when(controller.stopCamera())
          .thenThrow(QrEmbeddedImageException("error"));
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws QrUnsupportedVersionException',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode('qr?orgId=1&scan', BarcodeFormat.qrcode, null);
      });
      // when(controller.stopCamera())
      //     .thenThrow(Exception({"errorType": "error"}));

      when(controller.stopCamera()).thenThrow(QrUnsupportedVersionException(0));
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws Exception',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode('qr?orgId=1&scan', BarcodeFormat.qrcode, null);
      });
      // when(controller.stopCamera())
      //     .thenThrow(Exception({"errorType": "error"}));

      when(controller.stopCamera()).thenThrow(Exception(0));
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);
    });
  });
}
