::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/event_info_view_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  setSelectedCategories method

::: self-name
setSelectedCategories
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
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
method to select multiple categories.

**params**:

-   `categories`: define_the_param

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
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  setSelectedCategories method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
