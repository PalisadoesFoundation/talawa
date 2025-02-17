
<div>

# fetchAgendaItems method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Method to fetch all agenda items of an organization.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  try {
    final result = await locator<EventService>().fetchAgendaItems(event.id!)
        as QueryResult;

    if (result.data == null) return;
    final List agendaJson = result.data!['agendaItemByEvent'] as List;
    _agendaItems = agendaJson
        .map((json) => EventAgendaItem.fromJson(json as Map<String, dynamic>))
        .;
    _agendaItems.sort((a, b) => a.sequence!.compareTo(b.sequence!));
    ;
  } catch (e) {
    print('Error fetching agenda items: $e');
  }
}
```







1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  fetchAgendaItems method

##### EventInfoViewModel class







