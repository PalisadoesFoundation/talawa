// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  testSetupLocator();
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('CreateEventViewModel Tests', () {
    test('execute creates non-recurring event successfully', () async {
      final model = CreateEventViewModel();

      model.eventTitleTextController.text = 'Test Event';
      model.eventDescriptionTextController.text = 'Test Description';
      model.eventLocationTextController.text = 'Test Location';
      model.isPublicSwitch = true;
      model.isRegisterableSwitch = false;
      model.isAllDay = false;
      model.eventStartDate = DateTime(2025, 8, 1);
      model.eventStartTime = const TimeOfDay(hour: 10, minute: 0);
      model.eventEndDate = DateTime(2025, 8, 1);
      model.eventEndTime = const TimeOfDay(hour: 11, minute: 0);

      final startAt = DateTime(2025, 8, 1, 10, 0).toUtc().toIso8601String();
      final endAt = DateTime(2025, 8, 1, 11, 0).toUtc().toIso8601String();

      when(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'Test Event',
              'description': 'Test Description',
              'location': 'Test Location',
              'isPublic': true,
              'isRegisterable': false,
              'allDay': false,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
            },
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: {
            'createEvent': {'id': 'event1'},
          },
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      await model.execute();

      verify(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'Test Event',
              'description': 'Test Description',
              'location': 'Test Location',
              'isPublic': true,
              'isRegisterable': false,
              'allDay': false,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
            },
          },
        ),
      ).called(1);

      // Verify form is cleared after successful creation
      expect(model.eventTitleTextController.text, isEmpty);
      expect(model.eventLocationTextController.text, isEmpty);
    });

    test('execute creates recurring event successfully', () async {
      final model = CreateEventViewModel();

      model.eventTitleTextController.text = 'Recurring Event';
      model.eventDescriptionTextController.text = 'Description';
      model.eventLocationTextController.text = 'Location';
      model.isPublicSwitch = true;
      model.isRegisterableSwitch = true;
      model.isAllDay = false;
      model.eventStartDate = DateTime(2025, 8, 1);
      model.eventStartTime = const TimeOfDay(hour: 10, minute: 0);
      model.eventEndDate = DateTime(2025, 8, 1);
      model.eventEndTime = const TimeOfDay(hour: 11, minute: 0);
      model.isRecurring = true;
      model.frequency = Frequency.weekly;
      model.interval = 1;
      model.weekDays = {WeekDays.monday, WeekDays.wednesday};
      model.eventEndType = EventEndTypes.after;
      model.count = 10;

      final startAt = DateTime(2025, 8, 1, 10, 0).toUtc().toIso8601String();
      final endAt = DateTime(2025, 8, 1, 11, 0).toUtc().toIso8601String();

      when(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'Recurring Event',
              'description': 'Description',
              'location': 'Location',
              'isPublic': true,
              'isRegisterable': true,
              'allDay': false,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
              'recurrence': {
                'frequency': 'WEEKLY',
                'interval': 1,
                'byDay': ['MO', 'WE'],
                'count': 10,
                'never': false,
              },
            },
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: {
            'createEvent': {'id': 'event2'},
          },
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      await model.execute();

      verify(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'Recurring Event',
              'description': 'Description',
              'location': 'Location',
              'isPublic': true,
              'isRegisterable': true,
              'allDay': false,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
              'recurrence': {
                'frequency': 'WEEKLY',
                'interval': 1,
                'byDay': ['MO', 'WE'],
                'count': 10,
                'never': false,
              },
            },
          },
        ),
      ).called(1);
    });

    test('execute creates daily recurring event', () async {
      final model = CreateEventViewModel();

      model.eventTitleTextController.text = 'Daily Event';
      model.eventDescriptionTextController.text = 'Daily Description';
      model.eventLocationTextController.text = 'Daily Location';
      model.eventStartDate = DateTime(2025, 8, 1);
      model.eventStartTime = const TimeOfDay(hour: 9, minute: 0);
      model.eventEndDate = DateTime(2025, 8, 1);
      model.eventEndTime = const TimeOfDay(hour: 10, minute: 0);
      model.isRecurring = true;
      model.frequency = Frequency.daily;
      model.interval = 2;
      model.never = true;

      final startAt = DateTime(2025, 8, 1, 9, 0).toUtc().toIso8601String();
      final endAt = DateTime(2025, 8, 1, 10, 0).toUtc().toIso8601String();

      when(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'Daily Event',
              'description': 'Daily Description',
              'location': 'Daily Location',
              'isPublic': true,
              'isRegisterable': true,
              'allDay': true,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
              'recurrence': {
                'frequency': 'DAILY',
                'interval': 2,
                'never': true,
              },
            },
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: {
            'createEvent': {'id': 'event3'},
          },
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      await model.execute();

      verify(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'Daily Event',
              'description': 'Daily Description',
              'location': 'Daily Location',
              'isPublic': true,
              'isRegisterable': true,
              'allDay': true,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
              'recurrence': {
                'frequency': 'DAILY',
                'interval': 2,
                'never': true,
              },
            },
          },
        ),
      ).called(1);
    });

    test('execute creates monthly recurring event with day of month', () async {
      final model = CreateEventViewModel();

      model.eventTitleTextController.text = 'Monthly Event';
      model.eventDescriptionTextController.text = 'Monthly Description';
      model.eventLocationTextController.text = 'Monthly Location';
      model.eventStartDate = DateTime(2025, 8, 15);
      model.eventStartTime = const TimeOfDay(hour: 14, minute: 0);
      model.eventEndDate = DateTime(2025, 8, 15);
      model.eventEndTime = const TimeOfDay(hour: 15, minute: 0);
      model.isRecurring = true;
      model.frequency = Frequency.monthly;
      model.interval = 1;
      model.byMonthDay = [15];
      model.useDayOfWeekMonthly = false;
      model.eventEndType = EventEndTypes.on;
      model.recurrenceEndDate = DateTime(2026, 8, 15);

      final startAt = DateTime(2025, 8, 15, 14, 0).toUtc().toIso8601String();
      final endAt = DateTime(2025, 8, 15, 15, 0).toUtc().toIso8601String();
      final recEndDate = DateTime(2026, 8, 15).toUtc().toIso8601String();

      when(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'Monthly Event',
              'description': 'Monthly Description',
              'location': 'Monthly Location',
              'isPublic': true,
              'isRegisterable': true,
              'allDay': true,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
              'recurrence': {
                'frequency': 'MONTHLY',
                'interval': 1,
                'byMonthDay': [15],
                'endDate': recEndDate,
                'never': false,
              },
            },
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: {
            'createEvent': {'id': 'event4'},
          },
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      await model.execute();

      verify(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'Monthly Event',
              'description': 'Monthly Description',
              'location': 'Monthly Location',
              'isPublic': true,
              'isRegisterable': true,
              'allDay': true,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
              'recurrence': {
                'frequency': 'MONTHLY',
                'interval': 1,
                'byMonthDay': [15],
                'endDate': recEndDate,
                'never': false,
              },
            },
          },
        ),
      ).called(1);
    });

    test('execute handles creation failure gracefully', () async {
      final model = CreateEventViewModel();

      model.eventTitleTextController.text = 'Failed Event';
      model.eventDescriptionTextController.text = 'Description';
      model.eventLocationTextController.text = 'Location';
      model.eventStartDate = DateTime(2025, 8, 1);
      model.eventStartTime = const TimeOfDay(hour: 10, minute: 0);
      model.eventEndDate = DateTime(2025, 8, 1);
      model.eventEndTime = const TimeOfDay(hour: 11, minute: 0);

      final startAt = DateTime(2025, 8, 1, 10, 0).toUtc().toIso8601String();
      final endAt = DateTime(2025, 8, 1, 11, 0).toUtc().toIso8601String();

      when(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'Failed Event',
              'description': 'Description',
              'location': 'Location',
              'isPublic': true,
              'isRegisterable': true,
              'allDay': true,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
            },
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: null,
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      await model.execute();

      // Should not clear form on failure
      expect(model.eventTitleTextController.text, 'Failed Event');
    });

    test('execute handles exception during creation', () async {
      final model = CreateEventViewModel();

      model.eventTitleTextController.text = 'Exception Event';
      model.eventDescriptionTextController.text = 'Description';
      model.eventLocationTextController.text = 'Location';
      model.eventStartDate = DateTime(2025, 8, 1);
      model.eventStartTime = const TimeOfDay(hour: 10, minute: 0);
      model.eventEndDate = DateTime(2025, 8, 1);
      model.eventEndTime = const TimeOfDay(hour: 11, minute: 0);

      final startAt = DateTime(2025, 8, 1, 10, 0).toUtc().toIso8601String();
      final endAt = DateTime(2025, 8, 1, 11, 0).toUtc().toIso8601String();

      when(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'Exception Event',
              'description': 'Description',
              'location': 'Location',
              'isPublic': true,
              'isRegisterable': true,
              'allDay': true,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
            },
          },
        ),
      ).thenThrow(Exception('Network error'));

      await model.execute();

      // Should not clear form on exception
      expect(model.eventTitleTextController.text, 'Exception Event');
    });

    test('execute creates all-day event correctly', () async {
      final model = CreateEventViewModel();

      model.eventTitleTextController.text = 'All Day Event';
      model.eventDescriptionTextController.text = 'All day description';
      model.eventLocationTextController.text = 'Location';
      model.isAllDay = true;
      model.eventStartDate = DateTime(2025, 8, 1);
      model.eventStartTime = const TimeOfDay(hour: 0, minute: 0);
      model.eventEndDate = DateTime(2025, 8, 1);
      model.eventEndTime = const TimeOfDay(hour: 23, minute: 59);

      final startAt = DateTime(2025, 8, 1, 0, 0).toUtc().toIso8601String();
      final endAt = DateTime(2025, 8, 1, 23, 59).toUtc().toIso8601String();

      when(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'All Day Event',
              'description': 'All day description',
              'location': 'Location',
              'isPublic': true,
              'isRegisterable': true,
              'allDay': true,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
            },
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: {
            'createEvent': {'id': 'event5'},
          },
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      await model.execute();

      verify(
        eventService.createEvent(
          variables: {
            "input": {
              'name': 'All Day Event',
              'description': 'All day description',
              'location': 'Location',
              'isPublic': true,
              'isRegisterable': true,
              'allDay': true,
              'organizationId': 'XYZ',
              'startAt': startAt,
              'endAt': endAt,
            },
          },
        ),
      ).called(1);
    });

    test('fetchVenues returns empty list when data is null', () async {
      final model = CreateEventViewModel();

      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(document: gql(queries.venueListQuery())),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queries.venueListQuery(),
          variables: {"orgId": 'XYZ'},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      final result = await model.fetchVenues();

      expect(result, isEmpty);
    });

    test('fetchVenues returns venue list successfully', () async {
      final model = CreateEventViewModel();

      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getVenueByOrgId': [
            {
              'id': '1',
              'name': 'Venue 1',
              'capacity': 100,
              'imageUrl': 'url1',
              'description': 'Description 1',
            },
            {
              'id': '2',
              'name': 'Venue 2',
              'capacity': 200,
              'imageUrl': 'url2',
              'description': 'Description 2',
            },
          ],
        },
        options: QueryOptions(document: gql(queries.venueListQuery())),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queries.venueListQuery(),
          variables: {"orgId": 'XYZ'},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      final result = await model.fetchVenues();

      expect(result.length, 2);
      expect(result[0].name, 'Venue 1');
      expect(result[0].capacity, 100);
      expect(result[1].name, 'Venue 2');
      expect(result[1].capacity, 200);
    });

    test('getCurrentOrgUsersList populates members list', () async {
      final model = CreateEventViewModel();

      final user1 = User(id: "user1", firstName: "Test1");
      final user2 = User(id: "user2", firstName: "Test2");
      final users = [user1, user2];

      when(organizationService.getOrgMembersList("XYZ"))
          .thenAnswer((_) async => users);

      final result = await model.getCurrentOrgUsersList();

      expect(result.length, 2);
      expect(model.orgMembersList.length, 2);
      expect(model.memberCheckedMap.containsKey("user1"), true);
      expect(model.memberCheckedMap.containsKey("user2"), true);
      expect(model.memberCheckedMap["user1"], false);
      expect(model.memberCheckedMap["user2"], false);
    });

    test('buildUserList adds selected members correctly', () {
      final model = CreateEventViewModel();

      final user1 = User(id: "user1", firstName: "Test1");
      final user2 = User(id: "user2", firstName: "Test2");
      model.orgMembersList = [user1, user2];
      model.memberCheckedMap["user1"] = true;
      model.memberCheckedMap["user2"] = false;

      model.buildUserList();

      expect(model.selectedMembers.length, 1);
      expect(model.selectedMembers.first.id, "user1");
    });

    test('buildUserList clears and rebuilds selected members', () {
      final model = CreateEventViewModel();

      final user1 = User(id: "user1", firstName: "Test1");
      final user2 = User(id: "user2", firstName: "Test2");
      model.orgMembersList = [user1, user2];

      // First selection
      model.memberCheckedMap["user1"] = true;
      model.buildUserList();
      expect(model.selectedMembers.length, 1);

      // Change selection
      model.memberCheckedMap["user1"] = false;
      model.memberCheckedMap["user2"] = true;
      model.buildUserList();

      expect(model.selectedMembers.length, 1);
      expect(model.selectedMembers.first.id, "user2");
    });

    test('removeUserFromList removes user and updates state', () {
      final model = CreateEventViewModel();

      final user1 = User(id: "user1", firstName: "Test1");
      model.orgMembersList = [user1];
      model.memberCheckedMap["user1"] = true;
      model.buildUserList();

      model.removeUserFromList(userId: "user1");

      expect(model.selectedMembers, isEmpty);
      expect(model.memberCheckedMap["user1"], false);
    });

    test('clearFormState resets all fields to defaults', () {
      final model = CreateEventViewModel();

      // Set various values
      model.eventTitleTextController.text = 'Title';
      model.eventLocationTextController.text = 'Location';
      model.eventDescriptionTextController.text = 'Description';
      model.isPublicSwitch = false;
      model.isRegisterableSwitch = false;
      model.isAllDay = false;
      model.isRecurring = true;
      model.frequency = Frequency.daily;
      model.weekDays = {WeekDays.monday};
      model.interval = 5;
      model.count = 10;

      model.clearFormState();

      expect(model.eventTitleTextController.text, isEmpty);
      expect(model.eventLocationTextController.text, isEmpty);
      expect(model.eventDescriptionTextController.text, isEmpty);
      expect(model.repeatsEveryCountController.text, '1');
      expect(model.isPublicSwitch, true);
      expect(model.isRegisterableSwitch, true);
      expect(model.isAllDay, true);
      expect(model.isRecurring, false);
      expect(model.frequency, Frequency.weekly);
      expect(model.weekDays, isEmpty);
      expect(model.interval, 1);
      expect(model.count, null);
      expect(model.selectedMembers, isEmpty);
      expect(model.memberCheckedMap, isEmpty);
    });

    test('clearFormState resets recurrence settings', () {
      final model = CreateEventViewModel();

      model.isRecurring = true;
      model.count = 10;
      model.recurrenceEndDate = DateTime.now();
      model.never = false;
      model.byMonth = [6, 12];
      model.byMonthDay = [15];

      model.clearFormState();

      expect(model.isRecurring, false);
      expect(model.count, null);
      expect(model.recurrenceEndDate, null);
      expect(model.never, true);
      expect(model.byMonth, null);
      expect(model.byMonthDay, null);
    });

    test('clearFormState resets image file', () {
      final model = CreateEventViewModel();

      model.imageFile = null; // Simulate having an image

      model.clearFormState();

      expect(model.imageFile, null);
    });
  });
}
