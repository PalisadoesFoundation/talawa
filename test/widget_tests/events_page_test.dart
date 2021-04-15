import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
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
      child: MaterialApp(
        home: Events(),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("events Page Tests", () {
    testWidgets("Testing if events page shows up", (tester) async {
      await tester.pumpWidget(createEventsPageScreen());

      /// Verify if [events page] shows up.
      expect(find.byKey(Key('EVENTS_APP_BAR')),findsOneWidget);
      expect(find.byType(FutureBuilder),findsOneWidget);
    });

    testWidgets("Testing overflow of events page in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createEventsPageScreen());

      /// Verify if [events page] shows up.
      expect(find.byKey(Key('EVENTS_APP_BAR')),findsOneWidget);
    });
    testWidgets("Testing overflow of events Page in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createEventsPageScreen());

      /// Verify if [events page] shows up.
      expect(find.byKey(Key('EVENTS_APP_BAR')),findsOneWidget);
    });
  });
}