// ignore_for_file: talawa_api_doc

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart';
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
  const TestWidget(this.model, this.controller, {super.key});

  /// State.
  final SetUrlViewModel model;

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingActionButton(
        onPressed: () => model.scanQR(context, mockController: controller),
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
            onPressed: () async {
              model1.initialise();
            },
          ),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
        );
      },
    );

Widget testMobileScannerForError(MobileScannerController controller) {
  return MaterialApp(
    home: Scaffold(
      body: SizedBox(
        height: 250,
        width: 250,
        child: MobileScanner(
          controller: controller,
          errorBuilder: (ctx, error, _) {
            String errorMsg = '';
            switch (error.errorCode) {
              case MobileScannerErrorCode.controllerDisposed:
                errorMsg = 'Camera is disposed';
                break;
              case MobileScannerErrorCode.controllerAlreadyInitialized:
                errorMsg = 'Camera is already in use';
                break;
              case MobileScannerErrorCode.controllerUninitialized:
                errorMsg = 'Camera is not ready';
                break;
              case MobileScannerErrorCode.permissionDenied:
                errorMsg = 'Please provide camera permission to scan QR code';
                break;
              case MobileScannerErrorCode.unsupported:
                errorMsg = 'This device does not support scanning';
                break;
              case MobileScannerErrorCode.genericError:
                errorMsg = 'Something went wrong while detecting the QR';
                break;
              default:
                errorMsg = 'An unknown error occurred';
            }
            return Center(child: Text(errorMsg));
          },
        ),
      ),
    ),
  );
}

