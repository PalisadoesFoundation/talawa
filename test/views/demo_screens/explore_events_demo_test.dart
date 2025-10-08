// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/demo_screens/explore_events_demo.dart';
import 'package:talawa/widgets/custom_drawer.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

/// Creates the DemoExploreEvents screen for testing.
///
/// **params**:
/// * `model`: The MainScreenViewModel for the drawer
///
/// **returns**:
/// * `Widget`: DemoExploreEvents wrapped in MaterialApp with drawer
Widget createDemoExploreEventsScreen(MainScreenViewModel model) => MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
        drawer: CustomDrawer(
          homeModel: model,
        ),
        body: const DemoExploreEvents(
          key: Key('ExploreEvents'),
        ),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
    );

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    SizeConfig().test();
    registerServices();
    registerViewModels();
  });

  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });

  group('DemoExploreEvents Widget Tests', () {
    testWidgets('DemoExploreEvents renders correctly', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createDemoExploreEventsScreen(model));
      await tester.pump();

      expect(find.byType(DemoExploreEvents), findsOneWidget);
      expect(find.text('Explore Events'), findsOneWidget);
    });

    testWidgets('AppBar contains required icons', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createDemoExploreEventsScreen(model));
      await tester.pump();

      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byIcon(Icons.date_range), findsOneWidget);
      expect(find.byIcon(Icons.view_agenda), findsOneWidget);
    });

    testWidgets('Calendar widget is present', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createDemoExploreEventsScreen(model));
      await tester.pump();

      expect(find.byType(SfCalendar), findsOneWidget);
    });

    testWidgets('Calendar has demo events', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createDemoExploreEventsScreen(model));
      await tester.pump();

      final calendar = tester.widget<SfCalendar>(find.byType(SfCalendar));
      expect(calendar.dataSource, isNotNull);
      expect(calendar.dataSource!.appointments, isNotEmpty);
      expect(
        calendar.dataSource!.appointments!.length,
        greaterThanOrEqualTo(5),
      );
    });

    testWidgets('Calendar has month view settings', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createDemoExploreEventsScreen(model));
      await tester.pump();

      final calendar = tester.widget<SfCalendar>(find.byType(SfCalendar));
      expect(calendar.monthViewSettings, isNotNull);
      expect(
        calendar.monthViewSettings.appointmentDisplayMode,
        MonthAppointmentDisplayMode.appointment,
      );
      expect(calendar.monthViewSettings.showAgenda, isTrue);
      expect(calendar.monthViewSettings.agendaViewHeight, 200);
    });

    testWidgets('Calendar has onTap callback', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createDemoExploreEventsScreen(model));
      await tester.pump();

      final calendar = tester.widget<SfCalendar>(find.byType(SfCalendar));
      expect(calendar.onTap, isNotNull);
    });

    testWidgets('Widget disposes correctly', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createDemoExploreEventsScreen(model));
      await tester.pump();

      // Remove the widget
      await tester.pumpWidget(const SizedBox());
      await tester.pump();

      // No errors means disposal worked
      expect(find.byType(DemoExploreEvents), findsNothing);
    });
  });

  group('DemoExploreEvents Demo Data Tests', () {
    testWidgets('Demo events have valid properties', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createDemoExploreEventsScreen(model));
      await tester.pump();

      final calendar = tester.widget<SfCalendar>(find.byType(SfCalendar));
      final appointments = calendar.dataSource!.appointments!;

      for (final appointment in appointments) {
        final app = appointment as Appointment;
        expect(app.subject, isNotEmpty);
        expect(app.startTime, isNotNull);
        expect(app.endTime, isNotNull);
        expect(app.color, isNotNull);
        expect(app.endTime.isAfter(app.startTime), isTrue);
      }
    });

    testWidgets('Demo events span multiple days', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createDemoExploreEventsScreen(model));
      await tester.pump();

      final calendar = tester.widget<SfCalendar>(find.byType(SfCalendar));
      final appointments = calendar.dataSource!.appointments!;

      final startDates = appointments.map((a) {
        final app = a as Appointment;
        return DateTime(
          app.startTime.year,
          app.startTime.month,
          app.startTime.day,
        );
      }).toSet();

      expect(startDates.length, greaterThan(1));
    });

    testWidgets('Demo events include all-day and timed events', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createDemoExploreEventsScreen(model));
      await tester.pump();

      final calendar = tester.widget<SfCalendar>(find.byType(SfCalendar));
      final appointments = calendar.dataSource!.appointments!;

      final hasAllDay = appointments.any((a) => (a as Appointment).isAllDay);
      final hasTimedEvents =
          appointments.any((a) => !(a as Appointment).isAllDay);

      expect(hasAllDay, isTrue);
      expect(hasTimedEvents, isTrue);
    });
  });
}
