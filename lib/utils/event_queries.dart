///This class creates queries related to the events.
class EventQueries {
  /// Fetches events by organization ID.
  ///
  /// **params**:
  /// * `orgId`: The ID of the organization to fetch events for.
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to fetch events associated with the specified organization ID.
  ///
  /// This function generates a GraphQL query string to retrieve events
  /// based on the provided organization ID.

  String fetchOrgEvents(String orgId) {
    return """
      query {
        eventsByOrganizationConnection(
      where: {
        organization_id: "$orgId"
      }
    ) {
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
      startDate
      endDate
      allDay
      startTime
      endTime
      location
      creator {
        _id
        firstName
        lastName
      }
      admins {
        _id
        firstName
        lastName
      } 
      attendees {
        _id
        firstName
        lastName
        image
      }
    }
      }
    """;
  }

  /// Fetches attendees by event ID.
  ///
  /// **params**:
  /// * `eventId`: The ID of the event to fetch registrants for.
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to retrieve registrants associated with the specified event ID.
  ///
  /// This function generates a GraphQL query string to fetch registrants
  /// based on the provided event ID.
  String attendeesByEvent(String eventId) {
    return '''
      query {
        getEventAttendeesByEventId(eventId: "$eventId") {
          eventId
          userId
          isRegistered
          isInvited
          isCheckedIn
          isCheckedOut
        }
      }
    ''';
  }

  /// Creates a GraphQL mutation for adding an event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to create an event.
  ///
  /// This function generates a GraphQL mutation string for creating an event.
  String addEvent() {
    return """
    mutation Mutation(\$data: EventInput!, \$recurrenceRuleData: RecurrenceRuleInput) {
      createEvent(data: \$data, recurrenceRuleData: \$recurrenceRuleData) {
        _id
        title
        description
      }
    }
  """;
  }

  /// Creates a GraphQL mutation for registering for an event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to register for the specified event.
  ///
  /// This function generates a GraphQL mutation string for registering an individual for an event.
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

  /// Creates a GraphQL mutation for deleting an event.
  ///
  /// **params**:
  /// * `id`: The ID of the event to delete.
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to delete the specified event.
  ///
  /// This function generates a GraphQL mutation string for removing/deleting an event
  /// based on the provided event ID.
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

  /// Creates a GraphQL mutation for updating an event.
  ///
  /// **params**:
  /// * `eventId`: The ID of the event to update.
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to update the specified event.
  ///
  /// This function generates a GraphQL mutation string for updating an event
  /// based on the provided parameters. It takes the event ID along with updated
  /// details.
  /// The mutation updates the event details and returns the ID, title, and description
  /// of the updated event.
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
