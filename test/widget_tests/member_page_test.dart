import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/members/members.dart';

Widget createMemberPageScreen() => MultiProvider(
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
      child: const MaterialApp(
        home: Organizations(),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("member Page Tests", () {
    testWidgets("Testing if member page shows up", (tester) async {
      await tester.pumpWidget(createMemberPageScreen());

      /// Verify if [member page] shows up.
      expect(find.byKey(const Key('ORGANIZATION_APP_BAR')), findsOneWidget);
    });

    testWidgets("Testing overflow of Member page in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createMemberPageScreen());

      /// Verify if [memberpage] shows up.
      expect(find.byKey(const Key('ORGANIZATION_APP_BAR')), findsOneWidget);
    });
    testWidgets("Testing overflow of Member Page in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createMemberPageScreen());

      /// Verify if [LoginPage] shows up.
      expect(find.byKey(const Key('ORGANIZATION_APP_BAR')), findsOneWidget);
    });
  });
}
