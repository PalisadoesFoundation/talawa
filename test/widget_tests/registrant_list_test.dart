// Packages imports.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/events/registrant_list.dart';

Widget registrantListPage() => MultiProvider(
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
        home: RegList(
          event: {
            '_id': "6065ab230499450027b568af",
            'title': 'Weeb meet',
            'description': 'Let meet',
            'isPublic': true,
            'isRegisterable': true,
            'recurring': false,
            'recurrance': 'DAILY',
            'startTime': 1617258600000000,
            'endTime': 1617388140000000,
            'allDay': false,
            'location': 'India',
            'isRegistered': false
          },
        ),
      ),
    );
void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("Registrant List Tests", () {
    testWidgets("Testing if Registrant List  Page shows up", (tester) async {
      await tester.pumpWidget(registrantListPage());

      /// Verify if [Registrant List Page] shows up.

      expect(
        find.byType(Container),
        findsWidgets,
      );
    });

    testWidgets("Testing overflow of Registrant List in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(registrantListPage());
    });

    testWidgets("Testing overflow of Registrant List in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(registrantListPage());
    });
  });
}
