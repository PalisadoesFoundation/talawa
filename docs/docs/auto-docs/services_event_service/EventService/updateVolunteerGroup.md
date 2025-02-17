::::::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [updateVolunteerGroup]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[updateVolunteerGroup]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [variables]{.parameter-name}]{#updateVolunteerGroup-param-variables
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to update the information of a volunteer group.

**params**:

-   `variables`: This is a `Map<String, dynamic>` type that contains the
    ID of the volunteer group to be updated and the fields to be
    updated.

**returns**:

-   `Future<dynamic>`: Information about the updated volunteer group.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<dynamic> updateVolunteerGroup(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().updateVolunteerGroupMutation(),
    variables: variables,
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
4.  updateVolunteerGroup method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
