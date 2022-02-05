import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/pre_auth_view_models/set_url_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';

Future<void> main() async {
  Hive.init('test/fixtures/core');
  await Hive.openBox('url');

  late SetUrlViewModel model;

  setUp(() async {
    registerServices();
    model = SetUrlViewModel();
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
  });
}
