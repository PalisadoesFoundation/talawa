::::::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [addVolunteerToGroup]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[addVolunteerToGroup]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [variables]{.parameter-name}]{#addVolunteerToGroup-param-variables
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to add a volunteer to a group.

**params**:

-   `variables`: this will be `map` type and contain all the details
    needed to add a volunteer to a group.

**returns**:

-   `Future<dynamic>`: Information about the added volunteer.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<dynamic> addVolunteerToGroup(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().addVolunteerToGroup(),
    variables: {'data': variables},
  );
  return result;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  addVolunteerToGroup method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
