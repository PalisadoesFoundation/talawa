
<div>

# createAgendaItem method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Creates a GraphQL mutation for creating an agenda item.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to create an agenda
    item.



## Implementation

``` language-dart
String  {
  return """
  mutation CreateAgendaItem(\$input: CreateAgendaItemInput!) {
    createAgendaItem(input: \$input) {
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
    }
  }
""";
}
```







1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  createAgendaItem method

##### EventQueries class







