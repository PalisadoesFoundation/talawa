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
    test("Test isFetchingVolunteers getter", () async {
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
      when(
        mockEventService.addVolunteerToGroup({
          'eventId': "1",
          'userId': "volunteer1",
          'groupId': "group1",
        }),
      ).thenThrow(Exception('Failed to add volunteer'));
      try {
        await model.addVolunteerToGroup("volunteer1", "1", "group1");
      } catch (e) {
        expect(e.toString(), "Failed to add volunteer");
      }
      expect(model.volunteers.length, 0);
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

    // Tests the failure case when removing a volunteer from a group with null removeEventVolunteer.
    test("Test removeVolunteerFromGroup with null data", () async {
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
            'id': 'volunteer1',
          },
        ),
      ).thenThrow(Exception('Failed to remove volunteer'));
      try {
        await model.removeVolunteerFromGroup("volunteer1");
      } catch (e) {
        expect(e.toString(), "Failed to add volunteer");
      }
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
      try {
        await model.deleteVolunteerGroup("group1");
      } catch (e) {
        expect(e.toString(), "Failed to delete group");
      }

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
        volunteersRequired: -1,
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
      try {
        await model.updateVolunteerGroup(group, "1", "Updated Group", 20);
      } catch (e) {
        expect(e.toString(), contains('Failed to update group'));
      }
      expect(group.name, "Old Name");
      expect(group.volunteersRequired, -1);
    });
  });
}
