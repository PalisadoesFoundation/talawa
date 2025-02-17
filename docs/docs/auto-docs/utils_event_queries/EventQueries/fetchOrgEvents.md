
<div>

# fetchOrgEvents method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
fetchOrgEvents(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    orgId]

)



Fetches events by organization ID.

**params**:

-   `orgId`: The ID of the organization to fetch events for.

**returns**:

-   `String`: Returns a GraphQL query string to fetch events associated
    with the specified organization ID.

This function generates a GraphQL query string to retrieve events based
on the provided organization ID.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  fetchOrgEvents method

##### EventQueries class







