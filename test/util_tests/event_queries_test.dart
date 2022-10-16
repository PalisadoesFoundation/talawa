import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/event_queries.dart';

void main() {
  group("Testing Evebt Quries ", () {
    final eventQueries = EventQueries();
    test("fetchOrgEvents should return proper query", () {
      expect(eventQueries.fetchOrgEvents("orgId"), """
      query {
        eventsByOrganization(id: "orgId"){ 
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
          startTime
          endTime
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
    """);
    });

    test("registrantsByEvent should return proper mutation", () {
      expect(eventQueries.registrantsByEvent("eventId"), '''
      query {
        registrantsByEvent(id: "eventId") {
          _id
          firstName
          lastName
          image
        }
      }
    ''');
    });

    test("addEvent should return proper mutation", () {
      expect(eventQueries.addEvent(), """
     mutation createEvent( \$organizationId: ID!,
        \$title:String!,
        \$description: String!,
        \$startTime: String,
        \$endTime: String,
        \$allDay: Boolean!,
        \$recurring: Boolean!,
        \$isPublic: Boolean!,
        \$isRegisterable: Boolean!,
        \$location: String,
        \$startDate : String!,
        \$endDate : String!,
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
  """);
    });

    test("registerForEvent should return proper mutation", () {
      expect(eventQueries.registerForEvent(), """
     mutation registerForEvent(\$eventId: ID!) { 
      registerForEvent(id: \$eventId)
        {
        _id
        title
        description
      }
    }
  """);
    });

    test("deleteEvent should return proper mutation", () {
      expect(eventQueries.deleteEvent("id"), """
      mutation {
        removeEvent(
          id: "id",
          ){
            _id
          }
        }
    """);
    });
    test("updateEvent should return proper mutation", () {
      expect(eventQueries.updateEvent(eventId: "eventId"),
          """mutation updateEvent( 
        \$title:String!,
        \$description: String!,
        \$startTime: String,
        \$endTime: String,
        \$allDay: Boolean!,
        \$recurring: Boolean!,
        \$isPublic: Boolean!,
        \$isRegisterable: Boolean!,
        \$location: String,
      ) {
      updateEvent(
         id: "eventId"
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
      }""");
    });
  });
}
