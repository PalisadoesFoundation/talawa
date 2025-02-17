:::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_model/Attendee-class-sidebar.html" below-sidebar=""}
<div>

# [Attendee.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[Attendee.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Attendee.fromJson(Map<String, dynamic> json) {
  id = json['_id'] as String?;
  firstName = json['firstName'] as String?;
  lastName = json['lastName'] as String?;
  image = json['image'] as String?;
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_model](../../models_events_event_model/)
3.  [Attendee](../../models_events_event_model/Attendee-class.html)
4.  Attendee.fromJson constructor

##### Attendee class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
