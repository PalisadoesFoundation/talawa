import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

/// Test for navigation_service.dart.
///
/// more_info_if_required
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  testSetupLocator();

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Testing all functions in NavigationService', () {
    test('NavigationService should call pushScreen with correct route',
        () async {
      await navigationService.pushScreen('testRoute', arguments: 'testArgs');
      verify(navigationService.pushScreen('testRoute', arguments: 'testArgs'))
          .called(1);
    });

    test('NavigationService should call popAndPushScreen with correct route',
        () async {
      await navigationService.popAndPushScreen(
        'newRoute',
        arguments: 'newArgs',
      );
      verify(
        navigationService.popAndPushScreen(
          'newRoute',
          arguments: 'newArgs',
        ),
      ).called(1);
    });

    test(
        'NavigationService should call pushReplacementScreen with correct route',
        () async {
      await navigationService.pushReplacementScreen(
        'replacementRoute',
        arguments: 'replacementArgs',
      );
      verify(
        navigationService.pushReplacementScreen(
          'replacementRoute',
          arguments: 'replacementArgs',
        ),
      ).called(1);
    });

    test('NavigationService should call removeAllAndPush with correct routes',
        () async {
      await navigationService.removeAllAndPush(
        'routeName',
        '/tillRoute',
        arguments: 'args',
      );
      verify(
        navigationService.removeAllAndPush(
          'routeName',
          '/tillRoute',
          arguments: 'args',
        ),
      ).called(1);
    });

    test('NavigationService should call pushDialog with correct widget',
        () async {
      const testDialog = Text('Test Dialog');
      navigationService.pushDialog(testDialog);
      verify(navigationService.pushDialog(testDialog)).called(1);
    });

    test('NavigationService should call showSnackBar with correct message', () {
      const testMessage = 'Test Message';
      navigationService.showSnackBar(testMessage);
      verify(navigationService.showSnackBar(testMessage)).called(1);
    });

    test(
        'NavigationService should call showTalawaErrorSnackBar with correct message and type',
        () {
      const errorMessage = 'Error Message';
      const messageType = MessageType.error;
      navigationService.showTalawaErrorSnackBar(errorMessage, messageType);
      verify(
        navigationService.showTalawaErrorSnackBar(
          errorMessage,
          messageType,
        ),
      ).called(1);
    });

    test(
        'NavigationService should call showTalawaErrorDialog with correct message and type',
        () {
      const errorMessage = 'Error Dialog Message';
      const messageType = MessageType.error;
      navigationService.showTalawaErrorDialog(errorMessage, messageType);
      verify(navigationService.showTalawaErrorDialog(errorMessage, messageType))
          .called(1);
    });

    test('NavigationService should call pop', () {
      navigationService.pop();
      verify(navigationService.pop()).called(1);
    });
  });
}
