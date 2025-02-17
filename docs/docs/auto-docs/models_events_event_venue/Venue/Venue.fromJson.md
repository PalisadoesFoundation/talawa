::::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_venue/Venue-class-sidebar.html" below-sidebar=""}
<div>

# [Venue.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[Venue.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {.section .desc .markdown}
Creates a `Venue` instance from a JSON object.

The `json` parameter is a map containing the venue data.

Returns an instance of `Venue`.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
factory Venue.fromJson(Map<String, dynamic> json) {
  return Venue(
    id: json['_id'] as String?,
    capacity: json['capacity'] as int?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String? ?? '',
    name: json['name'] as String?,
    organizationId:
        (json['organization'] as Map<String, dynamic>?)?['_id'] as String?,
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_venue](../../models_events_event_venue/)
3.  [Venue](../../models_events_event_venue/Venue-class.html)
4.  Venue.fromJson factory constructor

##### Venue class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
