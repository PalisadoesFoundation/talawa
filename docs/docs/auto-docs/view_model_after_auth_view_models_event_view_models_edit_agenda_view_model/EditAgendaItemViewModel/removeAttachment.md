::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [removeAttachment]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [removeAttachment]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [image]{.parameter-name}]{#removeAttachment-param-image .parameter}

)
:::

::: {.section .desc .markdown}
Removes an attachment from the agenda item.

**params**:

-   `image`: The base64 string representing the attachment to be
    removed.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void removeAttachment(String image) {
  _currentAttachments.remove(image);
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
4.  removeAttachment method

##### EditAgendaItemViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
