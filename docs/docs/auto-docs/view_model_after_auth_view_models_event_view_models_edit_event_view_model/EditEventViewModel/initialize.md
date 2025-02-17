::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialize]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialize]{.name}(

1.  [[[Event](../../models_events_event_model/Event-class.html)]{.type-annotation}
    [event]{.parameter-name}]{#initialize-param-event .parameter}

)
:::

::: {.section .desc .markdown}
Method to initialize the event and fill the edit form.

**params**:

-   `event`: An instance of `Event` that contains the details to
    initialize and fill the form.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialize(Event event) {
  _event = event;
  _fillEditForm();
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [edit_event_view_model](../../view_model_after_auth_view_models_event_view_models_edit_event_view_model/)
3.  [EditEventViewModel](../../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel-class.html)
4.  initialize method

##### EditEventViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
