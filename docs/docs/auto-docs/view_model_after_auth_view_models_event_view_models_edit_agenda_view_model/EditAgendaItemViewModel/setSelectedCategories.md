::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [setSelectedCategories]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [setSelectedCategories]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [categories]{.parameter-name}]{#setSelectedCategories-param-categories
    .parameter}

)
:::

::: {.section .desc .markdown}
Updates the selected categories in the form.

**params**:

-   `categories`: The list of selected
    [AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html).

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void setSelectedCategories(List<AgendaCategory> categories) {
  _selectedCategories = categories;
  notifyListeners();
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
4.  setSelectedCategories method

##### EditAgendaItemViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
