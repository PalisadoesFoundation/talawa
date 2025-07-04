// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/exceptions/critical_action_exception.dart';
import 'package:talawa/exceptions/graphql_exception_resolver.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/base_view.dart';
import '../helpers/test_helpers.dart';

/// Builds a base screen widget for testing GraphQL exception resolver.
///
/// This function creates a MaterialApp wrapped in BaseView with AppLanguage
/// view model for testing purposes. It includes localization delegates and
/// a test button that triggers the provided onClick callback.
///
/// **params**:
/// * `onClick`: A callback function that gets executed when the test button is pressed
///
/// **returns**:
/// * `Widget`: A MaterialApp widget configured for testing with localization support
Widget buildBaseScreen({required Function() onClick}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: TextButton(
            onPressed: () {
              print('hhhhhhhhhhhhhhhhh');
              onClick.call();
            },
            child: const Text('click me'),
          ),
        ),
        navigatorKey: navigationService.navigatorKey,
      );
    },
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    setupLocator();
    sizeConfig.test();
    graphqlConfig.test();
    getAndRegisterDatabaseMutationFunctions();
  });

  group('Test GraphQl Exception resolver', () {
    testWidgets('test critical action exception', (tester) async {
      final CriticalActionException criticalActionException =
          CriticalActionException('Test Error');
      late final bool? result;
      await tester.pumpWidget(
        buildBaseScreen(
          onClick: () {
            result = GraphqlExceptionResolver.encounteredExceptionOrError(
              criticalActionException,
              showSnackBar: true,
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('click me'));
      await tester.pumpAndSettle();
      expect(result, false);
    });
    testWidgets('userNotFound', (tester) async {
      final OperationException operationException = OperationException();
      operationException.graphqlErrors
          .add(GraphqlExceptionResolver.userNotFound);
      late final bool? result;
      await tester.pumpWidget(
        buildBaseScreen(
          onClick: () {
            result = GraphqlExceptionResolver.encounteredExceptionOrError(
              operationException,
              showSnackBar: true,
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('click me'));
      await tester.pumpAndSettle();
      expect(result, false);
    });

    testWidgets('refreshAccessTokenExpiredException', (tester) async {
      const refreshToken = 'refreshToken';
      userConfig.currentUser = User(refreshToken: refreshToken);
      when(
        databaseFunctions.refreshAccessToken(refreshToken),
      ).thenAnswer((_) async => true);

      final OperationException operationException = OperationException();
      operationException.graphqlErrors
          .add(GraphqlExceptionResolver.refreshAccessTokenExpiredException);
      late final bool? result;
      await tester.pumpWidget(
        buildBaseScreen(
          onClick: () {
            result = GraphqlExceptionResolver.encounteredExceptionOrError(
              operationException,
              showSnackBar: true,
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('click me'));
      await tester.pumpAndSettle();
      expect(result, true);
    });

    testWidgets('memberRequestExist', (tester) async {
      final OperationException operationException = OperationException();

      operationException.graphqlErrors
          .add(GraphqlExceptionResolver.memberRequestExist);

      late final bool? result;
      await tester.pumpWidget(
        buildBaseScreen(
          onClick: () {
            result = GraphqlExceptionResolver.encounteredExceptionOrError(
              operationException,
              showSnackBar: true,
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('click me'));
      await tester.pumpAndSettle();
      expect(result, false);
    });

    testWidgets('wrongCredentials', (tester) async {
      final OperationException operationException = OperationException();

      operationException.graphqlErrors
          .add(GraphqlExceptionResolver.wrongCredentials);

      late final bool? result;
      await tester.pumpWidget(
        buildBaseScreen(
          onClick: () {
            result = GraphqlExceptionResolver.encounteredExceptionOrError(
              operationException,
              showSnackBar: true,
            );
          },
        ),
      );

      print(GraphqlExceptionResolver.notifFeatureNotInstalled);
      await tester.pumpAndSettle();
      await tester.tap(find.text('click me'));
      await tester.pumpAndSettle();
      expect(result, false);
    });

    testWidgets('organizationNotFound', (tester) async {
      final OperationException operationException = OperationException();

      operationException.graphqlErrors
          .add(GraphqlExceptionResolver.organizationNotFound);

      late final bool? result;
      await tester.pumpWidget(
        buildBaseScreen(
          onClick: () {
            result = GraphqlExceptionResolver.encounteredExceptionOrError(
              operationException,
              showSnackBar: true,
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('click me'));
      await tester.pumpAndSettle();
      expect(result, false);
    });

    testWidgets('emailAccountPresent', (tester) async {
      final OperationException operationException = OperationException();

      operationException.graphqlErrors
          .add(GraphqlExceptionResolver.emailAccountPresent);

      late final bool? result;
      await tester.pumpWidget(
        buildBaseScreen(
          onClick: () {
            result = GraphqlExceptionResolver.encounteredExceptionOrError(
              operationException,
              showSnackBar: true,
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('click me'));
      await tester.pumpAndSettle();
      expect(result, false);
    });
  });
}
