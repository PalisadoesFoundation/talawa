




updateAgendaItem method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. updateAgendaItem method

updateAgendaItem


dark\_mode

light\_mode




# updateAgendaItem method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
updateAgendaItem()

Creates a GraphQL mutation for updating an agenda item.

**params**:
None

**returns**:

* `String`: Returns a GraphQL mutation string to update an agenda item.

## Implementation

```
String updateAgendaItem() {
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

 


1. [talawa](../../index.html)
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. updateAgendaItem method

##### EventQueries class





talawa
1.0.0+1






