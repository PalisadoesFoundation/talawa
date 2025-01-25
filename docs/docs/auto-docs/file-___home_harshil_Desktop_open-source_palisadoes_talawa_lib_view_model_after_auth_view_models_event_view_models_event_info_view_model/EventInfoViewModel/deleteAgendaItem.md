




deleteAgendaItem method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. [EventInfoViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. deleteAgendaItem method

deleteAgendaItem


dark\_mode

light\_mode




# deleteAgendaItem method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
deleteAgendaItem(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) id

)

Method to delete an agenda item.

more\_info\_if\_required

**params**:

* `id`: id of the gaenda item that is to be deleted

**returns**:
None


## Implementation

```
Future<void> deleteAgendaItem(String id) async {
  try {
    await locator<EventService>()
        .deleteAgendaItem({"removeAgendaItemId": id});
    _agendaItems.removeWhere((item) => item.id == id);
    notifyListeners();
  } catch (e) {
    print('Error deleting agenda item: $e');
  }
}
```

 


1. [talawa](../../index.html)
2. [event\_info\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. [EventInfoViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. deleteAgendaItem method

##### EventInfoViewModel class





talawa
1.0.0+1






