import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/events/events.dart';

Widget createEventsPageScreen() => MultiProvider(
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
        home: Events(),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("events Page Tests", () {
    testWidgets("Testing if events page shows up", (tester) async {
      await tester.pumpWidget(createEventsPageScreen());

      /// Verify if [events page] shows up.
      expect(find.byKey(const Key('EVENTS_APP_BAR')), findsOneWidget);
      expect(find.text('Events'), findsOneWidget);
    });

    testWidgets("Testing overflow of events page in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createEventsPageScreen());

      /// Verify if [events page] shows up.
      expect(find.byKey(const Key('EVENTS_APP_BAR')), findsOneWidget);
      expect(find.text('Events'), findsOneWidget);
    });

    testWidgets("Testing overflow of events Page in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createEventsPageScreen());

      /// Verify if [events page] shows up.
      expect(find.byKey(const Key('EVENTS_APP_BAR')), findsOneWidget);
      expect(find.text('Events'), findsOneWidget);
    });

    testWidgets("Testing if add event fab shows up", (tester) async {
      await tester.pumpWidget(createEventsPageScreen());

      /// Verify if [events page] shows up.
      expect(find.byKey(const Key('EVENTS_APP_BAR')), findsOneWidget);
      expect(find.text('Events'), findsOneWidget);

      //get the fab
      final addEventFab = find.byType(FloatingActionButton);
      expect(addEventFab, findsOneWidget);
    });
  });
}
