::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialize]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialize]{.name}(

1.  [[[EventAgendaItem](../../models_events_event_agenda_item/EventAgendaItem-class.html)]{.type-annotation}
    [agendaItem]{.parameter-name}, ]{#initialize-param-agendaItem
    .parameter}
2.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [categories]{.parameter-name}]{#initialize-param-categories
    .parameter}

)
:::

::: {.section .desc .markdown}
aInitializes the ViewModel with the provided agenda item and categories.

**params**:

-   `agendaItem`: The
    [EventAgendaItem](../../models_events_event_agenda_item/EventAgendaItem-class.html)
    to be edited.
-   `categories`: List of all available
    [AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html)
    for the event.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialize(EventAgendaItem agendaItem, List<AgendaCategory> categories) {
  _agendaItem = agendaItem;
  _categories = categories;
  _fillEditForm();
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [edit_agenda_view_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4.  initialize method

##### EditAgendaItemViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
