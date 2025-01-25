




createAgendaItem method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. [EventInfoViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. createAgendaItem method

createAgendaItem


dark\_mode

light\_mode




# createAgendaItem method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
createAgendaItem({

1. required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) title,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? description,
3. required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) duration,
4. [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? attachments,
5. [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? urls,
6. [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? categories,
7. [int](https://api.flutter.dev/flutter/dart-core/int-class.html)? sequence,

})

This function is used to create a new agenda item for an event.

**params**:

* `title`: Title of the agenda item.
* `description`: Description of the agenda item (optional).
* `duration`: Duration of the agenda item.
* `attachments`: List of attachment URLs (optional).
* `urls`: List of related URLs (optional).
* `categories`: List of category IDs (optional).
* `sequence`: Sequence number of the agenda item.
* `itemType`: Type of the agenda item.
* `isNote`: Whether the agenda item is a note or not.

**returns**:

* `Future<EventAgendaItem?>`: Returns the new agenda item if creation is successful.

## Implementation

```
Future<EventAgendaItem?> createAgendaItem({
  required String title,
  String? description,
  required String duration,
  List<String>? attachments,
  List<String>? urls,
  List<String>? categories,
  int? sequence,
}) async {
  try {
    final variables = {
      'title': title,
      'description': description,
      'duration': duration,
      'attachments': attachments,
      'relatedEventId': event.id,
      'urls': urls,
      'categories': categories,
      'sequence': _agendaItems.length + 1,
      'organizationId': userConfig.currentOrg.id,
    };
    final result = await locator<EventService>().createAgendaItem(variables)
        as QueryResult;
    if (result.data == null || result.data!['createAgendaItem'] == null) {
      throw Exception('Failed to create agenda item or no data returned');
    }

    final data = result.data!['createAgendaItem'];

    final newAgendaItem =
        EventAgendaItem.fromJson(data as Map<String, dynamic>);

    _agendaItems.add(newAgendaItem);
    selectedCategories.clear();
    notifyListeners();

    return newAgendaItem;
  } catch (e) {
    print('Error creating agenda item: $e');
  }
  return null;
}
```

 


1. [talawa](../../index.html)
2. [event\_info\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. [EventInfoViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. createAgendaItem method

##### EventInfoViewModel class





talawa
1.0.0+1






