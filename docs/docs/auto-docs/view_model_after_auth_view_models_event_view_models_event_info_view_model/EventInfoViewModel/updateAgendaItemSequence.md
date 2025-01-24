




updateAgendaItemSequence method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. updateAgendaItemSequence method

updateAgendaItemSequence


dark\_mode

light\_mode




# updateAgendaItemSequence method


Future<void>
updateAgendaItemSequence(

1. String itemId,
2. int newSequence

)

Method to update the sequence of an agenda item.

**params**:

* `itemId`: id of the agenda item whose sequence need to be updated
* `newSequence`: new sequence of the item

**returns**:
None


## Implementation

```
Future<void> updateAgendaItemSequence(String itemId, int newSequence) async {
  try {
    final result = await locator<EventService>().updateAgendaItem(
      itemId,
      {'sequence': newSequence},
    ) as QueryResult<Object?>;

    final updatedItem = EventAgendaItem.fromJson(
      result.data!['updateAgendaItem'] as Map<String, dynamic>,
    );
    final index = _agendaItems.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      _agendaItems[index] = updatedItem;
      notifyListeners();
    }
  } catch (e) {
    print('Error updating agenda item sequence: $e');
  }
}
```

 


1. [talawa](../../index.html)
2. [event\_info\_view\_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. updateAgendaItemSequence method

##### EventInfoViewModel class





talawa
1.0.0+1






