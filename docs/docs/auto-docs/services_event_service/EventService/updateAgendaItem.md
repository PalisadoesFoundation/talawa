
<div>

# updateAgendaItem method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
updateAgendaItem(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    itemId, ]
2.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    variables]

)



This function is used to update an agenda item.

**params**:

-   `itemId`: Id of agenda item which is to be updated
-   `variables`: A map of key-value pairs representing the variables
    required for the GraphQL mutation.

**returns**:

-   `Future<dynamic>`: Information about the updated agenda item.



## Implementation

``` language-dart
Future<dynamic> updateAgendaItem(
  String itemId,
  Map<String, dynamic> variables,
) async 
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  updateAgendaItem method

##### EventService class







