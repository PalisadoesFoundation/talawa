::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [fetchAgendaItems]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[fetchAgendaItems]{.name}()
:::

::: {.section .desc .markdown}
Method to fetch all agenda items of an organization.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  fetchAgendaItems method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
