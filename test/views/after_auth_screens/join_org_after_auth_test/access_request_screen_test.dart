import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/access_request_view_model.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/access_request_screen.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget accessRequestScreen() {
  return BaseView<AccessScreenViewModel>(
    onModelReady: (model) => model.initialise(fakeOrgInfo),
    builder: (context, model, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: SendAccessRequest(org: fakeOrgInfo),
        navigatorKey: navigationService.navigatorKey,
      );
    },
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  group("SendRequestAccess Screen test", () {
    testWidgets("SendRequestAccess screen is built correctly",
        (WidgetTester tester) async {
      when(
        databaseFunctions.gqlAuthMutation(
          queries.sendMembershipRequest(),
          variables: anyNamed('variables'),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(
            document: gql(
              PostQueries().addLike(),
            ),
          ),
          data: null,
          source: QueryResultSource.network,
        ),
      );

      // Set a larger screen size for testing
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(accessRequestScreen());
      await tester.pumpAndSettle();

      // Verify that appbar is present
      expect(find.byType(AppBar), findsOneWidget);

      // Verify that the image is present
      expect(find.byType(Image), findsOneWidget);

      // Verify main title
      expect(
        find.text("Request Access to Private Organization"),
        findsOneWidget,
      );

      // Verify private organization explanation text (partial match)
      expect(
        find.textContaining("This is a private organization"),
        findsOneWidget,
      );

      // Verify admin review explanation text (partial match)
      expect(
        find.textContaining("After you request access"),
        findsOneWidget,
      );

      // Verify help text (partial match)
      expect(
        find.textContaining("Need help"),
        findsOneWidget,
      );

      // Verify icons are present
      expect(find.byIcon(Icons.lock), findsOneWidget);
      expect(find.byIcon(Icons.admin_panel_settings), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);

      // Verify that the request access button is present
      expect(find.text("Request Access"), findsOneWidget);

      // Verify container styling
      final containers = find.byType(Container);
      expect(containers, findsWidgets);
    });

    testWidgets("Button interaction works correctly",
        (WidgetTester tester) async {
      // Mock the sendMembershipRequest mutation with proper response
      when(
        databaseFunctions.gqlAuthMutation(
          queries.sendMembershipRequest(),
          variables: anyNamed('variables'),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(
            document: gql(queries.sendMembershipRequest()),
          ),
          data: {
            'sendMembershipRequest': {
              'userId': 'test-user-id',
              'membershipRequestId': 'test-request-id',
              'organizationId': 'XYZ',
              'status': 'PENDING',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      await tester.pumpWidget(accessRequestScreen());
      await tester.pumpAndSettle();

      // Find the ElevatedButton widget
      final elevatedButtonFinder = find.byWidgetPredicate(
        (widget) => widget is ElevatedButton && widget.child != null,
      );
      expect(elevatedButtonFinder, findsOneWidget);

      // Ensure the button is visible by scrolling to it
      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -300),
      );
      await tester.pumpAndSettle();

      // Try to tap using ensureVisible first
      await tester.ensureVisible(elevatedButtonFinder);
      await tester.pumpAndSettle();

      // Now tap the button
      await tester.tap(elevatedButtonFinder, warnIfMissed: false);
      await tester.pumpAndSettle();

      // Verify the mutation was called
      verify(
        databaseFunctions.gqlAuthMutation(
          queries.sendMembershipRequest(),
          variables: anyNamed('variables'),
        ),
      ).called(1);

      // Verify no errors occurred during button press
      expect(tester.takeException(), isNull);
    });
  });
}
