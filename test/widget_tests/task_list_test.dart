// Packages imports.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/enums/event_recurrance.dart';
import 'package:talawa/model/events.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/events/task_list.dart';

Widget taskListPage() => MultiProvider(
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
        home: TaskList(
          event: EventsModel(
              id: "6065ab230499450027b568af",
              title: 'Weeb meet',
              description: 'Lets Meet',
              isPublic: true,
              isRegisterable: true,
              recurring: true,
              recurrance: Recurrance.daily,
              startTime: "1617258600000000",
              endTime: "1617258600000000",
              allDay: false,
              location: 'India',
              isRegistered: false),
        ),
      ),
    );
void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("Task List Tests", () {
    testWidgets("Testing if tasklist  Page shows up", (tester) async {
      await tester.pumpWidget(taskListPage());

      /// Verify if [tasklist Page] shows up.

      expect(
        find.byType(Container),
        findsWidgets,
      );
    });

    testWidgets("Testing overflow of Task List in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(taskListPage());
    });

    testWidgets("Testing overflow of Task List in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(taskListPage());
    });
  });
}
