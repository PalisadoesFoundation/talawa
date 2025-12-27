import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
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

      // Exception should be caught and handled gracefully without bubbling up
      await model.addVolunteerToGroup("volunteer1", "1", "group1");

      // Verify model is in a clean state after error (no volunteers added)
      expect(model.volunteers.length, 0);
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
            'id': 'volunteer1',
          },
        ),
      ).thenThrow(Exception('Failed to remove volunteer'));

      // Exception should be caught and handled gracefully without bubbling up
      await model.removeVolunteerFromGroup("volunteer1");

      // Volunteers list should remain unchanged after error
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

      // Exception should be caught and handled gracefully without bubbling up
      await model.deleteVolunteerGroup("group1");

      // Verify service was called
      verify(mockEventService.removeVolunteerGroup({"id": "group1"})).called(1);

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

      // Exception should be caught and handled gracefully without bubbling up
      await model.updateVolunteerGroup(group, "1", "Updated Group", 20);

      // Original values should remain unchanged after error
      expect(group.name, "Old Name");
      expect(group.volunteersRequired, 0);
    });

    // ============================================================
    // EXCEPTION HANDLING TESTS - Test GraphQL exception handling
    // ============================================================

    test(
        "Test addVolunteerToGroup handles QueryResult with exception gracefully",
        () async {
      final mockEventService = locator<EventService>();

      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to add volunteer')
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().addVolunteerToGroup()),
        ),
      );

      when(
        mockEventService.addVolunteerToGroup({
          'eventId': "1",
          'userId': "volunteer1",
          'groupId': "group1",
        }),
      ).thenAnswer((_) async => mockResultWithException);

      await model.addVolunteerToGroup("volunteer1", "1", "group1");

      // Should handle exception gracefully
      expect(model.volunteers.length, 0);
    });

    test(
        "Test addVolunteerToGroup handles QueryResult with null data gracefully",
        () async {
      final mockEventService = locator<EventService>();

      final mockResultWithNullData = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(
          document: gql(EventQueries().addVolunteerToGroup()),
        ),
      );

      when(
        mockEventService.addVolunteerToGroup({
          'eventId': "1",
          'userId': "volunteer1",
          'groupId': "group1",
        }),
      ).thenAnswer((_) async => mockResultWithNullData);

      await model.addVolunteerToGroup("volunteer1", "1", "group1");

      // Should handle null data gracefully
      expect(model.volunteers.length, 0);
    });

    test(
        "Test addVolunteerToGroup handles QueryResult with missing mutation data gracefully",
        () async {
      final mockEventService = locator<EventService>();

      final mockResultWithMissingData = QueryResult(
        source: QueryResultSource.network,
        data: {
          // Data exists but mutation field is missing
          'otherField': 'value',
        },
        options: QueryOptions(
          document: gql(EventQueries().addVolunteerToGroup()),
        ),
      );

      when(
        mockEventService.addVolunteerToGroup({
          'eventId': "1",
          'userId': "volunteer1",
          'groupId': "group1",
        }),
      ).thenAnswer((_) async => mockResultWithMissingData);

      await model.addVolunteerToGroup("volunteer1", "1", "group1");

      // Should handle missing mutation data gracefully
      expect(model.volunteers.length, 0);
    });

    test(
        "Test deleteVolunteerGroup handles QueryResult with exception gracefully",
        () async {
      final mockEventService = getAndRegisterEventService();

      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to delete group')
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().removeEventVolunteerGroup()),
        ),
      );

      when(mockEventService.removeVolunteerGroup({"id": "group1"}))
          .thenAnswer((_) async => mockResultWithException);

      await model.deleteVolunteerGroup("group1");

      // Should handle exception gracefully
      verify(mockEventService.removeVolunteerGroup({"id": "group1"})).called(1);
    });

    test(
        "Test deleteVolunteerGroup handles QueryResult with null data gracefully",
        () async {
      final mockEventService = locator<EventService>();

      final mockResultWithNullData = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(
          document: gql(EventQueries().removeEventVolunteerGroup()),
        ),
      );

      when(mockEventService.removeVolunteerGroup({"id": "group1"}))
          .thenAnswer((_) async => mockResultWithNullData);

      await model.deleteVolunteerGroup("group1");

      // Should handle null data gracefully
      verify(mockEventService.removeVolunteerGroup({"id": "group1"})).called(1);
    });

    test(
        "Test deleteVolunteerGroup handles QueryResult with missing mutation data gracefully",
        () async {
      final mockEventService = locator<EventService>();

      final mockResultWithMissingData = QueryResult(
        source: QueryResultSource.network,
        data: {
          // Data exists but mutation field is missing
          'otherField': 'value',
        },
        options: QueryOptions(
          document: gql(EventQueries().removeEventVolunteerGroup()),
        ),
      );

      when(mockEventService.removeVolunteerGroup({"id": "group1"}))
          .thenAnswer((_) async => mockResultWithMissingData);

      await model.deleteVolunteerGroup("group1");

      // Should handle missing mutation data gracefully
      verify(mockEventService.removeVolunteerGroup({"id": "group1"})).called(1);
    });

    test(
        "Test removeVolunteerFromGroup handles QueryResult with exception gracefully",
        () async {
      final mockEventService = locator<EventService>();
      final int prevLength = model.volunteers.length;

      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to remove volunteer')
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().removeVolunteerMutation()),
        ),
      );

      when(
        mockEventService.removeVolunteerFromGroup({
          'id': 'volunteer1',
        }),
      ).thenAnswer((_) async => mockResultWithException);

      await model.removeVolunteerFromGroup("volunteer1");

      // Should not crash, volunteers should remain unchanged
      expect(model.volunteers.length, prevLength);
    });

    test(
        "Test updateVolunteerGroup handles QueryResult with exception gracefully",
        () async {
      final mockEventService = locator<EventService>();
      final group = EventVolunteerGroup(
        id: "group1",
        name: "Old Name",
        volunteersRequired: 5,
      );

      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to update group')
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().updateVolunteerGroupMutation()),
        ),
      );

      when(
        mockEventService.updateVolunteerGroup({
          'id': group.id,
          'data': {
            'eventId': "1",
            'name': "New Name",
            'volunteersRequired': 10,
          },
        }),
      ).thenAnswer((_) async => mockResultWithException);

      await model.updateVolunteerGroup(group, "1", "New Name", 10);

      // Original values should remain unchanged
      expect(group.name, "Old Name");
      expect(group.volunteersRequired, 5);
    });

    test(
        "Test updateVolunteerGroup handles QueryResult with null data gracefully",
        () async {
      final mockEventService = locator<EventService>();
      final group = EventVolunteerGroup(
        id: "group1",
        name: "Old Name",
        volunteersRequired: 5,
      );

      final mockResultWithNullData = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(
          document: gql(EventQueries().updateVolunteerGroupMutation()),
        ),
      );

      when(
        mockEventService.updateVolunteerGroup({
          'id': group.id,
          'data': {
            'eventId': "1",
            'name': "New Name",
            'volunteersRequired': 10,
          },
        }),
      ).thenAnswer((_) async => mockResultWithNullData);

      await model.updateVolunteerGroup(group, "1", "New Name", 10);

      // Original values should remain unchanged
      expect(group.name, "Old Name");
      expect(group.volunteersRequired, 5);
    });

    test(
        "Test updateVolunteerGroup handles QueryResult with missing mutation data gracefully",
        () async {
      final mockEventService = locator<EventService>();
      final group = EventVolunteerGroup(
        id: "group1",
        name: "Old Name",
        volunteersRequired: 5,
      );

      final mockResultWithMissingData = QueryResult(
        source: QueryResultSource.network,
        data: {
          // Data exists but mutation field is missing
          'otherField': 'value',
        },
        options: QueryOptions(
          document: gql(EventQueries().updateVolunteerGroupMutation()),
        ),
      );

      when(
        mockEventService.updateVolunteerGroup({
          'id': group.id,
          'data': {
            'eventId': "1",
            'name': "New Name",
            'volunteersRequired': 10,
          },
        }),
      ).thenAnswer((_) async => mockResultWithMissingData);

      await model.updateVolunteerGroup(group, "1", "New Name", 10);

      // Original values should remain unchanged
      expect(group.name, "Old Name");
      expect(group.volunteersRequired, 5);
    });

    // ============================================================
    // NULL RESULT TESTS - Test when GraphQL service returns null
    // ============================================================

    test('addVolunteerToGroup handles empty data gracefully', () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group =
          EventVolunteerGroup(id: "group1", volunteers: []);

      await model.initialize(event, group);
      final initialVolunteersCount = model.volunteers.length;

      final mockEventService = getAndRegisterEventService();

      when(
        mockEventService.addVolunteerToGroup({
          'eventId': '1',
          'userId': 'volunteer1',
          'groupId': 'group1',
        }),
      ).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      await model.addVolunteerToGroup('volunteer1', '1', 'group1');

      // Volunteers list should remain unchanged
      expect(model.volunteers.length, initialVolunteersCount);
    });

    test('deleteVolunteerGroup handles empty data gracefully', () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group =
          EventVolunteerGroup(id: "group1", volunteers: []);

      await model.initialize(event, group);

      final mockEventService = getAndRegisterEventService();

      when(
        mockEventService.removeVolunteerGroup({'id': 'group1'}),
      ).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(
              document: gql(EventQueries().removeEventVolunteerGroup()),
            ),
          ));

      // Should handle gracefully without crashing
      await model.deleteVolunteerGroup('group1');

      // No exception should be thrown
      expect(true, true);
    });

    test('removeVolunteerFromGroup handles empty data gracefully', () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group =
          EventVolunteerGroup(id: "group1", volunteers: []);

      await model.initialize(event, group);
      final initialVolunteersCount = model.volunteers.length;

      final mockEventService = getAndRegisterEventService();

      when(
        mockEventService.removeVolunteerFromGroup({'id': 'volunteer1'}),
      ).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(
              document: gql(EventQueries().removeVolunteerMutation()),
            ),
          ));

      await model.removeVolunteerFromGroup('volunteer1');

      // Volunteers list should remain unchanged
      expect(model.volunteers.length, initialVolunteersCount);
    });

    test('updateVolunteerGroup handles empty data gracefully', () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group = EventVolunteerGroup(
        id: "group1",
        name: "Old Name",
        volunteersRequired: 5,
        volunteers: [],
      );

      await model.initialize(event, group);

      final mockEventService = getAndRegisterEventService();

      when(
        mockEventService.updateVolunteerGroup({
          'id': group.id,
          'data': {
            'eventId': "1",
            'name': "New Name",
            'volunteersRequired': 10,
          },
        }),
      ).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(
              document: gql(EventQueries().updateVolunteerGroupMutation()),
            ),
          ));

      await model.updateVolunteerGroup(group, "1", "New Name", 10);

      // Original values should remain unchanged
      expect(group.name, "Old Name");
      expect(group.volunteersRequired, 5);
    });

    // ============================================================
    // ADDITIONAL COVERAGE TESTS
    // ============================================================

    test('memberCheckedMap getter returns the map', () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group =
          EventVolunteerGroup(id: "group1", volunteers: []);

      await model.initialize(event, group);

      // Access the memberCheckedMap getter (line 25)
      expect(model.memberCheckedMap, isA<Map<String, bool>>());
      expect(model.memberCheckedMap, isEmpty);
    });

    test(
        'removeVolunteerFromGroup handles response with null removeEventVolunteer',
        () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group =
          EventVolunteerGroup(id: "group1", volunteers: []);

      await model.initialize(event, group);

      final mockEventService = getAndRegisterEventService();

      // Mock response where data exists but removeEventVolunteer is null
      final mockResultWithNullField = QueryResult(
        source: QueryResultSource.network,
        data: {
          'removeEventVolunteer': null,
        },
        options: QueryOptions(
          document: gql(EventQueries().removeVolunteerMutation()),
        ),
      );

      when(
        mockEventService.removeVolunteerFromGroup({'id': 'volunteer1'}),
      ).thenAnswer((_) async => mockResultWithNullField);

      await model.removeVolunteerFromGroup('volunteer1');

      // Should print 'Failed to remove volunteer.' - line 212 covered
      expect(model.volunteers.length, 0);
    });

    test('removeVolunteerFromGroup handles exception thrown by service',
        () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group =
          EventVolunteerGroup(id: "group1", volunteers: []);

      await model.initialize(event, group);

      final mockEventService = getAndRegisterEventService();

      // Mock service to throw an exception
      when(
        mockEventService.removeVolunteerFromGroup({'id': 'volunteer1'}),
      ).thenThrow(Exception('Network error'));

      // Should handle gracefully without crashing - line 215 covered
      await model.removeVolunteerFromGroup('volunteer1');

      expect(model.volunteers.length, 0);
    });

    // ============================================================
    // ADDITIONAL ERROR CASE TESTS - Comprehensive exception handling
    // ============================================================

    test('addVolunteerToGroup handles QueryResult with multiple GraphQL errors',
        () async {
      final mockEventService = locator<EventService>();

      final mockResultWithMultipleErrors = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Error 1'),
            GraphQLError(message: 'Error 2'),
            GraphQLError(message: 'Error 3'),
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().addVolunteerToGroup()),
        ),
      );

      when(
        mockEventService.addVolunteerToGroup({
          'eventId': "1",
          'userId': "volunteer1",
          'groupId': "group1",
        }),
      ).thenAnswer((_) async => mockResultWithMultipleErrors);

      await model.addVolunteerToGroup("volunteer1", "1", "group1");

      // Should handle multiple errors gracefully
      expect(model.volunteers.length, 0);
      expect(model.isFetchingVolunteers, isFalse);
    });

    test('deleteVolunteerGroup handles QueryResult with linkException',
        () async {
      final mockEventService = locator<EventService>();

      final mockResultWithLinkException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: UnknownException(
            Exception('Network connection failed'),
            StackTrace.current,
          ),
          graphqlErrors: const [],
        ),
        options: QueryOptions(
          document: gql(EventQueries().removeEventVolunteerGroup()),
        ),
      );

      when(mockEventService.removeVolunteerGroup({"id": "group1"}))
          .thenAnswer((_) async => mockResultWithLinkException);

      await model.deleteVolunteerGroup("group1");

      // Should handle linkException gracefully
      verify(mockEventService.removeVolunteerGroup({"id": "group1"})).called(1);
    });

    test(
        'removeVolunteerFromGroup handles QueryResult with empty graphqlErrors',
        () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group = EventVolunteerGroup(
        id: "group1",
        volunteers: [EventVolunteer(id: 'volunteer1')],
      );
      await model.initialize(event, group);

      expect(model.volunteers.length, 1);

      final mockEventService = locator<EventService>();

      final mockResultWithEmptyErrors = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [],
        ),
        options: QueryOptions(
          document: gql(EventQueries().removeVolunteerMutation()),
        ),
      );

      when(
        mockEventService.removeVolunteerFromGroup({'id': 'volunteer1'}),
      ).thenAnswer((_) async => mockResultWithEmptyErrors);

      await model.removeVolunteerFromGroup("volunteer1");

      // Should handle exception with empty errors gracefully
      expect(model.volunteers.length, 1); // Volunteer should remain
      expect(model.isFetchingVolunteers, isFalse);
    });

    test(
        'updateVolunteerGroup handles QueryResult with exception and preserves group state',
        () async {
      final mockEventService = locator<EventService>();
      final group = EventVolunteerGroup(
        id: "group1",
        name: "Original Name",
        volunteersRequired: 5,
        volunteers: [EventVolunteer(id: 'volunteer1')],
      );

      // Store original state
      final originalName = group.name;
      final originalVolunteersRequired = group.volunteersRequired;
      final originalVolunteersCount = group.volunteers?.length ?? 0;

      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Update failed'),
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().updateVolunteerGroupMutation()),
        ),
      );

      when(
        mockEventService.updateVolunteerGroup({
          'id': group.id,
          'data': {
            'eventId': "1",
            'name': "New Name",
            'volunteersRequired': 10,
          },
        }),
      ).thenAnswer((_) async => mockResultWithException);

      await model.updateVolunteerGroup(group, "1", "New Name", 10);

      // All original state should be preserved after exception
      expect(group.name, originalName);
      expect(group.volunteersRequired, originalVolunteersRequired);
      expect(group.volunteers?.length, originalVolunteersCount);
      expect(model.isFetchingVolunteers, isFalse);
    });

    test(
        'addVolunteerToGroup handles QueryResult with exception when volunteers list already has items',
        () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group = EventVolunteerGroup(
        id: "group1",
        volunteers: [EventVolunteer(id: 'existingVolunteer')],
      );
      await model.initialize(event, group);

      expect(model.volunteers.length, 1);

      final mockEventService = locator<EventService>();

      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to add volunteer'),
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().addVolunteerToGroup()),
        ),
      );

      when(
        mockEventService.addVolunteerToGroup({
          'eventId': "1",
          'userId': "volunteer1",
          'groupId': "group1",
        }),
      ).thenAnswer((_) async => mockResultWithException);

      await model.addVolunteerToGroup("volunteer1", "1", "group1");

      // Existing volunteers should remain unchanged
      expect(model.volunteers.length, 1);
      expect(model.volunteers.first.id, "existingVolunteer");
      expect(model.isFetchingVolunteers, isFalse);
    });

    test(
        'deleteVolunteerGroup handles QueryResult with exception and null data combination',
        () async {
      final mockEventService = locator<EventService>();

      // Test case where both exception exists and data is null
      final mockResultWithExceptionAndNullData = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Server error'),
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().removeEventVolunteerGroup()),
        ),
      );

      when(mockEventService.removeVolunteerGroup({"id": "group1"}))
          .thenAnswer((_) async => mockResultWithExceptionAndNullData);

      await model.deleteVolunteerGroup("group1");

      // Should handle exception (exception check happens before null data check)
      verify(mockEventService.removeVolunteerGroup({"id": "group1"})).called(1);
    });

    test(
        'removeVolunteerFromGroup handles QueryResult with exception when removing from non-empty list',
        () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group = EventVolunteerGroup(
        id: "group1",
        volunteers: [
          EventVolunteer(id: 'volunteer1'),
          EventVolunteer(id: 'volunteer2'),
          EventVolunteer(id: 'volunteer3'),
        ],
      );
      await model.initialize(event, group);

      expect(model.volunteers.length, 3);

      final mockEventService = locator<EventService>();

      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to remove'),
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().removeVolunteerMutation()),
        ),
      );

      when(
        mockEventService.removeVolunteerFromGroup({'id': 'volunteer2'}),
      ).thenAnswer((_) async => mockResultWithException);

      await model.removeVolunteerFromGroup("volunteer2");

      // All volunteers should remain unchanged after exception
      expect(model.volunteers.length, 3);
      expect(model.volunteers.map((v) => v.id).toSet(),
          {'volunteer1', 'volunteer2', 'volunteer3'});
      expect(model.isFetchingVolunteers, isFalse);
    });

    // ============================================================
    // CONCURRENT OPERATIONS TESTS
    // ============================================================

    test('handles multiple concurrent addVolunteerToGroup calls correctly',
        () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group =
          EventVolunteerGroup(id: "group1", volunteers: []);
      await model.initialize(event, group);

      final mockEventService = locator<EventService>();

      // Mock successful responses for all calls
      when(mockEventService.addVolunteerToGroup({
        'eventId': "1",
        'userId': "volunteer1",
        'groupId': "group1",
      })).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: {
              'createEventVolunteer': {'_id': 'volunteer1', 'userId': 'user1'}
            },
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      when(mockEventService.addVolunteerToGroup({
        'eventId': "1",
        'userId': "volunteer2",
        'groupId': "group1",
      })).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: {
              'createEventVolunteer': {'_id': 'volunteer2', 'userId': 'user2'}
            },
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      when(mockEventService.addVolunteerToGroup({
        'eventId': "1",
        'userId': "volunteer3",
        'groupId': "group1",
      })).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: {
              'createEventVolunteer': {'_id': 'volunteer3', 'userId': 'user3'}
            },
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      // Fire all operations concurrently
      await Future.wait([
        model.addVolunteerToGroup("volunteer1", "1", "group1"),
        model.addVolunteerToGroup("volunteer2", "1", "group1"),
        model.addVolunteerToGroup("volunteer3", "1", "group1"),
      ]);

      // Verify final state is consistent
      expect(model.volunteers.length, 3);
      expect(model.volunteers.map((v) => v.id).toSet(),
          {'volunteer1', 'volunteer2', 'volunteer3'});
      expect(model.isFetchingVolunteers, isFalse);
    });

    test(
        'handles concurrent addVolunteerToGroup with different resolution orders',
        () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group =
          EventVolunteerGroup(id: "group1", volunteers: []);
      await model.initialize(event, group);

      final mockEventService = locator<EventService>();

      // Mock: first call succeeds, second has exception, third has null data
      when(mockEventService.addVolunteerToGroup({
        'eventId': "1",
        'userId': "volunteer1",
        'groupId': "group1",
      })).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: {
              'createEventVolunteer': {'_id': 'volunteer1', 'userId': 'user1'}
            },
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      when(mockEventService.addVolunteerToGroup({
        'eventId': "1",
        'userId': "volunteer2",
        'groupId': "group1",
      })).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            exception: OperationException(
              linkException: null,
              graphqlErrors: const [GraphQLError(message: 'Error')],
            ),
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      when(mockEventService.addVolunteerToGroup({
        'eventId': "1",
        'userId': "volunteer3",
        'groupId': "group1",
      })).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      // Fire all operations concurrently - they may resolve in any order
      await Future.wait([
        model.addVolunteerToGroup("volunteer1", "1", "group1"),
        model.addVolunteerToGroup("volunteer2", "1", "group1"),
        model.addVolunteerToGroup("volunteer3", "1", "group1"),
      ]);

      // Only the successful one should be added
      expect(model.volunteers.length, 1);
      expect(model.volunteers.first.id, "volunteer1");
      expect(model.isFetchingVolunteers, isFalse);
    });

    test('handles concurrent removeVolunteerFromGroup calls correctly',
        () async {
      // First, add some volunteers
      final Event event = Event(id: "1");
      final EventVolunteerGroup group = EventVolunteerGroup(
        id: "group1",
        volunteers: [
          EventVolunteer(id: 'volunteer1'),
          EventVolunteer(id: 'volunteer2'),
          EventVolunteer(id: 'volunteer3'),
        ],
      );
      await model.initialize(event, group);

      expect(model.volunteers.length, 3);

      final mockEventService = locator<EventService>();

      // Mock successful removal for all calls
      when(mockEventService.removeVolunteerFromGroup({'id': 'volunteer1'}))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {
                  'removeEventVolunteer': {'id': 'volunteer1'}
                },
                options: QueryOptions(
                  document: gql(EventQueries().removeVolunteerMutation()),
                ),
              ));

      when(mockEventService.removeVolunteerFromGroup({'id': 'volunteer2'}))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {
                  'removeEventVolunteer': {'id': 'volunteer2'}
                },
                options: QueryOptions(
                  document: gql(EventQueries().removeVolunteerMutation()),
                ),
              ));

      // Fire removals concurrently
      await Future.wait([
        model.removeVolunteerFromGroup("volunteer1"),
        model.removeVolunteerFromGroup("volunteer2"),
      ]);

      // Verify final state - only volunteer3 should remain
      expect(model.volunteers.length, 1);
      expect(model.volunteers.first.id, "volunteer3");
      expect(model.isFetchingVolunteers, isFalse);
    });

    test('handles mixed concurrent add and remove operations correctly',
        () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group = EventVolunteerGroup(
        id: "group1",
        volunteers: [EventVolunteer(id: 'volunteer1')],
      );
      await model.initialize(event, group);

      expect(model.volunteers.length, 1);

      final mockEventService = locator<EventService>();

      // Mock add operation
      when(mockEventService.addVolunteerToGroup({
        'eventId': "1",
        'userId': "volunteer2",
        'groupId': "group1",
      })).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: {
              'createEventVolunteer': {'_id': 'volunteer2', 'userId': 'user2'}
            },
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      // Mock remove operation
      when(mockEventService.removeVolunteerFromGroup({'id': 'volunteer1'}))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {
                  'removeEventVolunteer': {'id': 'volunteer1'}
                },
                options: QueryOptions(
                  document: gql(EventQueries().removeVolunteerMutation()),
                ),
              ));

      // Fire both operations concurrently
      await Future.wait([
        model.addVolunteerToGroup("volunteer2", "1", "group1"),
        model.removeVolunteerFromGroup("volunteer1"),
      ]);

      // Verify final state - volunteer1 removed, volunteer2 added
      expect(model.volunteers.length, 1);
      expect(model.volunteers.first.id, "volunteer2");
      expect(model.isFetchingVolunteers, isFalse);
    });

    test('handles concurrent operations with exceptions without bubbling up',
        () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group =
          EventVolunteerGroup(id: "group1", volunteers: []);
      await model.initialize(event, group);

      final mockEventService = locator<EventService>();

      // Mock: one succeeds, two fail with exceptions
      when(mockEventService.addVolunteerToGroup({
        'eventId': "1",
        'userId': "volunteer1",
        'groupId': "group1",
      })).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: {
              'createEventVolunteer': {'_id': 'volunteer1', 'userId': 'user1'}
            },
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      when(mockEventService.addVolunteerToGroup({
        'eventId': "1",
        'userId': "volunteer2",
        'groupId': "group1",
      })).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            exception: OperationException(
              linkException: null,
              graphqlErrors: const [GraphQLError(message: 'Error adding')],
            ),
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      when(mockEventService.addVolunteerToGroup({
        'eventId': "1",
        'userId': "volunteer3",
        'groupId': "group1",
      })).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            exception: OperationException(
              linkException: null,
              graphqlErrors: const [GraphQLError(message: 'Another error')],
            ),
            options: QueryOptions(
              document: gql(EventQueries().addVolunteerToGroup()),
            ),
          ));

      // Fire all operations concurrently - no exceptions should bubble up
      await Future.wait([
        model.addVolunteerToGroup("volunteer1", "1", "group1"),
        model.addVolunteerToGroup("volunteer2", "1", "group1"),
        model.addVolunteerToGroup("volunteer3", "1", "group1"),
      ]);

      // Only the successful one should be added, exceptions handled gracefully
      expect(model.volunteers.length, 1);
      expect(model.volunteers.first.id, "volunteer1");
      expect(model.isFetchingVolunteers, isFalse);
    });

    test(
        'handles concurrent removeVolunteerFromGroup with mixed success and failure',
        () async {
      final Event event = Event(id: "1");
      final EventVolunteerGroup group = EventVolunteerGroup(
        id: "group1",
        volunteers: [
          EventVolunteer(id: 'volunteer1'),
          EventVolunteer(id: 'volunteer2'),
          EventVolunteer(id: 'volunteer3'),
        ],
      );
      await model.initialize(event, group);

      expect(model.volunteers.length, 3);

      final mockEventService = getAndRegisterEventService();

      // Mock: first succeeds, second has exception, third has null data
      when(mockEventService.removeVolunteerFromGroup({'id': 'volunteer1'}))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {
                  'removeEventVolunteer': {'id': 'volunteer1'}
                },
                options: QueryOptions(
                  document: gql(EventQueries().removeVolunteerMutation()),
                ),
              ));

      when(mockEventService.removeVolunteerFromGroup({'id': 'volunteer2'}))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: null,
                exception: OperationException(
                  linkException: null,
                  graphqlErrors: const [GraphQLError(message: 'Error')],
                ),
                options: QueryOptions(
                  document: gql(EventQueries().removeVolunteerMutation()),
                ),
              ));

      when(mockEventService.removeVolunteerFromGroup({'id': 'volunteer3'}))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: null,
                options: QueryOptions(
                  document: gql(EventQueries().removeVolunteerMutation()),
                ),
              ));

      // Fire all operations concurrently
      await Future.wait([
        model.removeVolunteerFromGroup("volunteer1"),
        model.removeVolunteerFromGroup("volunteer2"),
        model.removeVolunteerFromGroup("volunteer3"),
      ]);

      // Only volunteer1 should be removed (successful), others remain
      expect(model.volunteers.length, 2);
      expect(model.volunteers.map((v) => v.id).toSet(),
          {'volunteer2', 'volunteer3'});
      expect(model.isFetchingVolunteers, isFalse);
    });
  });
}
