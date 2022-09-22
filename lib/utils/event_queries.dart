class EventQueries {
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
    """;
  }

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

  String addEvent() {
    return """
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
  """;
  }

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

  String updateEvent({
    eventId,
  }) {
    return """mutation updateEvent( 
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
