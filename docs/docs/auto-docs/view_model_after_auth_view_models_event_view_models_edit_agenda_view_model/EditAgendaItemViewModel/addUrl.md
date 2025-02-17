::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [addUrl]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [addUrl]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [url]{.parameter-name}]{#addUrl-param-url .parameter}

)
:::

::: {.section .desc .markdown}
Adds a URL to the agenda item.

**params**:

-   `url`: The URL string to be added.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void addUrl(String url) {
  if (url.isNotEmpty) {
    _currentUrls.add(url);
    notifyListeners();
  }
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
4.  addUrl method

##### EditAgendaItemViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
