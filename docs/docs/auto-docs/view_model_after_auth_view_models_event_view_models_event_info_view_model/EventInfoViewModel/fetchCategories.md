::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [fetchCategories]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[fetchCategories]{.name}()
:::

::: {.section .desc .markdown}
Method to fecth all agenda categories of an organisation.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  fetchCategories method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
