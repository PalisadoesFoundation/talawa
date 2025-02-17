::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [reorderAgendaItems]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[reorderAgendaItems]{.name}(

1.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation}
    [oldIndex]{.parameter-name}, ]{#reorderAgendaItems-param-oldIndex
    .parameter}
2.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation}
    [newIndex]{.parameter-name}]{#reorderAgendaItems-param-newIndex
    .parameter}

)
:::

::: {.section .desc .markdown}
Method to redorder the sequence of agenda items.

**params**:

-   `oldIndex`: old index of the item
-   `newIndex`: new index of the item

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  reorderAgendaItems method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
