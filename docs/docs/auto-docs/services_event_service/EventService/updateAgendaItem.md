::::::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [updateAgendaItem]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[updateAgendaItem]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [itemId]{.parameter-name}, ]{#updateAgendaItem-param-itemId
    .parameter}
2.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [variables]{.parameter-name}]{#updateAgendaItem-param-variables
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to update an agenda item.

**params**:

-   `itemId`: Id of agenda item which is to be updated
-   `variables`: A map of key-value pairs representing the variables
    required for the GraphQL mutation.

**returns**:

-   `Future<dynamic>`: Information about the updated agenda item.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<dynamic> updateAgendaItem(
  String itemId,
  Map<String, dynamic> variables,
) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().updateAgendaItem(),
    variables: {
      'updateAgendaItemId': itemId,
      'input': variables,
    },
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
4.  updateAgendaItem method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