Future<void> main() async {
  SizeConfig().test();

  late SetUrlViewModel model;
  late MockMobileScannerController controller;

  locator.registerSingleton<ActionHandlerService>(ActionHandlerService());

  setUp(() async {
    registerServices();
    registerViewModels();
    model = SetUrlViewModel();
    controller = MockMobileScannerController();
  });
  tearDown(() async {
    unregisterViewModels();
  });

  group('Testing the qr functionality', () {
    testWidgets('MobileScanner widget renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MobileScanner(
              controller: MobileScannerController(),
              onDetect: (barcode) {},
            ),
          ),
        ),
      );

      // Verify that the MobileScanner widget is rendered
      expect(find.byType(MobileScanner), findsOneWidget);
    });

    testWidgets('onDetect callback is triggered when a barcode is detected',
        (WidgetTester tester) async {
      bool isDetected = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MobileScanner(
              controller: MobileScannerController(),
              onDetect: (barcode) {
                isDetected = true; // Set flag to true when barcode is detected
              },
            ),
          ),
        ),
      );

      // Simulate a barcode detection event
      const barcode = BarcodeCapture(
        barcodes: [Barcode(displayValue: 'test', format: BarcodeFormat.qrCode)],
      );
      (find.byType(MobileScanner).evaluate().single.widget as MobileScanner)
          .onDetect
          ?.call(barcode);

      // Verify that the callback was triggered
      expect(isDetected, true);
    });

    testWidgets('UI updates when a barcode is detected',
        (WidgetTester tester) async {
      // String? detectedBarcode;

      await tester.pumpWidget(
        MaterialApp(
          home: BarcodeScannerTestWidget(),
        ),
      );

      const barcode = BarcodeCapture(
        barcodes: [
          Barcode(displayValue: '123456', format: BarcodeFormat.code128),
        ],
      );
      (find.byType(MobileScanner).evaluate().single.widget as MobileScanner)
          .onDetect
          ?.call(barcode);

      // Rebuild the widget to reflect the updated state
      await tester.pump();

      // Verify that the UI updates with the detected barcode
      expect(find.text('Detected: 123456'), findsOneWidget);
    });

    testWidgets('UI updates for multiple barcode detections',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BarcodeScannerTestWidget(),
        ),
      );

      // Simulate the first barcode detection event
      const firstBarcode = BarcodeCapture(
        barcodes: [
          Barcode(displayValue: '123456', format: BarcodeFormat.code128),
        ],
      );
      (find.byType(MobileScanner).evaluate().single.widget as MobileScanner)
          .onDetect
          ?.call(firstBarcode);

      // Rebuild the widget to reflect the updated state
      await tester.pump();

      // Verify that the UI updates with the first detected barcode
      expect(find.text('Detected: 123456'), findsOneWidget);

      // Simulate the second barcode detection event
      const secondBarcode = BarcodeCapture(
        barcodes: [
          Barcode(displayValue: '789012', format: BarcodeFormat.code128),
        ],
      );
      (find.byType(MobileScanner).evaluate().single.widget as MobileScanner)
          .onDetect
          ?.call(secondBarcode);

      // Rebuild the widget to reflect the updated state
      await tester.pump();

      // Verify that the UI updates with the second detected barcode
      expect(find.text('Detected: 789012'), findsOneWidget);
    });

    testWidgets('errorBuilder displays correct message for controllerDisposed',
        (WidgetTester tester) async {
      final controller = MockMobileScannerController();

      when(controller.value).thenReturn(
        const MobileScannerState(
          isInitialized: true,
          // hasCameraPermission: true,
          size: Size(250, 250),
          availableCameras: 0,
          cameraDirection: CameraFacing.back,
          isRunning: true,
          torchState: TorchState.off,
          zoomScale: 0.0,
          error: MobileScannerException(
            errorCode: MobileScannerErrorCode.controllerDisposed,
          ),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MobileScanner(
              controller: controller,
              onDetect: (barcode) {},
              errorBuilder: (context, error, child) {
                final errorMsg = model.onDetectError(error);
                return Text('Error: $errorMsg');
              },
            ),
          ),
        ),
      );

      // await controller.start();

      // Wait for the widget to fully initialize and handle the error
      await tester.pumpAndSettle();

      // Verify that the correct error message is displayed
      expect(find.text('Error: Camera is disposed'), findsOneWidget);
    });

    testWidgets('errorBuilder displays correct message for permissionDenied',
        (WidgetTester tester) async {
      final controller = MockMobileScannerController();

      when(controller.value).thenReturn(
        const MobileScannerState(
          isInitialized: true,
          // hasCameraPermission: true,
          size: Size(250, 250),
          availableCameras: 0,
          cameraDirection: CameraFacing.back,
          isRunning: true,
          torchState: TorchState.off,
          zoomScale: 0.0,
          error: MobileScannerException(
            errorCode: MobileScannerErrorCode.permissionDenied,
          ),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MobileScanner(
              controller: controller,
              onDetect: (barcode) {},
              errorBuilder: (context, error, child) {
                final errorMsg = model.onDetectError(error);
                return Text('Error: $errorMsg');
              },
            ),
          ),
        ),
      );

      // await controller.start();

      // Wait for the widget to fully initialize and handle the error
      await tester.pumpAndSettle();

      // Verify that the correct error message is displayed
      expect(
        find.text('Error: Please provide camera permission to scan QR code'),
        findsOneWidget,
      );
    });

    testWidgets('errorBuilder displays correct message for unsupported',
        (WidgetTester tester) async {
      final controller = MockMobileScannerController();

      when(controller.value).thenReturn(
        const MobileScannerState(
          isInitialized: true,
          // hasCameraPermission: true,
          size: Size(250, 250),
          availableCameras: 0,
          cameraDirection: CameraFacing.back,
          isRunning: true,
          torchState: TorchState.off,
          zoomScale: 0.0,
          error: MobileScannerException(
            errorCode: MobileScannerErrorCode.unsupported,
          ),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MobileScanner(
              controller: controller,
              onDetect: (barcode) {},
              errorBuilder: (context, error, child) {
                final errorMsg = model.onDetectError(error);
                return Text('Error: $errorMsg');
              },
            ),
          ),
        ),
      );

      // await controller.start();

      // Wait for the widget to fully initialize and handle the error
      await tester.pumpAndSettle();

      // Verify that the correct error message is displayed
      expect(
        find.text('Error: This device does not support scanning'),
        findsOneWidget,
      );
    });

    testWidgets('errorBuilder displays correct message for generic error',
        (WidgetTester tester) async {
      final controller = MockMobileScannerController();

      when(controller.value).thenReturn(
        const MobileScannerState(
          isInitialized: true,
          // hasCameraPermission: true,
          size: Size(250, 250),
          availableCameras: 0,
          cameraDirection: CameraFacing.back,
          isRunning: true,
          torchState: TorchState.off,
          zoomScale: 0.0,
          error: MobileScannerException(
            errorCode: MobileScannerErrorCode.genericError,
          ),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MobileScanner(
              controller: controller,
              onDetect: (barcode) {},
              errorBuilder: (context, error, child) {
                final errorMsg = model.onDetectError(error);
                return Text('Error: $errorMsg');
              },
            ),
          ),
        ),
      );

      // await controller.start();

      // Wait for the widget to fully initialize and handle the error
      await tester.pumpAndSettle();

      // Verify that the correct error message is displayed
      expect(
        find.text('Error: Something went wrong while detecting the QR'),
        findsOneWidget,
      );
    });

    testWidgets('errorBuilder displays correct message for camera already use',
        (WidgetTester tester) async {
      final controller = MockMobileScannerController();

      when(controller.value).thenReturn(
        const MobileScannerState(
          isInitialized: true,
          // hasCameraPermission: true,
          size: Size(250, 250),
          availableCameras: 0,
          cameraDirection: CameraFacing.back,
          isRunning: true,
          torchState: TorchState.off,
          zoomScale: 0.0,
          error: MobileScannerException(
            errorCode: MobileScannerErrorCode.controllerAlreadyInitialized,
          ),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MobileScanner(
              controller: controller,
              onDetect: (barcode) {},
              errorBuilder: (context, error, child) {
                final errorMsg = model.onDetectError(error);
                return Text('Error: $errorMsg');
              },
            ),
          ),
        ),
      );

      // await controller.start();

      // Wait for the widget to fully initialize and handle the error
      await tester.pumpAndSettle();

      // Verify that the correct error message is displayed
      expect(
        find.text('Error: Camera is already in use'),
        findsOneWidget,
      );
    });
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
    });

    testWidgets(
        'Check if checkURLandShowPopUp() is working fine when urlPresent is false',
        (tester) async {
      // await locator.unregister<Validator>();
      final service = MockValidator();
      // locator.registerSingleton<Validator>(service);

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
      await tester.pumpWidget(MaterialApp(home: TestWidget(model, controller)));

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(MobileScanner), findsOneWidget);
    });

    testWidgets('Check if _onQRViewCreated() is working fine', (tester) async {
      final controller = MockMobileScannerController();
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model, controller),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      when(controller.barcodes).thenAnswer(
        (_) => Stream.fromIterable([
          const BarcodeCapture(
            barcodes: [
              Barcode(
                displayValue: 'qr?orgId=1&scan',
                format: BarcodeFormat.qrCode,
              ),
            ],
          ),
        ]),
      );

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(MobileScanner), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      (tester.widget(find.byType(MobileScanner)) as MobileScanner)
          .controller!
          .start();

      // Add verification for expected UI changes after QR code detection
      expect(find.text('Scan QR'), findsOneWidget);
    });

    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws MobileScannerException',
        (tester) async {
      final controller = MockMobileScannerController();
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model, controller),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      when(controller.barcodes).thenAnswer(
        (_) => Stream.fromIterable([
          const BarcodeCapture(
            barcodes: [
              Barcode(
                displayValue: 'qr?orgId=1&scan',
                format: BarcodeFormat.qrCode,
              ),
            ],
          ),
        ]),
      );

      when(controller.stop()).thenThrow(
        const MobileScannerException(
          errorCode: MobileScannerErrorCode.controllerAlreadyInitialized,
          errorDetails: MobileScannerErrorDetails(
            message: 'The camera is already in use',
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(MobileScanner), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      (tester.widget(find.byType(MobileScanner)) as MobileScanner)
          .controller!
          .start();
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws MobileScannerException',
        (tester) async {
      final controller = MockMobileScannerController();
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model, controller),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      when(controller.barcodes).thenAnswer(
        (_) => Stream.fromIterable([
          const BarcodeCapture(
            barcodes: [
              Barcode(
                displayValue: 'qr?orgId=1&scan',
                format: BarcodeFormat.qrCode,
              ),
            ],
          ),
        ]),
      );

      when(controller.stop()).thenThrow(
        const MobileScannerException(
          errorCode: MobileScannerErrorCode.permissionDenied,
          errorDetails: MobileScannerErrorDetails(
            message: 'Please provide camera permission to scan QR code',
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(MobileScanner), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      (tester.widget(find.byType(MobileScanner)) as MobileScanner)
          .controller!
          .start();
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws MobileScannerException',
        (tester) async {
      final controller = MockMobileScannerController();
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model, controller),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      when(controller.barcodes).thenAnswer(
        (_) => Stream.fromIterable([
          const BarcodeCapture(
            barcodes: [
              Barcode(
                displayValue: 'qr?orgId=1&scan',
                format: BarcodeFormat.qrCode,
              ),
            ],
          ),
        ]),
      );

      when(controller.stop()).thenThrow(
        const MobileScannerException(
          errorCode: MobileScannerErrorCode.controllerDisposed,
          errorDetails: MobileScannerErrorDetails(
            message: 'Camera is disposed',
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(MobileScanner), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      (tester.widget(find.byType(MobileScanner)) as MobileScanner)
          .controller!
          .start();
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws MobileScannerException',
        (tester) async {
      final controller = MockMobileScannerController();
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model, controller),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      when(controller.barcodes).thenAnswer(
        (_) => Stream.fromIterable([
          const BarcodeCapture(
            barcodes: [
              Barcode(
                displayValue: 'qr?orgId=1&scan',
                format: BarcodeFormat.qrCode,
              ),
            ],
          ),
        ]),
      );

      when(controller.stop()).thenThrow(
        const MobileScannerException(
          errorCode: MobileScannerErrorCode.controllerAlreadyInitialized,
          errorDetails: MobileScannerErrorDetails(
            message: 'Camera is already in use',
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(MobileScanner), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      (tester.widget(find.byType(MobileScanner)) as MobileScanner)
          .controller!
          .start();
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws MobileScannerException',
        (tester) async {
      final controller = MockMobileScannerController();
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model, controller),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      when(controller.barcodes).thenAnswer(
        (_) => Stream.fromIterable([
          const BarcodeCapture(
            barcodes: [
              Barcode(
                displayValue: 'qr?orgId=1&scan',
                format: BarcodeFormat.qrCode,
              ),
            ],
          ),
        ]),
      );

      when(controller.stop()).thenThrow(
        const MobileScannerException(
          errorCode: MobileScannerErrorCode.unsupported,
          errorDetails: MobileScannerErrorDetails(
            message: 'This device does not support scanning',
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(MobileScanner), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      (tester.widget(find.byType(MobileScanner)) as MobileScanner)
          .controller!
          .start();
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws MobileScannerException',
        (tester) async {
      final controller = MockMobileScannerController();
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model, controller),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      when(controller.barcodes).thenAnswer(
        (_) => Stream.fromIterable([
          const BarcodeCapture(
            barcodes: [
              Barcode(
                displayValue: 'qr?orgId=1&scan',
                format: BarcodeFormat.qrCode,
              ),
            ],
          ),
        ]),
      );

      when(controller.stop()).thenThrow(
        const MobileScannerException(
          errorCode: MobileScannerErrorCode.genericError,
          errorDetails: MobileScannerErrorDetails(
            message: "Something went wrong while detecting the QR",
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(MobileScanner), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      (tester.widget(find.byType(MobileScanner)) as MobileScanner)
          .controller!
          .start();
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws QrEmbeddedImageException',
        (tester) async {
      final controller = MockMobileScannerController();
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model, controller),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      when(controller.barcodes).thenAnswer(
        (_) => Stream.fromIterable([
          const BarcodeCapture(
            barcodes: [
              Barcode(
                displayValue: 'qr?orgId=1&scan',
                format: BarcodeFormat.qrCode,
              ),
            ],
          ),
        ]),
      );

      when(controller.stop()).thenThrow(QrEmbeddedImageException("error"));

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(MobileScanner), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      (tester.widget(find.byType(MobileScanner)) as MobileScanner)
          .controller!
          .start();
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws QrUnsupportedVersionException',
        (tester) async {
      final controller = MockMobileScannerController();
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model, controller),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      when(controller.barcodes).thenAnswer(
        (_) => Stream.fromIterable([
          const BarcodeCapture(
            barcodes: [
              Barcode(
                displayValue: 'qr?orgId=1&scan',
                format: BarcodeFormat.qrCode,
              ),
            ],
          ),
        ]),
      );

      when(controller.stop()).thenThrow(QrUnsupportedVersionException(0));

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(MobileScanner), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      (tester.widget(find.byType(MobileScanner)) as MobileScanner)
          .controller!
          .start();
    });
    testWidgets(
        'Check if _onQRViewCreated() is working fine when throws Exception',
        (tester) async {
      final controller = MockMobileScannerController();
      await tester.pumpWidget(
        MaterialApp(
          home: TestWidget(model, controller),
          navigatorKey: navigationService.navigatorKey,
        ),
      );

      when(controller.barcodes).thenAnswer(
        (_) => Stream.fromIterable([
          const BarcodeCapture(
            barcodes: [
              Barcode(
                displayValue: 'qr?orgId=1&scan',
                format: BarcodeFormat.qrCode,
              ),
            ],
          ),
        ]),
      );

      when(controller.stop()).thenThrow(Exception(0));
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(MobileScanner), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      (tester.widget(find.byType(MobileScanner)) as MobileScanner)
          .controller!
          .start();
    });
  });
}

class BarcodeScannerTestWidget extends StatefulWidget {
  @override
  _BarcodeScannerTestWidgetState createState() =>
      _BarcodeScannerTestWidgetState();
}

class _BarcodeScannerTestWidgetState extends State<BarcodeScannerTestWidget> {
  String? detectedBarcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MobileScanner(
            controller: MobileScannerController(),
            onDetect: (barcode) {
              setState(() {
                detectedBarcode = barcode
                    .barcodes.first.displayValue; // Update the detected barcode
              });
            },
          ),
          if (detectedBarcode != null) Text('Detected: $detectedBarcode'),
        ],
      ),
    );
  }
}

class BarcodeScannerErrorTestWidget extends StatefulWidget {
  @override
  _BarcodeScannerErrorTestWidgetState createState() =>
      _BarcodeScannerErrorTestWidgetState();
}

class _BarcodeScannerErrorTestWidgetState
    extends State<BarcodeScannerErrorTestWidget> {
  String? errorMessage;

  String _onDetectError(Object error) {
    String errorMsg = 'An unknown error occurred';

    if (error is MobileScannerException) {
      debugPrint(error.errorCode.toString());
      switch (error.errorCode) {
        case MobileScannerErrorCode.controllerDisposed:
          errorMsg = 'Camera is disposed';
          break;
        case MobileScannerErrorCode.controllerAlreadyInitialized:
          errorMsg = 'Camera is already in use';
          break;
        case MobileScannerErrorCode.controllerUninitialized:
          errorMsg = 'Camera is not ready';
          break;
        case MobileScannerErrorCode.permissionDenied:
          errorMsg = 'Please provide camera permission to scan QR code';
          break;
        case MobileScannerErrorCode.unsupported:
          errorMsg = 'This device does not support scanning';
          break;
        case MobileScannerErrorCode.genericError:
          errorMsg = 'Something went wrong while detecting the QR';
          break;
        default:
          errorMsg = 'An unknown error occurred';
      }
    }
    return errorMsg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MobileScanner(
            controller: MobileScannerController(),
            onDetect: (barcode) {},
            errorBuilder: (context, error, child) {
              final errorMsg = _onDetectError(error);
              return Text('Error: $errorMsg');
            },
          ),
        ],
      ),
    );
  }
}
