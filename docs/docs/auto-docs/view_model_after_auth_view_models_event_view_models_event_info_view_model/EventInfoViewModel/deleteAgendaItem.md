::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/event_info_view_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  deleteAgendaItem method

::: self-name
deleteAgendaItem
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [deleteAgendaItem]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[deleteAgendaItem]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [id]{.parameter-name}]{#deleteAgendaItem-param-id .parameter}

)
:::

::: {.section .desc .markdown}
Method to delete an agenda item.

more_info_if_required

**params**:

-   `id`: id of the gaenda item that is to be deleted

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> deleteAgendaItem(String id) async {
  try {
    await locator<EventService>()
        .deleteAgendaItem({"removeAgendaItemId": id});
    _agendaItems.removeWhere((item) => item.id == id);
    notifyListeners();
  } catch (e) {
    print('Error deleting agenda item: $e');
  }
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
4.  deleteAgendaItem method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
