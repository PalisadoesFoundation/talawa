
<div>

# fetchCategories method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Method to fecth all agenda categories of an organisation.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  try {
    final result = await locator<EventService>()
        .fetchAgendaCategories(userConfig.currentOrg.id!) as QueryResult;

    if (result.data == null) return;

    final List categoryJson =
        result.data!['agendaItemCategoriesByOrganization'] as List;
    _categories = categoryJson
        .map((json) => AgendaCategory.fromJson(json as Map<String, dynamic>))
        .;

    ;
  } catch (e) {
    print('Error fetching categories: $e');
  }
}
```







1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  fetchCategories method

##### EventInfoViewModel class







