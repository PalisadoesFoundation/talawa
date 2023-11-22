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
    WidgetsFlutterBinding.ensureInitialized();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Testing all functions in NavigationService', () {
    test('NavigationService should call pushScreen with correct route',
        () async {
      when(
        navigationService.pushScreen(
          'testroute',
          arguments: anyNamed('arguments'),
        ),
      ).thenAnswer(
        (invocation) => Future.value(
          navigationService.navigatorKey.currentState?.pushNamed(
            invocation.positionalArguments[0] as String,
            arguments: invocation.namedArguments[#arguments],
          ),
        ),
      );
      await navigationService.pushScreen('testRoute', arguments: 'testArgs');
      verify(navigationService.pushScreen('testRoute', arguments: 'testArgs'))
          .called(1);
    });
    test('NavigationService should call popAndPushScreen with correct route',
        () async {
      when(
        navigationService.popAndPushScreen(
          'testroute',
          arguments: anyNamed('arguments'),
        ),
      ).thenAnswer((invocation) {
        navigationService.navigatorKey.currentState?.pop();
        return Future.value(
          navigationService.navigatorKey.currentState?.pushNamed(
            invocation.positionalArguments[0] as String,
            arguments: invocation.namedArguments[#arguments],
          ),
        );
      });
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
    test('NavigationService should call fromInviteLink with correct routenames',
        () async {
      when(navigationService.fromInviteLink([], [])).thenAnswer((invocation) {
        final List<String> routeNames =
            invocation.positionalArguments[0] as List<String>;
        final List<dynamic> arguments =
            invocation.positionalArguments[1] as List<dynamic>;

        if (routeNames.isNotEmpty) {
          navigationService.navigatorKey.currentState?.pushNamedAndRemoveUntil(
            '/${routeNames[0]}',
            ModalRoute.withName('/'),
            arguments: arguments[0],
          );
          for (int i = 1; i < routeNames.length; i++) {
            navigationService.navigatorKey.currentState
                ?.pushNamed('/${routeNames[i]}', arguments: arguments[i]);
          }
        }
      });
      navigationService.fromInviteLink(
        [],
        [],
      );
      verifyNever(
        navigationService.pushReplacementScreen(
          'replacementRoute',
          arguments: 'replacementArgs',
        ),
      );
    });

    test(
        'NavigationService should call pushReplacementScreen with correct route',
        () async {
      when(
        navigationService.pushReplacementScreen(
          '',
          arguments: anyNamed('arguments'),
        ),
      ).thenAnswer(
        (invocation) => Future.value(
          navigationService.navigatorKey.currentState?.pushReplacementNamed(
            invocation.positionalArguments[0] as String,
            arguments: invocation.namedArguments[#arguments],
          ),
        ),
      );
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
      // ignore: require_trailing_commas
      when(
        navigationService.removeAllAndPush(
          '',
          '',
          arguments: anyNamed('arguments'),
        ),
      ).thenAnswer(
        (invocation) => Future.value(
          navigationService.navigatorKey.currentState?.pushNamedAndRemoveUntil(
            invocation.positionalArguments[0] as String,
            ModalRoute.withName(invocation.positionalArguments[1] as String),
            arguments: invocation.namedArguments[#arguments],
          ),
        ),
      );
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

    testWidgets('NavigationService should show SnackBar with correct message',
        (WidgetTester tester) async {
      final GlobalKey<NavigatorState> navigatorKey =
          GlobalKey<NavigatorState>();

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigatorKey,
          home: Builder(
            builder: (BuildContext context) {
              final currentContext = navigatorKey.currentContext;
              print(currentContext);
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    if (currentContext != null) {
                      ScaffoldMessenger.of(currentContext).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Test Snackbar'),
                        ),
                      );
                    }
                  },
                  child: const Text('Show Snackbar'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pumpAndSettle();

      expect(find.text('Test Snackbar'), findsOneWidget);
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
