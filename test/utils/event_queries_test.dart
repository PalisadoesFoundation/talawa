// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/event_queries.dart';

void main() {
  group("Tests for event_queries.dart", () {
    test("Check if fetchOrgEvents works correctly", () {
      const data = """
      query {
        eventsByOrganization(id: "sampleID"){ 
          _id
          organization {
            _id
            image
          }
          title
          description
          isPublic
          isRegisterable
          recurring
          recurrance
          startDate
          endDate
          allDay
          startTime
          endTime
          location
          creator{
            _id
            firstName
            lastName
          }
          admins {
            firstName
            lastName
          }
          registrants {
            user {
              _id
            }
          }
        }
      }
    """;

      final fnData = EventQueries().fetchOrgEvents("sampleID");
      expect(fnData, data);
    });

    test("Check if registrantsByEvents works correctly", () {
      const data = '''
      query {
        registrantsByEvent(id: "sampleID") {
          _id
          firstName
          lastName
          image
        }
      }
    ''';

      final fnData = EventQueries().registrantsByEvent("sampleID");
      expect(fnData, data);
    });

    test("Check if addEvent works correctly", () {
      const data = """
     mutation createEvent( \$organizationId: ID!,
        \$title:String!,
        \$description: String!,
        \$startTime: Time,
        \$endTime: Time,
        \$allDay: Boolean!,
        \$recurring: Boolean!,
        \$isPublic: Boolean!,
        \$isRegisterable: Boolean!,
        \$location: String,
        \$startDate : Date!,
        \$endDate : Date!,
      ) { 
      createEvent(
        data:{
          organizationId: \$organizationId,
           title: \$title,
           description: \$description,
           isPublic: \$isPublic,
           isRegisterable: \$isRegisterable,
           recurring: \$recurring,
           allDay: \$allDay,
           startTime: \$startTime,
           endTime: \$endTime,
           startDate: \$startDate,
           endDate: \$endDate,
           location: \$location,
        }
      ){
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
      registerForEvent(id: \$eventId)
        {
        _id
        title
        description
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
  });
}
