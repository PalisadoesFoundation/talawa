// Packages imports.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/chat/groups.dart';

Widget groupsPage() => MultiProvider(
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
        home: Groups(),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("Groups page Tests", () {
    testWidgets("Testing if Groups page shows up", (tester) async {
      await tester.pumpWidget(groupsPage());

      /// Verify if [Groups page] shows up.
      expect(
        find.byType(Groups),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of Groups page in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(groupsPage());

      /// Verify if [Groups page] shows up.
      expect(
        find.byType(Groups),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of Groups page in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(groupsPage());

      /// Verify if [Groups page] shows up.
      expect(
        find.byType(Groups),
        findsOneWidget,
      );
    });

    testWidgets("empty groups for user with no org", (tester) async {
      await tester.pumpWidget(groupsPage());

      final emptyTextWidget = find.byKey(const Key('empty_chat_group'));

      expect(emptyTextWidget, findsOneWidget);

      // get the [ListView] widget
      final listView = find.byType(ListView);
      expect(
        listView,
        findsNothing,
      );
    });
  });
}
