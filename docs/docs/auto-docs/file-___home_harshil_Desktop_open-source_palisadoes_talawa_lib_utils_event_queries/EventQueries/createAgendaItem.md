




createAgendaItem method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. createAgendaItem method

createAgendaItem


dark\_mode

light\_mode




# createAgendaItem method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
createAgendaItem()

Creates a GraphQL mutation for creating an agenda item.

**params**:
None

**returns**:

* `String`: Returns a GraphQL mutation string to create an agenda item.

## Implementation

```
String createAgendaItem() {
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

 


1. [talawa](../../index.html)
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. createAgendaItem method

##### EventQueries class





talawa
1.0.0+1






