




fetchOrgEvents method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. fetchOrgEvents method

fetchOrgEvents


dark\_mode

light\_mode




# fetchOrgEvents method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
fetchOrgEvents(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId

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
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. fetchOrgEvents method

##### EventQueries class





talawa
1.0.0+1






