import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/manage_volunteer_group_view_model.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

// This file contains unit tests for the ManageVolunteerGroupViewModel.
// It ensures that all methods and functionalities of the view model are working correctly.
void main() {
  late ManageVolunteerGroupViewModel model;

  // Setup tasks to be run before all tests
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  // Clean up
  tearDownAll(() {
    unregisterServices();
  });

  group('ManageVolunteerGroupViewModel Tests', () {
    // Setup after every test.
    // Ensuring each test is independent by providing a new object for each class
    setUp(() {
      model = ManageVolunteerGroupViewModel();
    });

    // Tests the initialization of the view model.
    test("Test initialization", () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group =
          EventVolunteerGroup(id: "group1", volunteers: []);

      await model.initialize(event, group);

      expect(model.event.id, "1");
      expect(model.volunteers, isEmpty);
    });

    // Testing isFetchingVolunteers getter returning False as it is a final value
    test("Test isFetchingVolunteers getter", () {
      expect(model.isFetchingVolunteers, isFalse);
    });

    // Tests fetching the current organization users list.
    test("Test getCurrentOrgUsersList success", () async {
      final users = await model.getCurrentOrgUsersList();
      expect(users.length, 2);
      expect(users[0].id, "fakeUser1");
    });

    // Tests adding a volunteer to a group successfully.
    test("Test addVolunteerToGroup success", () async {
      final mockEventService = locator<EventService>();

      final mockResult = {
        'createEventVolunteer': {
          '_id': 'volunteer1',
        },
      };

      when(
        mockEventService.addVolunteerToGroup({
          'eventId': "1",
          'userId': "volunteer1",
          'groupId': "group1",
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          data: mockResult,
          source: QueryResultSource.network,
          options:
              QueryOptions(document: gql(EventQueries().addVolunteerToGroup())),
        ),
      );

      await model.addVolunteerToGroup("volunteer1", "1", "group1");

      expect(model.volunteers.length, 1);
      expect(model.volunteers.first.id, "volunteer1");
    });

    // Tests the failure case when adding a volunteer to a group.
    test("Test addVolunteerToGroup Failure", () async {
      final mockEventService = locator<EventService>();
      // Verify initial state
      expect(model.volunteers.length, 0);
      when(
        mockEventService.addVolunteerToGroup({
          'eventId': "1",
          'userId': "volunteer1",
          'groupId': "group1",
        }),
      ).thenThrow(Exception('Failed to add volunteer'));
      String log = "";
      await runZonedGuarded(
        () async {
          await model.addVolunteerToGroup("volunteer1", "1", "group1");
        },
        (error, stack) {
          expect(error, isA<Exception>());
          expect(error.toString(), contains('Failed to add volunteer'));
          expect(stack, isNotNull);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            log = line;
          },
        ),
      );
      expect(
        log,
        contains("Failed to add volunteer"),
      );
      expect(model.volunteers.length, 0);
      // Verify model is in a clean state after error
      expect(model.isFetchingVolunteers, isFalse);
    });

    // Tests removing a volunteer from a group successfully.
    test("Test removeVolunteerFromGroup success", () async {
      final mockEventService = locator<EventService>();
      final mockResult = {
        'removeEventVolunteer': {
          'id': 'volunteer1',
        },
      };

      when(
        mockEventService.removeVolunteerFromGroup({
          'id': 'volunteer1',
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          data: mockResult,
          source: QueryResultSource.network,
          options: QueryOptions(
            document: gql(EventQueries().removeVolunteerMutation()),
          ),
        ),
      );

      await model.removeVolunteerFromGroup("volunteer1");

      expect(model.volunteers.isEmpty, true);
    });

    // Tests the failure case when removing a volunteer from a group with null data.
    test("Test removeVolunteerFromGroup with null data", () async {
      final mockEventService = locator<EventService>();
      final int prevLength = model.volunteers.length;
      when(
        mockEventService.removeVolunteerFromGroup({
          'id': 'volunteer1',
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          data: null,
          source: QueryResultSource.network,
          options: QueryOptions(
            document: gql(EventQueries().removeVolunteerMutation()),
          ),
        ),
      );

      await model.removeVolunteerFromGroup("volunteer1");

      expect(model.volunteers.length, prevLength);
    });

    // Tests the failure case when removing a volunteer from a group with null removeEventVolunteer response.
    test(
        "Test removeVolunteerFromGroup with null removeEventVolunteer response",
        () async {
      final mockEventService = locator<EventService>();
      final int prevLength = model.volunteers.length;
      when(
        mockEventService.removeVolunteerFromGroup({
          'id': 'volunteer1',
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          data: {'removeEventVolunteer': null},
          source: QueryResultSource.network,
          options: QueryOptions(
            document: gql(EventQueries().removeVolunteerMutation()),
          ),
        ),
      );

      await model.removeVolunteerFromGroup("volunteer1");

      expect(model.volunteers.length, prevLength);
    });

    // Tests the failure case when removing a volunteer from a group.
    test("Test removeVolunteerFromGroup failure", () async {
      final mockEventService = locator<EventService>();
      final int prevlength = model.volunteers.length;
      when(
        mockEventService.removeVolunteerFromGroup(
          {
            'volunteerId': 'volunteer1',
          },
        ),
      ).thenThrow(Exception('Failed to remove volunteer'));
      String log = "";
      await runZonedGuarded(
        () async {
          await model.removeVolunteerFromGroup("volunteer1");
        },
        (error, stack) {
          expect(error, isA<Exception>());
          expect(stack, isNotNull);
          expect(error.toString(), contains('Failed to remove volunteer'));
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            log = line;
          },
        ),
      );

      expect(
        log,
        contains('Failed to remove volunteer'),
      );

      expect(model.volunteers.length, prevlength);
    });

    // Tests deleting a volunteer group successfully.
    test("Test deleteVolunteerGroup success", () async {
      final mockEventService = locator<EventService>();
      final mockResult = {
        'removeEventVolunteerGroup': {
          'id': 'group1',
        },
      };

      when(mockEventService.removeVolunteerGroup({"id": "group1"})).thenAnswer(
        (_) async => QueryResult(
          data: mockResult,
          source: QueryResultSource.network,
          options: QueryOptions(
            document: gql(EventQueries().removeEventVolunteerGroup()),
          ),
        ),
      );

      await model.deleteVolunteerGroup("group1");

      // Assuming the method should notify listeners
      verify(mockEventService.removeVolunteerGroup({"id": "group1"})).called(1);
    });

    // Tests the failure case when deleting a volunteer group.
    test("Test deleteVolunteerGroup failure", () async {
      final mockEventService = locator<EventService>();

      when(
        mockEventService.removeVolunteerGroup(
          {"id": "group1"},
        ),
      ).thenThrow(Exception("Failed to delete group"));

      String log = "";
      await runZonedGuarded(
        () async {
          await model.deleteVolunteerGroup("group1");
        },
        (error, stack) {
          expect(
            error,
            isA<Exception>(),
          );
          expect(error.toString(), contains('Failed to delete group'));
          expect(stack, isNotNull);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            log = line;
          },
        ),
      );

      expect(
        log,
        contains('Failed to delete group'),
      );

      // Assuming the method should notify listeners
      verify(mockEventService.removeVolunteerGroup({"id": "group1"})).called(1);
    });

    // Tests updating a volunteer group successfully.
    test("Test updateVolunteerGroup success", () async {
      final EventVolunteerGroup group = EventVolunteerGroup(id: "group1");

      final mockEventService = locator<EventService>();
      final mockResult = {
        'updateEventVolunteerGroup': {
          'id': 'group1',
        },
      };

      when(
        mockEventService.updateVolunteerGroup({
          'id': group.id,
          'data': {
            'eventId': "1",
            'name': "Updated Group",
            'volunteersRequired': 20,
          },
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          data: mockResult,
          source: QueryResultSource.network,
          options: QueryOptions(
            document: gql(EventQueries().updateVolunteerGroupMutation()),
          ),
        ),
      );

      await model.updateVolunteerGroup(group, "1", "Updated Group", 20);

      expect(group.name, "Updated Group");
      expect(group.volunteersRequired, 20);
    });

    // Tests the failure case when updating a volunteer group.
    test('Test updateVolunteerGroup failure', () async {
      final mockEventService = locator<EventService>();
      final group = EventVolunteerGroup(
        id: "group1",
        name: "Old Name",
        volunteersRequired: 0,
      );
      when(
        mockEventService.updateVolunteerGroup({
          'id': group.id,
          'data': {
            'eventId': "1",
            'name': "Updated Group",
            'volunteersRequired': 20,
          },
        }),
      ).thenThrow(Exception('Failed to update group'));
      String log = "";
      await runZonedGuarded(
        () async {
          await model.updateVolunteerGroup(group, "1", "Updated Group", 20);
        },
        (error, stack) {
          expect(
            error,
            isA<Exception>(),
          );
          expect(error.toString(), "Failed to update group");
          expect(stack, isNotNull);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            log = line;
          },
        ),
      );

      expect(
        log,
        contains('Failed to update group'),
      );
      expect(group.name, "Old Name");
      expect(group.volunteersRequired, 0);
    });

    // Tests the error print coverage when removing a volunteer from a group.
    test("Test removeVolunteerFromGroup error print coverage", () async {
      final mockEventService = locator<EventService>();
      when(
        mockEventService.removeVolunteerFromGroup({'id': 'volunteer1'}),
      ).thenThrow(Exception('Failed to remove volunteer'));
      String log = "";
      await runZonedGuarded(
        () async {
          await model.removeVolunteerFromGroup("volunteer1");
        },
        (error, stack) {},
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            log = line;
          },
        ),
      );
      expect(log, contains('Error removing volunteer:'));
      expect(log, contains('Failed to remove volunteer'));
    });
  });
}
