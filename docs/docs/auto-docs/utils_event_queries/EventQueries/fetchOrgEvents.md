




fetchOrgEvents method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. fetchOrgEvents method

fetchOrgEvents


dark\_mode

light\_mode




# fetchOrgEvents method


String
fetchOrgEvents(

1. String orgId

)

Fetches events by organization ID.

**params**:

* `orgId`: The ID of the organization to fetch events for.

**returns**:

* `String`: Returns a GraphQL query string to fetch events associated with the specified organization ID.

This function generates a GraphQL query string to retrieve events
based on the provided organization ID.


## Implementation

```
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
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. fetchOrgEvents method

##### EventQueries class





talawa
1.0.0+1






