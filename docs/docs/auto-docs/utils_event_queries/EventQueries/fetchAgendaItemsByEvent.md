




fetchAgendaItemsByEvent method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. fetchAgendaItemsByEvent method

fetchAgendaItemsByEvent


dark\_mode

light\_mode




# fetchAgendaItemsByEvent method


String
fetchAgendaItemsByEvent(

1. String relatedEventId

)

Creates a GraphQL query for fetching agenda items by organization.

**params**:

* `relatedEventId`: The ID of the event to fetch agenda items for.

**returns**:

* `String`: Returns a GraphQL query string to fetch agenda items.

## Implementation

```
String fetchAgendaItemsByEvent(String relatedEventId) {
  return """
query {
  agendaItemByEvent(relatedEventId: "$relatedEventId") {
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
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. fetchAgendaItemsByEvent method

##### EventQueries class





talawa
1.0.0+1






