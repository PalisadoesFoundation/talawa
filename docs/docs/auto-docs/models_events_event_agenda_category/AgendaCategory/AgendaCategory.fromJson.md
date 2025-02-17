::::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_agenda_category/AgendaCategory-class-sidebar.html" below-sidebar=""}
<div>

# [AgendaCategory.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[AgendaCategory.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {.section .desc .markdown}
Creates a new `AgendaCategory` instance from a JSON map.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
factory AgendaCategory.fromJson(Map<String, dynamic> json) {
  return AgendaCategory(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_agenda_category](../../models_events_event_agenda_category/)
3.  [AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html)
4.  AgendaCategory.fromJson factory constructor

##### AgendaCategory class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
