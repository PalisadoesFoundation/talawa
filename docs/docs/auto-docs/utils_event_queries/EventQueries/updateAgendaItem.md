
<div>

# updateAgendaItem method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Creates a GraphQL mutation for updating an agenda item.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to update an agenda
    item.



## Implementation

``` language-dart
String  {
  return """
  mutation UpdateAgendaItem(\$updateAgendaItemId: ID!
  \$input: UpdateAgendaItemInput!
) {
    updateAgendaItem(id: \$updateAgendaItemId, input: \$input) {
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







1.  [talawa](../../index.html)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  updateAgendaItem method

##### EventQueries class







