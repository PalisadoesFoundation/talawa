::::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_model/Attendee-class-sidebar.html" below-sidebar=""}
<div>

# [toJson]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
[dynamic]{.type-parameter}\>]{.signature}]{.returntype}
[toJson]{.name}()
:::

::: {.section .desc .markdown}
Converts the Attendee instance to a map structure..

This method is used to convert the Attendee instance to a map structure
that can be converted to a JSON object.

**params**: None

**returns**:

-   `Map<String, dynamic>`: A map structure that can be converted to a
    JSON object.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_id'] = this.id;
  data['firstName'] = this.firstName;
  data['lastName'] = this.lastName;
  data['image'] = this.image;
  return data;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_model](../../models_events_event_model/)
3.  [Attendee](../../models_events_event_model/Attendee-class.html)
4.  toJson method

##### Attendee class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
