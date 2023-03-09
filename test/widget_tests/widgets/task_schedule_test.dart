// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/explore_tasks_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/task_schedule.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';
import '../../helpers/test_locator.dart';

final mockNavigationService = MockNavigationService();

final task1 = Task(
  id: '123',
  title: 'Test task',
  creator: User(
    id: '123',
    firstName: 'Ayush',
    lastName: 'Chaudhary',
    email: 'test@test.com',
  ),
  createdAt: '123456',
  event: Event(
    id: '123',
  ),
  // description: 'test description',
  // deadline: 'test deadline'
);
final task2 = Task(
  id: '123',
  title: 'Test task',
  creator: User(
    id: '123',
    firstName: 'Ansh',
    lastName: 'Chaudhary',
    email: 'test@test.com',
  ),
  createdAt: '123456',
  event: Event(
    id: '123',
  ),
  // description: 'test description',
  // deadline: 'test deadline',
);

Widget createTaskScheduleWidget({
  bool reverse = false,
  String? dialogTitle,
  bool showMoreOptions = false,
}) {
  return MaterialApp(
    key: const Key('Root'),
    navigatorKey: locator<NavigationService>().navigatorKey,
    navigatorObservers: [],
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: TaskSchedule(
        tasks: [task1, task2],
      ),
    ),
    onGenerateRoute: router.generateRoute,
  );
}

//
Widget createTaskCardWidget({
  bool reverse = false,
  String? dialogTitle,
  bool showMoreOptions = false,
}) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<ExploreTasksViewModel>(
        create: (_) => ExploreTasksViewModel(),
      ),
    ],
    child: MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,
      navigatorObservers: [],
      locale: const Locale('en'),
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
        const Locale('fr', 'FR'),
        const Locale('hi', 'IN'),
        const Locale('zh', 'CN'),
        const Locale('de', 'DE'),
        const Locale('ja', 'JP'),
        const Locale('pt', 'PT'),
      ],
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      onGenerateRoute: router.generateRoute,
      home: Scaffold(
        body: TaskCard(
          appointment: appointment,
          showMoreOptions: true,
          task: task1,
        ),
      ),
    ),
  );
}

Widget createJoinOrgAfterAuth({String orgId = "fake_id"}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: TaskCard(
          appointment: appointment,
          showMoreOptions: true,
          task: task1,
        ),
      );
    },
  );
}

final Appointment appointment = Appointment(
  startTime: DateTime.now(),
  endTime: DateTime.now().add(const Duration(seconds: 5)),
);

