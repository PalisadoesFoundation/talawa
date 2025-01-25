




deleteAgendaItem method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. deleteAgendaItem method

deleteAgendaItem


dark\_mode

light\_mode




# deleteAgendaItem method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
deleteAgendaItem()

Creates a GraphQL mutation for deleting an agenda item.

**params**:
None

**returns**:

* `String`: Returns a GraphQL mutation string to delete an agenda item.

## Implementation

```
String deleteAgendaItem() {
  return """
  mutation RemoveAgendaItem(\$removeAgendaItemId: ID!) {
    removeAgendaItem(id: \$removeAgendaItemId) {
       _id
    }
  }
""";
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. deleteAgendaItem method

##### EventQueries class





talawa
1.0.0+1






