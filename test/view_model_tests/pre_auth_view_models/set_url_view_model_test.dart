import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/pre_auth_view_models/set_url_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';

class TestWidget extends StatelessWidget {
  const TestWidget(this.model, {Key? key}) : super(key: key);
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

      final captured = verify((navigationService as MockNavigationService)
              .pushDialog(captureAny))
          .captured;
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

    testWidgets(
        'Check if checkURLandNavigate() is working fine when urlPresent is false',
        (tester) async {
      await locator.unregister<Validator>();
      final service = MockValidator();
      locator.registerSingleton<Validator>(service);

      await tester.pumpWidget(Form(key: model.formKey, child: Container()));

      when(service.validateUrlExistence('')).thenAnswer((_) async => false);

      await model.checkURLandNavigate('/', 'arguments');

      verify(navigationService
          .showSnackBar("URL doesn't exist/no connection please check"));
    });

    group("Check if scanQr() is working", () {
      testWidgets('Check if scanQR() is working fine in portrait mode',
          (tester) async {
        await tester.pumpWidget(MaterialApp(home: TestWidget(model)));
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pump();

        expect(find.byType(ClipRRect), findsOneWidget);
        expect(find.byType(QRView), findsOneWidget);
      });
      testWidgets("Check if scanQR() is working fine in landscape mode",
          (tester) async {
        await tester.pumpWidget(MaterialApp(home: TestWidget(model)));
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pump();

        expect(find.byType(ClipRRect), findsOneWidget);
        expect(find.byType(QRView), findsOneWidget);
      });
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

    testWidgets('Check if _onQRViewCreated() is working fine when throws',
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
      when(controller.stopCamera()).thenThrow(Exception());

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);
    });
  });
}