void main() {
  testSetupLocator();
  getAndRegisterTaskService();
  TestWidgetsFlutterBinding.ensureInitialized();

  locator<SizeConfig>().test();

  testWidgets('Check if the Task Schedule up', (tester) async {
    await tester.pumpWidget(createTaskScheduleWidget());
    await tester.pump();

    expect(find.byType(TaskSchedule), findsOneWidget);
  });
  testWidgets('Check if the onTap works', (tester) async {
    await tester.pumpWidget(createTaskScheduleWidget());
    await tester.pump();

    final finder = find.byType(SfCalendar);
    await tester.tap(finder);
    await tester.pump();
    expect(find.byType(TaskSchedule), findsOneWidget);
  });
  testWidgets('Check if the Task Card is returned', (tester) async {
    await tester.pumpWidget(createTaskScheduleWidget());
    await tester.pump();

    final finder = find.byType(SfCalendar);
    await tester.tap(finder);
    await tester.pump();

    expect(find.byType(TaskCard), findsNWidgets(2));
  });
  testWidgets(
      'Check if the Task Card is pressable and onTap function is called',
      (tester) async {
    await tester.pumpWidget(createTaskScheduleWidget());
    await tester.pump();

    final finder = find.byType(SfCalendar);
    await tester.tap(finder);
    await tester.pump();

    expect(find.byType(TaskCard), findsNWidgets(2));
    await tester.tap(find.byType(TaskCard).first);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets(
      "Check calendarTapped when targetElement is CalendarElement.header",
      (tester) async {
    await tester.pumpWidget(createTaskScheduleWidget());
    await tester.pump();

    final finder = find.byType(SfCalendar);
    await tester.tap(finder);
    await tester.pump();

    await tester.tap(find.text(DateFormat("MMMM y").format(DateTime.now())));
    await tester.pump();
    verifyNever(mockNavigationService.pushDialog(const AlertDialog()));
  });
  testWidgets(
      'Check when the Task Card is pressed the close button is available',
      (tester) async {
    await tester.pumpWidget(createTaskScheduleWidget());
    await tester.pump();

    final finder = find.byType(SfCalendar);
    await tester.tap(finder);
    await tester.pump();

    expect(find.byType(TaskCard), findsNWidgets(2));
    await tester.tap(find.byType(TaskCard).first);
    await tester.pump();

    final closeBtn = find.text('Close');
    expect(closeBtn, findsOneWidget);
  });
  testWidgets('Check if close button is working in AlertDialog',
      (tester) async {
    await tester.pumpWidget(createTaskScheduleWidget());
    await tester.pump();

    final finder = find.byType(SfCalendar);
    await tester.tap(finder);
    await tester.pump();

    expect(find.byType(TaskCard), findsNWidgets(2));
    await tester.tap(find.byType(TaskCard).first);
    await tester.pump();

    ///the AlertBOX is in open status
    expect(find.byType(AlertDialog), findsOneWidget);
    final closeBtn = find.text('Close');
    await tester.tap(closeBtn);
    await tester.pump();

    ///the AlertBOX is in closed status
    expect(find.byType(AlertDialog), findsNothing);
  });
  testWidgets('Check TaskCard is showing up', (tester) async {
    await tester.pumpWidget(createTaskCardWidget());
    await tester.pump();

    expect(find.byType(Container), findsOneWidget);
    await tester.tap(find.byType(IconButton));
    await tester.pump();
  });
  testWidgets('Check TaskCard Icons.more_vert is working', (tester) async {
    await tester.pumpWidget(createTaskCardWidget());
    await tester.pump();

    final finder = find.byIcon(Icons.more_vert);
    await tester.tap(finder);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
  });
  testWidgets('Check AlertDialog have all button', (tester) async {
    await tester.pumpWidget(createTaskCardWidget());
    await tester.pump();

    final finder = find.byIcon(Icons.more_vert);
    await tester.tap(finder);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);

    expect(find.text('Delete'), findsOneWidget);
    expect(find.text('Edit'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });
  testWidgets('Check AlertDialog delete button iss working', (tester) async {
    await tester.pumpWidget(createTaskCardWidget());
    await tester.pump();

    final finder = find.byIcon(Icons.more_vert);
    await tester.tap(finder);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    final deleteBtn = find.text('Delete');

    expect(find.text('Delete'), findsOneWidget);
    expect(find.text('Edit'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(deleteBtn);
    await tester.pump();

    expect(find.byType(AlertDialog), findsNothing);
  });
  testWidgets('Check AlertDialog edit button iss working', (tester) async {
    await tester.pumpWidget(createTaskCardWidget());
    // await tester
    await tester.pump();

    final finder = find.byIcon(Icons.more_vert);
    await tester.tap(finder);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    final editBtn = find.text('Edit');

    expect(find.text('Delete'), findsOneWidget);
    expect(find.text('Edit'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(editBtn);
    await tester.pump();

    // expect(find.byType(EditEventPage), findsOneWidget);
  });
  testWidgets('Check AlertDialog cancel button iss working', (tester) async {
    await tester.pumpWidget(createTaskCardWidget());
    await tester.pump();

    final finder = find.byIcon(Icons.more_vert);
    await tester.tap(finder);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    final cancelBtn = find.text('Cancel');

    expect(find.text('Delete'), findsOneWidget);
    expect(find.text('Edit'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(cancelBtn);
    await tester.pump();
    expect(find.byType(AlertDialog), findsNothing);
  });
}
