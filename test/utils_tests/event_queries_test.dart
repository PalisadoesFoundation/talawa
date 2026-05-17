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
      final fnData = EventQueries().attendeesByEvent("sampleID");
      expect(
          fnData, contains('getEventAttendeesByEventId(eventId: "sampleID")'));
      expect(fnData, contains('event { id }'));
      expect(fnData, contains('user { id name }'));
      expect(fnData, contains('isRegistered'));
      expect(fnData, contains('isInvited'));
      expect(fnData, contains('isCheckedIn'));
      expect(fnData, contains('isCheckedOut'));
    });

    test("Check if addEvent works correctly", () {
      final fnData = EventQueries().addEvent();
      expect(fnData, contains('mutation CreateEvent'));
      expect(fnData, contains(r'$input: MutationCreateEventInput!'));
      expect(fnData, contains('createEvent(input: \$input)'));
      expect(fnData, contains('id'));
      expect(fnData, contains('name'));
      expect(fnData, contains('startAt'));
      expect(fnData, contains('endAt'));
      expect(fnData, contains('startDate'));
      expect(fnData, contains('endDate'));
      expect(fnData, contains('allDay'));
      expect(fnData, contains('location'));
      expect(fnData, contains('creator { id name }'));
      expect(fnData, contains('organization { id name }'));
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
      final fnData = EventQueries().createVolunteerGroup();
      expect(fnData, contains('createEventVolunteerGroup(data: \$data)'));
      expect(fnData, contains(r'$data: EventVolunteerGroupInput!'));
      expect(fnData, contains('id'));
      expect(fnData, contains('name'));
      expect(fnData, contains('createdAt'));
      expect(fnData, contains('volunteersRequired'));
      expect(fnData, contains('creator { id name }'));
      expect(fnData, isNot(contains('_id')));
    });

    test("Check if removeVolunteerGroup works correctly", () {
      final actual = EventQueries().removeEventVolunteerGroup();
      expect(actual, contains('mutation DeleteEventVolunteerGroup'));
      expect(actual, contains('deleteEventVolunteerGroup(id: \$id)'));
      expect(actual, contains(r'$id: ID!'));
      expect(actual, contains('id'));
      expect(actual, contains('name'));
      expect(actual, isNot(contains('_id')));
    });

    test("Check if addVolunteerToGroup works correctly", () {
      final actual = EventQueries().addVolunteerToGroup();
      expect(actual, contains(r'$data: EventVolunteerInput!'));
      expect(actual, contains('createEventVolunteer(data: \$data)'));
      expect(actual, contains('id'));
      expect(actual, contains('hasAccepted'));
      expect(actual, contains('isPublic'));
      expect(actual, contains('creator { id name }'));
      expect(actual, contains('event { id }'));
      expect(actual, contains('user { id name }'));
      expect(actual, isNot(contains('_id')));
      expect(actual, isNot(contains('firstName')));
      expect(actual, isNot(contains('lastName')));
    });
    test("Check if removeVolunteerFromGroup works correctly", () {
      final actual = EventQueries().removeVolunteerMutation();
      expect(actual, contains('mutation DeleteEventVolunteer'));
      expect(actual, contains('deleteEventVolunteer(id: \$id)'));
      expect(actual, contains(r'$id: ID!'));
      expect(actual, contains('id'));
      expect(actual, isNot(contains('_id')));
    });

    test("Check if updateVolunteerGroup works correctly", () {
      final actual = EventQueries().updateVolunteerGroupMutation();
      expect(actual, contains('mutation UpdateEventVolunteerGroup'));
      expect(actual, contains(r'$id: ID!'));
      expect(actual, contains(r'$data: UpdateEventVolunteerGroupInput!'));
      expect(actual,
          contains('updateEventVolunteerGroup(id: \$id, data: \$data)'));
      expect(actual, contains('id'));
      expect(actual, contains('name'));
      expect(actual, contains('volunteersRequired'));
      expect(actual, isNot(contains('_id')));
    });

    test("Check if fetchVolunteerGroupsByEvent works correctly", () {
      final actual = EventQueries().fetchVolunteerGroups();
      expect(actual, contains('query GetEventVolunteerGroups'));
      expect(actual, contains(r'$where: EventVolunteerGroupWhereInput'));
      expect(actual, contains('getEventVolunteerGroups(where: \$where)'));
      expect(actual, contains('id'));
      expect(actual, contains('name'));
      expect(actual, contains('volunteersRequired'));
      expect(actual, contains('createdAt'));
      expect(actual, contains('leader { id name }'));
      expect(actual, contains('creator { id name }'));
      expect(actual, isNot(contains('_id')));
      expect(actual, isNot(contains('firstName')));
    });

    test("Check if fetchAgendaItemCategoriesByOrganization works correctly",
        () {
      final actual = EventQueries()
          .fetchAgendaItemCategoriesByOrganization("sampleEventId");
      expect(actual,
          contains('agendaCategoriesByEventId(eventId: "sampleEventId")'));
      expect(actual, contains('id'));
      expect(actual, contains('name'));
      expect(actual, contains('description'));
      expect(actual, isNot(contains('_id')));
    });

    test("Check if createAgendaItem works correctly", () {
      final actual = EventQueries().createAgendaItem();
      expect(actual, contains(r'$input: MutationCreateAgendaItemInput!'));
      expect(actual, contains('createAgendaItem(input: \$input)'));
      expect(actual, contains('id'));
      expect(actual, contains('name'));
      expect(actual, contains('description'));
      expect(actual, contains('duration'));
      expect(actual, contains('sequence'));
      expect(actual, contains('type'));
      expect(actual, contains('creator { id name }'));
      expect(actual, contains('category { id name }'));
      expect(actual, contains('event { id }'));
      expect(actual, isNot(contains('_id')));
      expect(actual, isNot(contains('firstName')));
    });

    test("Check if updateAgendaItem works correctly", () {
      final actual = EventQueries().updateAgendaItem();
      expect(actual, contains(r'$input: MutationUpdateAgendaItemInput!'));
      expect(actual, contains('updateAgendaItem(input: \$input)'));
      expect(actual, contains('id'));
      expect(actual, contains('name'));
      expect(actual, contains('description'));
      expect(actual, contains('duration'));
      expect(actual, contains('sequence'));
      expect(actual, contains('type'));
      expect(actual, isNot(contains('_id')));
    });

    test("Check if deleteAgendaItem works correctly", () {
      final actual = EventQueries().deleteAgendaItem();
      expect(actual, contains('mutation DeleteAgendaItem'));
      expect(actual, contains(r'$input: MutationDeleteAgendaItemInput!'));
      expect(actual, contains('deleteAgendaItem(input: \$input)'));
      expect(actual, contains('id'));
      expect(actual, isNot(contains('_id')));
    });

    test("Check if fetchAgendaItemsByEvent works correctly", () {
      final actual = EventQueries().fetchAgendaItemsByEvent("sampleEventId");
      expect(
          actual, contains('agendaFoldersByEventId(eventId: "sampleEventId")'));
      expect(actual, contains('id'));
      expect(actual, contains('name'));
      expect(actual, contains('description'));
      expect(actual, contains('sequence'));
      expect(actual, contains('items(first: 50)'));
      expect(actual, contains('edges'));
      expect(actual, contains('node'));
      expect(actual, contains('pageInfo'));
      expect(actual, isNot(contains('_id')));
      expect(actual, isNot(contains('createdBy')));
    });
  });
}
