// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/pre_auth_view_models/set_url_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';
import '../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    testSetupLocator();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('SetUrlViewModel Tests', () {
    testWidgets('initialise sets greeting and url', (tester) async {
      final model = SetUrlViewModel();

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              model.initialise(context, inviteUrl: 'https://test.com');
              return Container();
            },
          ),
        ),
      );

      expect(model.url.text, 'https://test.com');
      expect(model.greeting, isNotEmpty);
      expect(model.greeting.length, greaterThan(0));

      // Verify greeting contains expected text segments
      final greetingText =
          model.greeting.map((segment) => segment['text'] as String).join('');
      expect(greetingText, contains('Join'));
      expect(greetingText, contains('Collaborate'));
      expect(greetingText, contains('Organizations'));
    });

    testWidgets('checkURLandNavigate shows error for invalid URL',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        locator.unregister<Validator>();
      }
      final validator = MockValidator();
      locator.registerSingleton<Validator>(validator);

      final model = SetUrlViewModel();
      model.url.text = 'https://invalid.com';

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: Form(
              key: model.formKey,
              child: TextFormField(
                controller: model.url,
                validator: (value) => null,
              ),
            ),
          ),
        ),
      );

      when(validator.validateUrlExistence('https://invalid.com'))
          .thenAnswer((_) async => false);

      await model.checkURLandNavigate('/login', argument: 'arg');
      await tester.pumpAndSettle();

      verify(navigationService.showTalawaErrorSnackBar(
        "URL doesn't exist/no connection please check",
        MessageType.error,
      ));

      locator.unregister<Validator>();
      locator.registerSingleton(Validator());
    });

    testWidgets('checkURLandNavigate handles exception', (tester) async {
      if (locator.isRegistered<Validator>()) {
        locator.unregister<Validator>();
      }
      final validator = MockValidator();
      locator.registerSingleton<Validator>(validator);

      final model = SetUrlViewModel();
      model.url.text = 'https://error.com';

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: Form(
              key: model.formKey,
              child: TextFormField(
                controller: model.url,
                validator: (value) => null,
              ),
            ),
          ),
        ),
      );

      when(validator.validateUrlExistence(any)).thenThrow(Exception('Error'));

      await model.checkURLandNavigate('/login', argument: 'arg');
      await tester.pumpAndSettle();

      verify(navigationService.showTalawaErrorSnackBar(
        'Something went wrong!',
        MessageType.error,
      ));

      locator.unregister<Validator>();
      locator.registerSingleton(Validator());
    });

    testWidgets('checkURLandShowPopUp shows error for invalid URL',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        locator.unregister<Validator>();
      }
      final validator = MockValidator();
      locator.registerSingleton<Validator>(validator);

      final model = SetUrlViewModel();
      model.url.text = 'https://invalid.com';

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: Form(
              key: model.formKey,
              child: TextFormField(
                controller: model.url,
                validator: (value) => null,
              ),
            ),
          ),
        ),
      );

      when(validator.validateUrlExistence('https://invalid.com'))
          .thenAnswer((_) async => false);

      await model.checkURLandShowPopUp();
      await tester.pumpAndSettle();

      verify(navigationService.showTalawaErrorDialog(
        "URL doesn't exist/no connection please check",
        MessageType.info,
      ));

      locator.unregister<Validator>();
      locator.registerSingleton(Validator());
    });

    test('properties are initialized correctly', () {
      final model = SetUrlViewModel();

      expect(model.formKey, isA<GlobalKey<FormState>>());
      expect(model.qrKey, isA<GlobalKey>());
      expect(model.orgId, '-1');
      expect(model.validate, AutovalidateMode.disabled);
      expect(model.url.text, '');
      expect(model.urlFocus, isA<FocusNode>());
    });

    test('dispose works correctly', () {
      final model = SetUrlViewModel();
      expect(() => model.dispose(), returnsNormally);
    });
    testWidgets('checkURLandNavigate with trailing slash URL', (tester) async {
      if (locator.isRegistered<Validator>()) {
        locator.unregister<Validator>();
      }
      final validator = MockValidator();
      locator.registerSingleton<Validator>(validator);

      final model = SetUrlViewModel();
      model.url.text = 'https://test.com///';

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: Form(
              key: model.formKey,
              child: TextFormField(
                controller: model.url,
                validator: (value) => null,
              ),
            ),
          ),
        ),
      );

      when(validator.validateUrlExistence('https://test.com'))
          .thenAnswer((_) async => false);

      await model.checkURLandNavigate('/login', argument: 'arg');
      await tester.pumpAndSettle();

      verify(validator.validateUrlExistence('https://test.com'));

      locator.unregister<Validator>();
      locator.registerSingleton(Validator());
    });

    testWidgets('checkURLandShowPopUp handles exception', (tester) async {
      if (locator.isRegistered<Validator>()) {
        locator.unregister<Validator>();
      }
      final validator = MockValidator();
      locator.registerSingleton<Validator>(validator);

      final model = SetUrlViewModel();
      model.url.text = 'https://error.com';

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: Form(
              key: model.formKey,
              child: TextFormField(
                controller: model.url,
                validator: (value) => null,
              ),
            ),
          ),
        ),
      );

      when(validator.validateUrlExistence(any)).thenThrow(Exception('Error'));

      await model.checkURLandShowPopUp();
      await tester.pumpAndSettle();

      verify(navigationService.showTalawaErrorDialog(
        'Something went wrong!',
        MessageType.info,
      ));

      locator.unregister<Validator>();
      locator.registerSingleton(Validator());
    });

    testWidgets('form validation failure prevents navigation', (tester) async {
      final model = SetUrlViewModel();
      model.url.text = '';

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: Form(
              key: model.formKey,
              child: TextFormField(
                controller: model.url,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
            ),
          ),
        ),
      );

      await model.checkURLandNavigate('/login', argument: 'arg');
      await tester.pumpAndSettle();

      expect(model.validate, AutovalidateMode.always);
    });
  });
}
