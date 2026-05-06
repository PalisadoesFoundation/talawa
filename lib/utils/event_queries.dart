///This class creates queries related to the events.
class EventQueries {
  // Todo: Add agendaItem in the query once the backend is ready.
  /// Fetches events by organization ID.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to fetch events associated with the specified organization ID.
  ///
  /// This function generates a GraphQL query string to retrieve events
  /// based on the provided organization ID.
  String fetchOrgEvents() {
    return '''
    query GetOrganizationEvents(
    \$id: String!
    \$first: Int
    \$after: String
    \$startDate: DateTime
    \$endDate: DateTime
    \$includeRecurring: Boolean
  ) {
    organization(input: { id: \$id }) {
      events(
        first: \$first
        after: \$after
        startDate: \$startDate
        endDate: \$endDate
        includeRecurring: \$includeRecurring
      ) {
        edges {
          node {
            id
            name
            description
            startAt
            endAt
            startDate
            endDate
            allDay
            location
            isPublic
            isRegisterable
            isRecurringEventTemplate
            baseEvent {
              id
              name
            }
            sequenceNumber
            totalCount
            hasExceptions
            progressLabel
            recurrenceDescription
            recurrenceRule {
              id
              frequency
              interval
              recurrenceStartDate
              recurrenceEndDate
              count
              byDay
              byMonth
              byMonthDay
            }
            attachments {
              url
              mimeType
            }
            
            creator {
              id
              name
            }
            
            organization {
              id
              name
            }
            
            createdAt
            updatedAt
          }
          cursor
        }
        pageInfo {
          hasNextPage
          endCursor
        }
      }
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
    return '''
      mutation CreateEvent(\$input: MutationCreateEventInput!) {
        createEvent(input: \$input) {
          id
          name
          description
          startAt
          endAt
          startDate
          endDate
          allDay
          location
          isPublic
          isRegisterable
          isRecurringEventTemplate
          creator { id name }
          organization { id name }
        }
      }
    ''';
  }

  /// Updates a standalone (non-recurring) event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to update a standalone event.
  String updateStandaloneEvent() {
    return """
    mutation UpdateStandaloneEvent(\$input: MutationUpdateEventInput!) {
      updateStandaloneEvent(input: \$input) {
        id
        name
       
      }
    }
    """;
  }

  /// Updates a single instance of a recurring event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to update a single instance of a recurring event.
  String updateSingleRecurringEventInstance() {
    return """
    mutation UpdateSingleRecurringEventInstance(
      \$input: MutationUpdateSingleRecurringEventInstanceInput!
    ) {
      updateSingleRecurringEventInstance(input: \$input) {
        id
        name

      }
    }
    """;
  }

  /// Updates a specific instance and all following instances of a recurring event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to update a specific instance and all following instances.
  String updateThisAndFollowingEvents() {
    return """
    mutation UpdateThisAndFollowingEvents(
      \$input: MutationUpdateThisAndFollowingEventsInput!
    ) {
      updateThisAndFollowingEvents(input: \$input) {
        id
        name
      }
    }
    """;
  }

  /// Updates an entire recurring event series.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to update an entire recurring event series.
  String updateEntireRecurringEventSeries() {
    return """
    mutation UpdateEntireRecurringEventSeries(
      \$input: MutationUpdateEntireRecurringEventSeriesInput!
    ) {
      updateEntireRecurringEventSeries(input: \$input) {
        id
        name
      }
    }
    """;
  }

  /// Deletes a standalone (non-recurring) event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to delete a standalone event.
  String deleteStandaloneEvent() {
    return """mutation DeleteStandaloneEvent(\$input: MutationDeleteStandaloneEventInput!) {
        deleteStandaloneEvent(input: \$input) {
          id
        }
      }""";
  }

  /// Deletes a single instance of a recurring event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to delete a single instance of a recurring event.
  String deleteSingleEventOfRecurring() {
    return """mutation DeleteSingleEventInstance(\$input: MutationDeleteSingleEventInstanceInput!) {
        deleteSingleEventInstance(input: \$input) {
          id
          name
        }
      }""";
  }

  /// Deletes an entire recurring event series.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to delete an entire recurring event series.
  String deleteEntireEventSeriesOfRecurring() {
    return """mutation DeleteEntireRecurringEventSeries(\$input: MutationDeleteEntireRecurringEventSeriesInput!) {
        deleteEntireRecurringEventSeries(input: \$input) {
          id
          name
        }
      }""";
  }

  /// Deletes a specific instance and all following instances of a recurring event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to delete a specific instance and all following instances.
  String deleteThisAndFollowing() {
    return """mutation DeleteThisAndFollowingEvents(\$input: MutationDeleteThisAndFollowingEventsInput!) {
        deleteThisAndFollowingEvents(input: \$input) {
          id
          name
        }
      }""";
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
          id
          event { id }
          user { id name }
          isRegistered
          isInvited
          isCheckedIn
          isCheckedOut
        }
      }
    ''';
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
      registerForEvent(id: \$eventId) {
        id
      }
     }
    """;
  }

  /// Creates a GraphQL mutation for creating an event volunteer group.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to create an event volunteer group.
  ///
  /// This function generates a GraphQL mutation string for creating an event volunteer group.
  String createVolunteerGroup() {
    return '''
  mutation CreateEventVolunteerGroup(\$data: EventVolunteerGroupInput!) {
    createEventVolunteerGroup(data: \$data) {
      id
      name
      createdAt
      volunteersRequired
      creator { id name }
    }
  }
  ''';
  }

  /// Creates a GraphQL mutation for removing an event volunteer group.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to remove an event volunteer group.
  ///
  /// This function generates a GraphQL mutation string for removing an event volunteer group.
  String removeEventVolunteerGroup() {
    return '''
  mutation DeleteEventVolunteerGroup(\$id: ID!) {
    deleteEventVolunteerGroup(id: \$id) {
      id
      name
    }
  }
  ''';
  }

  /// Creates a GraphQL mutation for adding a volunteer to a group.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to add a volunteer to a group.
  ///
  /// This function generates a GraphQL mutation string for adding a volunteer to a group.
  String addVolunteerToGroup() {
    return '''
    mutation CreateEventVolunteer(\$data: EventVolunteerInput!) {
      createEventVolunteer(data: \$data) {
        id
        hasAccepted
        isPublic
        creator { id name }
        event { id }
        user { id name }
      }
    }
    ''';
  }

  /// Creates a GraphQL mutation for deleting a volunteer from a group.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to delete a volunteer to a group.
  ///
  /// This function generates a GraphQL mutation string for deleting a volunteer to a group.
  String removeVolunteerMutation() {
    return '''
  mutation DeleteEventVolunteer(\$id: ID!) {
    deleteEventVolunteer(id: \$id) {
      id
    }
  }
  ''';
  }

  /// Mutation to update volunteer group insatnce.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to update a volunteer group
  String updateVolunteerGroupMutation() {
    return '''
      mutation UpdateEventVolunteerGroup(\$id: ID!, \$data: UpdateEventVolunteerGroupInput!) {
        updateEventVolunteerGroup(id: \$id, data: \$data) {
          id
          name
          volunteersRequired
        }
      }
    ''';
  }

  /// Fetches event volunteer groups based on criteria such as event ID.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to fetch event volunteer groups that match the provided criteria.
  String fetchVolunteerGroups() {
    return '''
      query GetEventVolunteerGroups(\$where: EventVolunteerGroupWhereInput) {
        getEventVolunteerGroups(where: \$where) {
          id
          name
          volunteersRequired
          createdAt
          leader { id name }
          creator { id name }
        }
      }
    ''';
  }

  /// Creates a GraphQL query for fetching agenda item categories by organization.
  ///
  /// **params**:
  /// * `organizationId`: The ID of the organization to fetch agenda item categories for.
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to fetch agenda item categories.
  String fetchAgendaItemCategoriesByOrganization(String eventId) {
    return """
    query {
      agendaCategoriesByEventId(eventId: "$eventId") {
        id
        name
        description
      }
    }
  """;
  }

  /// Creates a GraphQL mutation for creating an agenda item.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to create an agenda item.
  String createAgendaItem() {
    return """
    mutation CreateAgendaItem(\$input: MutationCreateAgendaItemInput!) {
      createAgendaItem(input: \$input) {
        id
        name
        description
        duration
        notes
        sequence
        type
        creator { id name }
        category { id name }
        folder { id name }
        event { id }
      }
    }
  """;
  }

  /// Creates a GraphQL mutation for updating an agenda item.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to update an agenda item.
  String updateAgendaItem() {
    return """
    mutation UpdateAgendaItem(\$input: MutationUpdateAgendaItemInput!) {
      updateAgendaItem(input: \$input) {
        id
        name
        description
        duration
        notes
        sequence
        type
        creator { id name }
        category { id name }
        folder { id name }
        event { id }
      }
    }
  """;
  }

  /// Creates a GraphQL mutation for deleting an agenda item.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to delete an agenda item.
  String deleteAgendaItem() {
    return """
    mutation DeleteAgendaItem(\$input: MutationDeleteAgendaItemInput!) {
      deleteAgendaItem(input: \$input) {
        id
      }
    }
  """;
  }

  /// Creates a GraphQL query for fetching agenda items by organization.
  ///
  /// **params**:
  /// * `relatedEventId`: The ID of the event to fetch agenda items for.
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to fetch agenda items.
  String fetchAgendaItemsByEvent(String relatedEventId) {
    return """
  query {
    agendaFoldersByEventId(eventId: "$relatedEventId") {
      id
      name
      description
      sequence
      isDefaultFolder
      event { id }
      items(first: 50) {
        edges {
          node {
            id
            name
            description
            duration
            notes
            sequence
            type
            creator { id name }
            category { id name }
          }
          cursor
        }
        pageInfo { hasNextPage endCursor }
      }
    }
  }
  """;
  }
}
