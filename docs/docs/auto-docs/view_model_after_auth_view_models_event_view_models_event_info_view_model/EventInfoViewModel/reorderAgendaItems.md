




reorderAgendaItems method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. reorderAgendaItems method

reorderAgendaItems


dark\_mode

light\_mode




# reorderAgendaItems method


Future<void>
reorderAgendaItems(

1. int oldIndex,
2. int newIndex

)

Method to redorder the sequence of agenda items.

**params**:

* `oldIndex`: old index of the item
* `newIndex`: new index of the item

**returns**:
None


## Implementation

```
Future<void> reorderAgendaItems(int oldIndex, int newIndex) async {
  int adjustedNewIndex = newIndex;

  if (oldIndex < adjustedNewIndex) {
    adjustedNewIndex -= 1;
  }

  final EventAgendaItem item = _agendaItems.removeAt(oldIndex);
  _agendaItems.insert(adjustedNewIndex, item);

  // Update sequences for all items
  for (int i = 0; i < _agendaItems.length; i++) {
    final item = _agendaItems[i];
    if (item.sequence != i + 1) {
      await updateAgendaItemSequence(item.id!, i + 1);
    }
  }

  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [event\_info\_view\_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. reorderAgendaItems method

##### EventInfoViewModel class





talawa
1.0.0+1






