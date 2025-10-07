// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/recurrence_rule_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockCallbackFunction extends Mock {
  void call();
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
    registerViewModels();
  });

  tearDown(() {
    unregisterServices();
  });

  final testEvent = Event(
    id: 'event1',
    name: 'Test Event',
    location: 'Test Location',
    description: 'Test Description',
    creator: User(
      id: 'user1',
      firstName: 'Test',
      lastName: 'User',
      email: 'test@example.com',
    ),
    startAt: DateTime(2025, 7, 28, 9, 0),
    endAt: DateTime(2025, 7, 30, 17, 0),
    isPublic: true,
    isRegisterable: true,
    allDay: false,
    organization: OrgInfo(id: 'XYZ'),
  );

  final recurringTestEvent = Event(
    id: 'event2',
    name: 'Recurring Event',
    location: 'Location',
    description: 'Description',
    creator: User(
      id: 'user1',
      firstName: 'Test',
      lastName: 'User',
      email: 'test@example.com',
    ),
    startAt: DateTime(2025, 7, 28, 9, 0),
    endAt: DateTime(2025, 7, 28, 10, 0),
    isPublic: true,
    isRegisterable: true,
    allDay: false,
    recurring: true,
    organization: OrgInfo(id: 'XYZ'),
    recurrenceRule: RecurrenceRule(
      frequency: Frequency.weekly,
      interval: 1,
      byDay: [DayCodes.monday, DayCodes.wednesday],
      never: false,
      count: 10,
    ),
  );

  group('EditEventViewModel Tests', () {
    group('Initialization', () {
      test('initializes correctly with non-recurring event', () {
        final model = EditEventViewModel();
        model.initialize(testEvent);

        expect(model.eventTitleTextController.text, 'Test Event');
        expect(model.eventLocationTextController.text, 'Test Location');
        expect(model.eventDescriptionTextController.text, 'Test Description');
        expect(model.isPublicSwitch, true);
        expect(model.isRegisterableSwitch, true);
        expect(model.isAllDay, false);
        expect(model.eventId, 'event1');
        expect(model.wasRecurringOriginally, false);
        expect(model.isRecurring, false);

        expect(model.eventStartDate.year, 2025);
        expect(model.eventStartDate.month, 7);
        expect(model.eventStartDate.day, 28);
        expect(model.eventStartTime.hour, 9);
        expect(model.eventStartTime.minute, 0);

        expect(model.eventEndDate.year, 2025);
        expect(model.eventEndDate.month, 7);
        expect(model.eventEndDate.day, 30);
        expect(model.eventEndTime.hour, 17);
        expect(model.eventEndTime.minute, 0);
      });

      test('initializes correctly with recurring event', () {
        final model = EditEventViewModel();
        model.initialize(recurringTestEvent);

        expect(model.eventTitleTextController.text, 'Recurring Event');
        expect(model.isRecurring, true);
        expect(model.wasRecurringOriginally, true);
        expect(model.frequency, Frequency.weekly);
        expect(model.interval, 1);
        expect(model.weekDays, {WeekDays.monday, WeekDays.wednesday});
        expect(model.count, 10);
        expect(model.never, false);
      });

      test('handles missing dates gracefully', () {
        final eventWithoutDates = Event(
          id: 'event3',
          name: 'Test',
          location: 'Location',
          description: 'Description',
          creator: User(id: 'user1'),
          organization: OrgInfo(id: 'XYZ'),
        );

        final model = EditEventViewModel();
        model.initialize(eventWithoutDates);

        expect(model.eventStartDate, isNotNull);
        expect(model.eventEndDate, isNotNull);
        expect(model.eventStartTime, isNotNull);
        expect(model.eventEndTime, isNotNull);
      });

      test('initializes recurrence data with byPosition', () {
        final eventWithPosition = Event(
          id: 'event4',
          name: 'Monthly Event',
          location: 'Location',
          description: 'Description',
          creator: User(id: 'user1'),
          startAt: DateTime(2025, 7, 28, 9, 0),
          endAt: DateTime(2025, 7, 28, 10, 0),
          recurring: true,
          organization: OrgInfo(id: 'XYZ'),
          recurrenceRule: RecurrenceRule(
            frequency: Frequency.monthly,
            interval: 1,
            byDay: ['2MO'], // Second Monday
            never: true,
          ),
        );

        final model = EditEventViewModel();
        model.initialize(eventWithPosition);

        expect(model.byPosition, 2);
        expect(model.weekDays, {WeekDays.monday});
        expect(model.useDayOfWeekMonthly, true);
      });
    });

    group('Event Update', () {
      test('execute updates non-recurring event successfully', () async {
        final model = EditEventViewModel();
        model.initialize(testEvent);

        model.eventTitleTextController.text = 'Updated Event';
        model.eventLocationTextController.text = 'Updated Location';

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenAnswer((_) async {
          return QueryResult(
            source: QueryResultSource.network,
            data: {'updateEvent': {}},
            options: QueryOptions(document: gql(EventQueries().updateEvent())),
          );
        });

        await model.execute();

        verify(navigationService.pushDialog(any)).called(1);
        verify(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: 'standalone',
          ),
        ).called(1);
        verify(navigationService.pop()).called(3); // dialog + 2 screens
        verify(navigationService.showSnackBar('Event updated successfully'))
            .called(1);
      });

      test('execute handles no changes', () async {
        final model = EditEventViewModel();
        model.initialize(testEvent);

        await model.execute();

        verify(navigationService.showSnackBar('No changes to update'))
            .called(1);
        verifyNever(eventService.editEvent(
          variables: anyNamed('variables'),
          recurrenceType: anyNamed('recurrenceType'),
        ));
      });

      test('execute handles update failure', () async {
        final model = EditEventViewModel();
        model.initialize(testEvent);

        model.eventTitleTextController.text = 'Updated Event';

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenAnswer((_) async {
          return QueryResult(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(document: gql(EventQueries().updateEvent())),
          );
        });

        await model.execute();

        verify(navigationService.pop()).called(2);
        verify(
          navigationService.showSnackBar(
            'An error occurred while updating the event',
          ),
        ).called(1);
      });

      test('execute handles exception during update', () async {
        final model = EditEventViewModel();
        model.initialize(testEvent);

        model.eventTitleTextController.text = 'Updated Event';

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenThrow(Exception('Network error'));

        await model.execute();

        verify(navigationService.pop()).called(1);
        verify(
          navigationService.showSnackBar(
            'An error occurred while updating the event',
          ),
        ).called(1);
      });
    });

    group('Recurring Event Updates', () {
      testWidgets('shows dialog for recurring event update options',
          (tester) async {
        final model = EditEventViewModel();
        model.initialize(recurringTestEvent);

        model.eventTitleTextController.text = 'Updated Title';

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenAnswer((_) async {
          return QueryResult(
            source: QueryResultSource.network,
            data: {'updateEvent': {}},
            options: QueryOptions(document: gql(EventQueries().updateEvent())),
          );
        });

        // Start the execute call which will show dialog
        final executeFuture = model.execute();

        await tester.pumpAndSettle();

        // Verify dialog is shown
        expect(find.text('Update Recurring Event'), findsOneWidget);
        expect(find.text('Update this event only'), findsOneWidget);
        expect(
          find.text('Update this and all future events'),
          findsOneWidget,
        );
        expect(find.text('Update all events in the series'), findsOneWidget);

        // Tap on "Update this event only"
        await tester.tap(find.text('Update this event only'));
        await tester.pumpAndSettle();

        await executeFuture;

        verify(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: 'single',
          ),
        ).called(1);
      });

      testWidgets('handles cancel in recurring event dialog', (tester) async {
        final model = EditEventViewModel();
        model.initialize(recurringTestEvent);

        model.eventTitleTextController.text = 'Updated Title';

        final executeFuture = model.execute();

        await tester.pumpAndSettle();

        // Tap cancel
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();

        await executeFuture;

        // Should update with standalone type when cancelled
        verify(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: 'standalone',
          ),
        ).called(1);
      });

      test('updates recurring event to non-recurring', () async {
        final model = EditEventViewModel();
        model.initialize(recurringTestEvent);

        model.eventTitleTextController.text = 'Updated Title';
        model.isRecurring = false;

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenAnswer((_) async {
          return QueryResult(
            source: QueryResultSource.network,
            data: {'updateEvent': {}},
            options: QueryOptions(document: gql(EventQueries().updateEvent())),
          );
        });

        await model.execute();

        final captured = verify(
          eventService.editEvent(
            variables: captureAnyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).captured.first as Map<String, dynamic>;

        expect(captured['recurring'], false);
      });

      test('updates non-recurring event to recurring', () async {
        final model = EditEventViewModel();
        model.initialize(testEvent);

        model.isRecurring = true;
        model.frequency = Frequency.daily;
        model.interval = 1;
        model.never = true;

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenAnswer((_) async {
          return QueryResult(
            source: QueryResultSource.network,
            data: {'updateEvent': {}},
            options: QueryOptions(document: gql(EventQueries().updateEvent())),
          );
        });

        await model.execute();

        final captured = verify(
          eventService.editEvent(
            variables: captureAnyNamed('variables'),
            recurrenceType: 'standalone',
          ),
        ).captured.first as Map<String, dynamic>;

        expect(captured['recurring'], true);
        expect(captured['recurrence'], isNotNull);
      });
    });

    group('Change Detection', () {
      test('only sends changed fields', () async {
        final model = EditEventViewModel();
        model.initialize(testEvent);

        // Only change title
        model.eventTitleTextController.text = 'New Title';

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenAnswer((_) async {
          return QueryResult(
            source: QueryResultSource.network,
            data: {'updateEvent': {}},
            options: QueryOptions(document: gql(EventQueries().updateEvent())),
          );
        });

        await model.execute();

        final captured = verify(
          eventService.editEvent(
            variables: captureAnyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).captured.first as Map<String, dynamic>;

        expect(captured['id'], 'event1');
        expect(captured['name'], 'New Title');
        expect(captured.containsKey('location'), false);
        expect(captured.containsKey('description'), false);
      });

      test('detects all field changes', () async {
        final model = EditEventViewModel();
        model.initialize(testEvent);

        model.eventTitleTextController.text = 'New Title';
        model.eventLocationTextController.text = 'New Location';
        model.eventDescriptionTextController.text = 'New Description';
        model.isPublicSwitch = false;
        model.isRegisterableSwitch = false;
        model.isAllDay = true;

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenAnswer((_) async {
          return QueryResult(
            source: QueryResultSource.network,
            data: {'updateEvent': {}},
            options: QueryOptions(document: gql(EventQueries().updateEvent())),
          );
        });

        await model.execute();

        final captured = verify(
          eventService.editEvent(
            variables: captureAnyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).captured.first as Map<String, dynamic>;

        expect(captured['name'], 'New Title');
        expect(captured['location'], 'New Location');
        expect(captured['description'], 'New Description');
        expect(captured['isPublic'], false);
        expect(captured['isRegisterable'], false);
        expect(captured['allDay'], true);
      });
    });

    group('Recurrence Settings Change Detection', () {
      test('detects frequency change', () async {
        final model = EditEventViewModel();
        model.initialize(recurringTestEvent);

        model.frequency = Frequency.daily;

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenAnswer((_) async {
          return QueryResult(
            source: QueryResultSource.network,
            data: {'updateEvent': {}},
            options: QueryOptions(document: gql(EventQueries().updateEvent())),
          );
        });

        await model.execute();

        // Should show limited options because recurrence settings changed
        verify(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).called(1);
      });

      test('detects interval change', () async {
        final model = EditEventViewModel();
        model.initialize(recurringTestEvent);

        model.interval = 2;
        model.repeatsEveryCountController.text = '2';

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenAnswer((_) async {
          return QueryResult(
            source: QueryResultSource.network,
            data: {'updateEvent': {}},
            options: QueryOptions(document: gql(EventQueries().updateEvent())),
          );
        });

        await model.execute();

        verify(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).called(1);
      });

      test('detects weekdays change', () async {
        final model = EditEventViewModel();
        model.initialize(recurringTestEvent);

        model.weekDays = {WeekDays.tuesday, WeekDays.thursday};

        when(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).thenAnswer((_) async {
          return QueryResult(
            source: QueryResultSource.network,
            data: {'updateEvent': {}},
            options: QueryOptions(document: gql(EventQueries().updateEvent())),
          );
        });

        await model.execute();

        verify(
          eventService.editEvent(
            variables: anyNamed('variables'),
            recurrenceType: anyNamed('recurrenceType'),
          ),
        ).called(1);
      });
    });
  });
}
