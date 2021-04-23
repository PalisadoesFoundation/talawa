import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/organization/accept_requests_page.dart';

Widget accepRequestsPage() => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
          create: (_) => GraphQLConfiguration(),
        ),
        ChangeNotifierProvider<OrgController>(
          create: (_) => OrgController(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<Preferences>(
          create: (_) => Preferences(),
        ),
      ],
      child: MaterialApp(
        home: AcceptRequestsPage(),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("accept_members_requests page tests", () {
    testWidgets("Testing if member page shows up", (tester) async {
      await tester.pumpWidget(accepRequestsPage());

      //verify if [accept_members_requests] page appears
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Card), findsNothing);
    });

    testWidgets(
        "Testing overflow of accept_members_requests page in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(accepRequestsPage());

      //verify if [accept_members_requests] page appears

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Card), findsNothing);
    });
    testWidgets("Testing overflow of Member Page in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(accepRequestsPage());

      //verify if [accept_members_requests] page appears

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Card), findsNothing);
    });
  });
}
