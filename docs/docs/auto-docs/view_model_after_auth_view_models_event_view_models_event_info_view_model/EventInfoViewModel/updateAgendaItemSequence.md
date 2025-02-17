::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [updateAgendaItemSequence]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[updateAgendaItemSequence]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [itemId]{.parameter-name}, ]{#updateAgendaItemSequence-param-itemId
    .parameter}
2.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation}
    [newSequence]{.parameter-name}]{#updateAgendaItemSequence-param-newSequence
    .parameter}

)
:::

::: {.section .desc .markdown}
Method to update the sequence of an agenda item.

**params**:

-   `itemId`: id of the agenda item whose sequence need to be updated
-   `newSequence`: new sequence of the item

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  updateAgendaItemSequence method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
