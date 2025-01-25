




fetchAgendaItems method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. [EventInfoViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. fetchAgendaItems method

fetchAgendaItems


dark\_mode

light\_mode




# fetchAgendaItems method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
fetchAgendaItems()

Method to fetch all agenda items of an organization.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> fetchAgendaItems() async {
  try {
    final result = await locator<EventService>().fetchAgendaItems(event.id!)
        as QueryResult;

    if (result.data == null) return;
    final List agendaJson = result.data!['agendaItemByEvent'] as List;
    _agendaItems = agendaJson
        .map((json) => EventAgendaItem.fromJson(json as Map<String, dynamic>))
        .toList();
    _agendaItems.sort((a, b) => a.sequence!.compareTo(b.sequence!));
    notifyListeners();
  } catch (e) {
    print('Error fetching agenda items: $e');
  }
}
```

 


1. [talawa](../../index.html)
2. [event\_info\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. [EventInfoViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. fetchAgendaItems method

##### EventInfoViewModel class





talawa
1.0.0+1






