
<div>

# deleteAgendaItem method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Creates a GraphQL mutation for deleting an agenda item.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to delete an agenda
    item.



## Implementation

``` language-dart
String  {
  return """
  mutation RemoveAgendaItem(\$removeAgendaItemId: ID!) {
    removeAgendaItem(id: \$removeAgendaItemId) {
       _id
    }
  }
""";
}
```







1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  deleteAgendaItem method

##### EventQueries class







