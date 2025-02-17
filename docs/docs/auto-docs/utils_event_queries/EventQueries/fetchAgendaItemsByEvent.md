
<div>

# fetchAgendaItemsByEvent method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
fetchAgendaItemsByEvent(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    relatedEventId]

)



Creates a GraphQL query for fetching agenda items by organization.

**params**:

-   `relatedEventId`: The ID of the event to fetch agenda items for.

**returns**:

-   `String`: Returns a GraphQL query string to fetch agenda items.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  fetchAgendaItemsByEvent method

##### EventQueries class







