import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/event_queries.dart';

void main() {
  group("Tests for event_queries.dart", () {
    test('fetchOrgEvents returns correct GraphQL query string', () {
      final query = EventQueries().fetchOrgEvents();

      expect(query, contains('query GetOrganizationEvents'));
      expect(query, contains('organization(input: { id: \$id })'));
      expect(query, contains('events('));
      expect(query, contains('first: \$first'));
      expect(query, contains('after: \$after'));
      expect(query, contains('startDate: \$startDate'));
      expect(query, contains('endDate: \$endDate'));
      expect(query, contains('includeRecurring: \$includeRecurring'));
      expect(query, contains('edges'));
      expect(query, contains('node'));
      expect(query, contains('id'));
      expect(query, contains('name'));
      expect(query, contains('description'));
      expect(query, contains('startAt'));
      expect(query, contains('endAt'));
      expect(query, contains('allDay'));
      expect(query, contains('location'));
      expect(query, contains('isPublic'));
      expect(query, contains('isRegisterable'));
      expect(query, contains('recurrenceRule'));
      expect(query, contains('organization'));
      expect(query, contains('pageInfo'));
      expect(query, contains('hasNextPage'));
      expect(query, contains('endCursor'));
    });

    test("Check if attendeesByEvent works correctly", () {
      const data = '''
      query {
        getEventAttendeesByEventId(eventId: "sampleID") {
          eventId
          userId
          isRegistered
          isInvited
          isCheckedIn
          isCheckedOut
        }
      }
    ''';

      final fnData = EventQueries().attendeesByEvent("sampleID");
      expect(fnData, data);
    });

    test("Check if addEvent works correctly", () {
      const data = """
      mutation CreateEvent(\$input: MutationCreateEventInput!) {
        createEvent(input: \$input) {
          id
          name
        }
      }
    """;

      final fnData = EventQueries().addEvent();
      expect(fnData.trim(), data.trim());
    });

    test("Check if updateStandaloneEvent works correctly", () {
      const expected = """
    mutation UpdateStandaloneEvent(\$input: MutationUpdateEventInput!) {
      updateStandaloneEvent(input: \$input) {
        id
        name
       
      }
    }
    """;

      final actual = EventQueries().updateStandaloneEvent();
      expect(actual.trim(), expected.trim());
    });

    test("Check if updateSingleRecurringEventInstance works correctly", () {
      const expected = """
    mutation UpdateSingleRecurringEventInstance(
      \$input: MutationUpdateSingleRecurringEventInstanceInput!
    ) {
      updateSingleRecurringEventInstance(input: \$input) {
        id
        name

      }
    }
    """;

      final actual = EventQueries().updateSingleRecurringEventInstance();
      expect(actual.trim(), expected.trim());
    });

    test("Check if updateThisAndFollowingEvents works correctly", () {
      const expected = """
    mutation UpdateThisAndFollowingEvents(
      \$input: MutationUpdateThisAndFollowingEventsInput!
    ) {
      updateThisAndFollowingEvents(input: \$input) {
        id
        name
      }
    }
    """;

      final actual = EventQueries().updateThisAndFollowingEvents();
      expect(actual.trim(), expected.trim());
    });

    test("Check if updateEntireRecurringEventSeries works correctly", () {
      const expected = """
    mutation UpdateEntireRecurringEventSeries(
      \$input: MutationUpdateEntireRecurringEventSeriesInput!
    ) {
      updateEntireRecurringEventSeries(input: \$input) {
        id
        name
      }
    }
    """;

      final actual = EventQueries().updateEntireRecurringEventSeries();
      expect(actual.trim(), expected.trim());
    });

    test("Check if deleteStandaloneEvent works correctly", () {
      const expected =
          """mutation DeleteStandaloneEvent(\$input: MutationDeleteStandaloneEventInput!) {
        deleteStandaloneEvent(input: \$input) {
          id
        }
      }""";

      final actual = EventQueries().deleteStandaloneEvent();
      expect(actual.trim(), expected.trim());
    });

    test("Check if deleteSingleEventOfRecurring works correctly", () {
      const expected =
          """mutation DeleteSingleEventInstance(\$input: MutationDeleteSingleEventInstanceInput!) {
        deleteSingleEventInstance(input: \$input) {
          id
          name
        }
      }""";

      final actual = EventQueries().deleteSingleEventOfRecurring();
      expect(actual.trim(), expected.trim());
    });

    test("Check if deleteEntireEventSeriesOfRecurring works correctly", () {
      const expected =
          """mutation DeleteEntireRecurringEventSeries(\$input: MutationDeleteEntireRecurringEventSeriesInput!) {
        deleteEntireRecurringEventSeries(input: \$input) {
          id
          name
        }
      }""";

      final actual = EventQueries().deleteEntireEventSeriesOfRecurring();
      expect(actual.trim(), expected.trim());
    });

    test("Check if deleteThisAndFollowing works correctly", () {
      const expected =
          """mutation DeleteThisAndFollowingEvents(\$input: MutationDeleteThisAndFollowingEventsInput!) {
        deleteThisAndFollowingEvents(input: \$input) {
          id
          name
        }
      }""";

      final actual = EventQueries().deleteThisAndFollowing();
      expect(actual.trim(), expected.trim());
    });

    test("Check if registerForEvent works correctly", () {
      const data = """
     mutation registerForEvent(\$eventId: ID!) { 
      registerForEvent(id: \$eventId) {
        id
      }
     }
    """;

      final fnData = EventQueries().registerForEvent();
      expect(fnData, data);
    });
    test("Check if createVolunteerGroup works correctly", () {
      const data = '''
  mutation CreateEventVolunteerGroup(\$data: EventVolunteerGroupInput!) {
    createEventVolunteerGroup(data: \$data) {
      _id
      name
      volunteers{
      _id
      }
      createdAt
      volunteersRequired
      creator{
      _id
      }
    }
  }
  ''';

      final fnData = EventQueries().createVolunteerGroup();
      expect(fnData.trim(), data.trim());
    });

    test("Check if removeVolunteerGroup works correctly", () {
      const expected = '''
  mutation RemoveEventVolunteerGroup(\$id: ID!) {
    removeEventVolunteerGroup(id: \$id) {
    _id
    name
    }
  }
  ''';

      final actual = EventQueries().removeEventVolunteerGroup().trim();
      expect(actual, expected.trim());
    });

    test("Check if addVolunteerToGroup works correctly", () {
      const expected = '''
mutation CreateEventVolunteer(\$data: EventVolunteerInput!) {
  createEventVolunteer(data: \$data) {
      _id
      isAssigned
      response
      creator {
        _id
      }
      group {
        _id
        name
      }
      isInvited
      user {
        _id
        firstName
        lastName
      }
    }
  }  
  ''';

      final actual = EventQueries()
          .addVolunteerToGroup()
          .replaceAll(' ', '')
          .replaceAll('\n', '')
          .replaceAll('\t', '');

      expect(
        actual,
        expected.replaceAll(' ', '').replaceAll('\n', '').replaceAll('\t', ''),
      );
    });
    test("Check if removeVolunteerFromGroup works correctly", () {
      const expected = '''
  mutation RemoveEventVolunteer(\$id: ID!) {
    removeEventVolunteer(id: \$id) {
      _id
    }
  }
  ''';

      final actual = EventQueries().removeVolunteerMutation().trim();
      expect(actual, expected.trim());
    });

    test("Check if updateVolunteerGroup works correctly", () {
      const expected = '''
  mutation UpdateEventVolunteerGroup(\$id: ID!, \$data: UpdateEventVolunteerGroupInput!) {
    updateEventVolunteerGroup(id: \$id, data: \$data) {
      _id
      name
      volunteersRequired
    }
  }
  ''';

      final actual = EventQueries()
          .updateVolunteerGroupMutation()
          .replaceAll(' ', '')
          .replaceAll('\n', '')
          .replaceAll('\t', '');
      expect(
        actual,
        expected.replaceAll(' ', '').replaceAll('\n', '').replaceAll('\t', ''),
      );
    });

    test("Check if fetchVolunteerGroupsByEvent works correctly", () {
      const expected = '''
  query GetEventVolunteerGroups(\$where: EventVolunteerGroupWhereInput) {
    getEventVolunteerGroups(where: \$where) {
      _id
      name
      volunteersRequired
      createdAt
      volunteers {
        _id
        response
        user {
          _id
          firstName
          lastName
        }
      }
    }
  }
  ''';

      final actual = EventQueries()
          .fetchVolunteerGroups()
          .replaceAll(' ', '')
          .replaceAll('\n', '')
          .replaceAll('\t', '');
      expect(
        actual,
        expected.replaceAll(' ', '').replaceAll('\n', '').replaceAll('\t', ''),
      );
    });

    test("Check if fetchAgendaItemCategoriesByOrganization works correctly",
        () {
      const expected = """
    query {
      agendaItemCategoriesByOrganization(organizationId: "sampleOrgId") {
        _id
        name
        description
        
      }
    }
  """;

      final actual =
          EventQueries().fetchAgendaItemCategoriesByOrganization("sampleOrgId");
      expect(actual.trim(), expected.trim());
    });

    test("Check if createAgendaItem works correctly", () {
      const expected = """
    mutation CreateAgendaItem(\$input: CreateAgendaItemInput!) {
      createAgendaItem(input: \$input) {
        _id
        title
        description
        duration
        attachments
        createdBy {
        _id
        firstName
        lastName
        }
        urls
        categories {
        _id
        name
        }
        sequence
      }
    }
  """;

      final actual = EventQueries().createAgendaItem();
      expect(actual.trim(), expected.trim());
    });

    test("Check if updateAgendaItem works correctly", () {
      const expected = """
    mutation UpdateAgendaItem(\$updateAgendaItemId: ID!
    \$input: UpdateAgendaItemInput!
  ) {
      updateAgendaItem(id: \$updateAgendaItemId, input: \$input) {
        _id
        title
        description
        duration
        attachments
        createdBy {
        _id
        firstName
        lastName
        }
        urls
        categories {
        _id
        name
        }
        sequence
      }
    }
  """;

      final actual = EventQueries().updateAgendaItem();
      expect(actual.trim(), expected.trim());
    });

    test("Check if deleteAgendaItem works correctly", () {
      const expected = """
    mutation RemoveAgendaItem(\$removeAgendaItemId: ID!) {
      removeAgendaItem(id: \$removeAgendaItemId) {
         _id
      }
    }
  """;

      final actual = EventQueries().deleteAgendaItem();
      expect(actual.trim(), expected.trim());
    });

    test("Check if fetchAgendaItemsByEvent works correctly", () {
      const expected = """
  query {
    agendaItemByEvent(relatedEventId: "sampleEventId") {
      _id
      title
      description
      duration
      attachments
      createdBy {
        _id
        firstName
        lastName
      }
      urls
      categories {
        _id
        name
      }
      sequence
      organization {
        _id
        name
      }
      relatedEvent {
        _id
        title
      }
    }
  }
  """;

      final actual = EventQueries().fetchAgendaItemsByEvent("sampleEventId");
      expect(actual.trim(), expected.trim());
    });
  });
}
