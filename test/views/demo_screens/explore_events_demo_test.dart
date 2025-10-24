// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/demo_screens/explore_events_demo.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

// Mock the customDatePicker function
DateTime? mockPickedDate;

Future<DateTime?> mockCustomDatePicker({required DateTime initialDate}) async {
  return mockPickedDate;
}

/// Helper widget to wrap DemoExploreEvents with necessary providers.
Widget createExploreEventsScreen() {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: const [
      AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: const Scaffold(
      key: Key('TestScaffold'),
      body: DemoExploreEvents(key: Key('demo_explore_events')),
      drawer: Drawer(
        key: Key("Drawer"),
        child: Text('Drawer'),
      ),
    ),
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
    locator<SizeConfig>().test();
    locator<GraphqlConfig>().test();
  });

  tearDownAll(() {
    unregisterServices();
  });

  setUp(() {
    mockPickedDate = null;
  });

  group('DemoExploreEvents Widget Creation Tests', () {
    testWidgets('Should create DemoExploreEvents widget without error',
        (WidgetTester tester) async {
      const widget = DemoExploreEvents(key: Key('demo_explore_events'));

      expect(widget, isA<DemoExploreEvents>());
      expect(widget.key, const Key('demo_explore_events'));
    });

    testWidgets('Should create state without error',
        (WidgetTester tester) async {
      const widget = DemoExploreEvents(key: Key('demo_explore_events'));
      final state = widget.createState();

      expect(state, isA<DemoExploreEventsState>());
    });

    testWidgets('Should be a StatefulWidget', (WidgetTester tester) async {
      const widget = DemoExploreEvents(key: Key('demo_explore_events'));

      expect(widget, isA<StatefulWidget>());
    });
  });

  group('DemoAppointmentDataSource Tests', () {
    testWidgets('Should create data source with appointments',
        (WidgetTester tester) async {
      final testAppointments = [
        Appointment(
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 1)),
          subject: 'Test Event 1',
          color: Colors.blue,
        ),
        Appointment(
          startTime: DateTime.now().add(const Duration(days: 1)),
          endTime: DateTime.now().add(const Duration(days: 1, hours: 2)),
          subject: 'Test Event 2',
          color: Colors.red,
        ),
      ];

      final dataSource = DemoAppointmentDataSource(testAppointments);

      expect(dataSource.appointments, equals(testAppointments));
      expect(dataSource.appointments!.length, 2);
    });

    testWidgets('Should handle empty appointments list',
        (WidgetTester tester) async {
      final dataSource = DemoAppointmentDataSource([]);

      expect(dataSource.appointments, isEmpty);
    });

    testWidgets('Should extend CalendarDataSource',
        (WidgetTester tester) async {
      final testAppointments = [
        Appointment(
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 1)),
          subject: 'Test Event',
          color: Colors.blue,
        ),
      ];
      final dataSource = DemoAppointmentDataSource(testAppointments);

      expect(dataSource, isA<CalendarDataSource>());
    });

    testWidgets('Should properly store appointment data',
        (WidgetTester tester) async {
      final testDate = DateTime(2023, 12, 25, 10, 0);
      final testAppointments = [
        Appointment(
          startTime: testDate,
          endTime: testDate.add(const Duration(hours: 2)),
          subject: 'Christmas Event',
          color: Colors.green,
          location: 'Main Hall',
          notes: 'Annual celebration',
        ),
      ];

      final dataSource = DemoAppointmentDataSource(testAppointments);
      final appointments = dataSource.appointments! as List<Appointment>;
      final appointment = appointments.first;

      expect(appointment.subject, 'Christmas Event');
      expect(appointment.startTime, testDate);
      expect(appointment.endTime, testDate.add(const Duration(hours: 2)));
      expect(appointment.color, Colors.green);
      expect(appointment.location, 'Main Hall');
      expect(appointment.notes, 'Annual celebration');
    });

    testWidgets('Should handle appointment with all properties',
        (WidgetTester tester) async {
      final appointment = Appointment(
        startTime: DateTime(2023, 1, 1, 9, 0),
        endTime: DateTime(2023, 1, 1, 17, 0),
        subject: 'Full Day Workshop',
        color: Colors.orange,
        location: 'Conference Room A',
        notes: 'Team building workshop with lunch included',
        isAllDay: false,
      );

      final dataSource = DemoAppointmentDataSource([appointment]);
      final retrievedAppointment =
          (dataSource.appointments! as List<Appointment>).first;

      expect(retrievedAppointment.subject, 'Full Day Workshop');
      expect(retrievedAppointment.color, Colors.orange);
      expect(retrievedAppointment.location, 'Conference Room A');
      expect(
        retrievedAppointment.notes,
        'Team building workshop with lunch included',
      );
      expect(retrievedAppointment.isAllDay, false);
    });

    testWidgets('Should handle all-day appointment',
        (WidgetTester tester) async {
      final appointment = Appointment(
        startTime: DateTime(2023, 7, 4),
        endTime: DateTime(2023, 7, 5),
        subject: 'Independence Day',
        color: Colors.red,
        isAllDay: true,
      );

      final dataSource = DemoAppointmentDataSource([appointment]);
      final retrievedAppointment =
          (dataSource.appointments! as List<Appointment>).first;

      expect(retrievedAppointment.subject, 'Independence Day');
      expect(retrievedAppointment.isAllDay, true);
      expect(retrievedAppointment.color, Colors.red);
    });
  });
}
