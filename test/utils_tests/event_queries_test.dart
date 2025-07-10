import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/event_queries.dart';

void main() {
  group("Tests for event_queries.dart", () {
    test("Check if fetchOrgEvents works correctly", () {
      const data = """
    query {
      eventsByOrganizationId(
        input: { organizationId: "sampleID" }
      ) {
        id
        name
        description
        startAt
        endAt
        organization {
          id
          name
        }
        creator {
          id
          name
        }
        updater {
          id
          name
        }
        attachments {
          mimeType
          url
        }
      }
    }
  """;

      final fnData = EventQueries().fetchOrgEvents("sampleID");
      expect(fnData, data);
    });

    test("Check if attendeesByEvent works correctly", () {
      const data = '''
      query {
        getEventAttendeesByEventId(eventId: "sampleID") {
          eventId
          userId
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
    mutation Mutation(\$data: EventInput!, \$recurrenceRuleData: RecurrenceRuleInput) {
      createEvent(data: \$data, recurrenceRuleData: \$recurrenceRuleData) {
        _id
        title
        description
      }
    }
  """;

      final fnData = EventQueries().addEvent();
      expect(fnData, data);
    });

    test("Check if registerForEvent works correctly", () {
      const data = """
     mutation registerForEvent(\$eventId: ID!) { 
      registerForEvent(id: \$eventId) {
        _id
      }
     }
    """;

      final fnData = EventQueries().registerForEvent();
      expect(fnData, data);
    });

    test("Check if deleteEvent works correctly", () {
      const data = """
      mutation {
        removeEvent(
          id: "sampleID",
          ){
            _id
          }
        }
    """;

      final fnData = EventQueries().deleteEvent("sampleID");
      expect(fnData, data);
    });

    test("Check if updateEvent works correctly", () {
      const data = """mutation updateEvent( 
        \$title:String!,
        \$description: String!,
        \$startTime: Time,
        \$endTime: Time,
        \$allDay: Boolean!,
        \$recurring: Boolean!,
        \$isPublic: Boolean!,
        \$isRegisterable: Boolean!,
        \$location: String,
      ) {
      updateEvent(
         id: "sampleID"
         data:{
           title: \$title,
           description: \$description,
           isPublic: \$isPublic,
           isRegisterable: \$isRegisterable,
           recurring: \$recurring,
           allDay: \$allDay,
           startTime: \$startTime
           endTime: \$endTime
           location: \$location
         }
         ){
            _id
            title
            description
          }
      }""";

      final fnData = EventQueries().updateEvent(eventId: "sampleID");
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
      expect(fnData, data);
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
