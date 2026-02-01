import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/router.dart';
import 'package:talawa/services/app_config_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_action_handler.dart';
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
  const TestWidget(this.model, {super.key});

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
  const SetUrlMock({required this.formKey, super.key});

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
            onPressed: () {
              model1.initialise();
            },
          ),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
        );
      },
    );
//
Future<void> main() async {
  SizeConfig().test();

  late SetUrlViewModel model;

  locator.registerSingleton<ActionHandlerService>(ActionHandlerService());

  setUp(() {
    registerServices();
    registerViewModels();
    model = SetUrlViewModel();
  });
  tearDown(() {
    unregisterViewModels();
  });

  group('SetUrlViewModel Test -', () {
    testWidgets(
        'Check if checkURLandNavigate() is working fine when urlPresent is true',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      final service = MockValidator();
      locator.registerSingleton<Validator>(service);

      await tester.pumpWidget(Form(key: model.formKey, child: Container()));

      // Set a non-empty URL to bypass the empty URL check
      model.url.text = 'https://example.com/graphql';
      when(service.validateUrlExistence('https://example.com/graphql'))
          .thenAnswer((_) async => true);

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
      expect(box.get(SetUrlViewModel.urlKey), 'https://example.com/graphql');
      expect(box.get(SetUrlViewModel.imageUrlKey),
          'https://example.com/graphql/talawa/');
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
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      final service = MockValidator();

      locator.registerSingleton<Validator>(service);

      await tester.pumpWidget(Form(key: model.formKey, child: Container()));

      model.url.text = 'https://invalid.com/graphql';
      when(service.validateUrlExistence('https://invalid.com/graphql'))
          .thenAnswer((_) async => false);

      await model.checkURLandNavigate('/', 'arguments');

      verify(
        navigationService.showTalawaErrorSnackBar(
          "URL doesn't exist/no connection please check",
          MessageType.error,
        ),
      );

      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
    });

    testWidgets('Check if checkURLandNavigate() shows error for empty URL',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      final service = MockValidator();
      locator.registerSingleton<Validator>(service);

      await tester.pumpWidget(Form(key: model.formKey, child: Container()));

      // Leave URL empty
      model.url.text = '';

      await model.checkURLandNavigate('/', 'arguments');

      verify(
        navigationService.showTalawaErrorSnackBar(
          "URL cannot be empty",
          MessageType.error,
        ),
      );
      verify(navigationService.pop());
    });

    testWidgets(
        'Check if checkURLandShowPopUp() is working fine when urlPresent is true',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      final service = MockValidator();
      locator.registerSingleton<Validator>(service);

      await tester.pumpWidget(Form(key: model.formKey, child: Container()));

      model.url.text = 'https://example.com/graphql';
      when(service.validateUrlExistence('https://example.com/graphql'))
          .thenAnswer((_) async => true);

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
      expect(box.get(SetUrlViewModel.urlKey), 'https://example.com/graphql');
      expect(box.get(SetUrlViewModel.imageUrlKey),
          'https://example.com/graphql/talawa/');
    });

    testWidgets(
        'Check if checkURLandShowPopUp() is working fine when urlPresent is false',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      final service = MockValidator();
      locator.registerSingleton<Validator>(service);

      await tester.pumpWidget(Form(key: model.formKey, child: Container()));

      model.url.text = 'https://invalid.com/graphql';
      when(service.validateUrlExistence('https://invalid.com/graphql'))
          .thenAnswer((_) async => false);

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
      verify(
        navigationService.showTalawaErrorDialog(
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
        'Check if _onQRViewCreated() handles QR code missing organization info - no question mark',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode('invalidqrcode', BarcodeFormat.qrcode, null);
      });

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);

      // Wait for stream to process
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      // Should show error for missing organization info (no ? means data.length < 2)
      verify(
        navigationService.showTalawaErrorSnackBar(
          "QR code missing organization information",
          MessageType.error,
        ),
      );
    });

    testWidgets('Check if _onQRViewCreated() handles QR code with empty URL',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode('?orgId=1&scan', BarcodeFormat.qrcode, null);
      });

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);

      // Wait for stream to process
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      verify(
        navigationService.showTalawaErrorSnackBar(
          "Invalid QR code format",
          MessageType.error,
        ),
      );
    });

    testWidgets(
        'Check if _onQRViewCreated() handles QR code missing organization info',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode(
          'https://example.com/graphql',
          BarcodeFormat.qrcode,
          null,
        );
      });

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);

      // Wait for stream to process
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      verify(
        navigationService.showTalawaErrorSnackBar(
          "QR code missing organization information",
          MessageType.error,
        ),
      );
    });

    testWidgets(
        'Check if _onQRViewCreated() handles invalid organization format',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode(
          'https://example.com/graphql?invalidformat',
          BarcodeFormat.qrcode,
          null,
        );
      });

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);

      // Wait for stream to process
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      verify(
        navigationService.showTalawaErrorSnackBar(
          "Invalid QR code organization format",
          MessageType.error,
        ),
      );
    });

    testWidgets('Check if _onQRViewCreated() handles invalid organization ID',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode(
          'https://example.com/graphql?orgId=',
          BarcodeFormat.qrcode,
          null,
        );
      });

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);

      // Wait for stream to process
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      verify(
        navigationService.showTalawaErrorSnackBar(
          "Invalid organization ID in QR code",
          MessageType.error,
        ),
      );
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

    testWidgets('Check if navigateToDemo() works correctly', (tester) async {
      // 1. Mock AppConfigService
      final mockAppConfigService = MockAppConfigService();
      // Register it
      if (locator.isRegistered<AppConfigService>()) {
        locator.unregister<AppConfigService>();
      }
      locator.registerSingleton<AppConfigService>(mockAppConfigService);

      // 2. Call the method
      model.navigateToDemo();

      // 3. Verify side effects
      // Verify isDemoMode set to true
      expect(mockAppConfigService.isDemoMode, true);

      // Verify navigation
      verify(navigationService.removeAllAndPush(
        Routes.mainScreen,
        Routes.splashScreen,
        arguments: MainScreenArgs(
          mainScreenIndex: 0,
          fromSignUp: false,
          toggleDemoMode: true,
        ),
      ));
    });
  });
}

class MockAppConfigService extends Mock implements AppConfigService {
  @override
  bool isDemoMode = false;
}
