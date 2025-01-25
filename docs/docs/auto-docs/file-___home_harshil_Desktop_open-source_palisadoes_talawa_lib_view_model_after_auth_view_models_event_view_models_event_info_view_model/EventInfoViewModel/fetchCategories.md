




fetchCategories method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. [EventInfoViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. fetchCategories method

fetchCategories


dark\_mode

light\_mode




# fetchCategories method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
fetchCategories()

Method to fecth all agenda categories of an organisation.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> fetchCategories() async {
  try {
    final result = await locator<EventService>()
        .fetchAgendaCategories(userConfig.currentOrg.id!) as QueryResult;

    if (result.data == null) return;

    final List categoryJson =
        result.data!['agendaItemCategoriesByOrganization'] as List;
    _categories = categoryJson
        .map((json) => AgendaCategory.fromJson(json as Map<String, dynamic>))
        .toList();

    notifyListeners();
  } catch (e) {
    print('Error fetching categories: $e');
  }
}
```

 


1. [talawa](../../index.html)
2. [event\_info\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. [EventInfoViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. fetchCategories method

##### EventInfoViewModel class





talawa
1.0.0+1






