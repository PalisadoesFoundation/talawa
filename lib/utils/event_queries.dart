// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

///This class creates queries related to the events.
class EventQueries {
  //Returns a query to fetch an organization's events
  String fetchOrgEvents(String orgId) {
    return """
      query {
        eventsByOrganization(id: "$orgId"){ 
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
  }

  //returns a query to get the registrants of a particular event.
  String registrantsByEvent(String eventId) {
    return '''
      query {
        registrantsByEvent(id: "$eventId") {
          _id
          firstName
          lastName
          image
        }
      }
    ''';
  }

  //returns a query to add an event.
  String addEvent() {
    return """
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
  }

  //returns a query to register for an event
  String registerForEvent() {
    return """
     mutation registerForEvent(\$eventId: ID!) { 
      registerForEvent(id: \$eventId)
        {
        _id
        title
        description
      }
    }
  """;
  }

  //returns a query to delete an event
  String deleteEvent(String id) {
    return """
      mutation {
        removeEvent(
          id: "$id",
          ){
            _id
          }
        }
    """;
  }

  //returns a query to update an event
  String updateEvent({
    eventId,
  }) {
    return """mutation updateEvent( 
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
         id: "$eventId"
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
  }
}
