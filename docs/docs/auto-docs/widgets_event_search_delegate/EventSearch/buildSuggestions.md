::::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_event_search_delegate/EventSearch-class-sidebar.html" below-sidebar=""}
<div>

# [buildSuggestions]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[buildSuggestions]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#buildSuggestions-param-context
    .parameter}

)

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Suggestions shown in the body of the search page while the user types a
query into the search field.

The delegate method is called whenever the content of
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
changes. The suggestions should be based on the current
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
string. If the query string is empty, it is good practice to show
suggested queries based on past queries or the current context.

Usually, this method will return a
[ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
with one
[ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html)
per suggestion. When
[ListTile.onTap](https://api.flutter.dev/flutter/material/ListTile/onTap.html)
is called,
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
should be updated with the corresponding suggestion and the results page
should be shown by calling
[showResults](https://api.flutter.dev/flutter/material/SearchDelegate/showResults.html).
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
Widget buildSuggestions(BuildContext context) {
  /// Returns a scrollable list through "buildSuggestionsSuccess" function.
  /// where() method Returns a new lazy Iterable with all elements that satisfy the predicate test.
  /// toList( ) method is used to convert an Iterable to a List.
  /// toLowerCase() converts all characters in a string to lower case.
  final suggestions = eventList.where((event) {
    final eventLowerCase = event.title!.toLowerCase();
    final queryLowerCase = query.toLowerCase();
    return eventLowerCase.startsWith(queryLowerCase);
  }).toList();
  return buildSuggestionsSucess(suggestions);
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_search_delegate](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4.  buildSuggestions method

##### EventSearch class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
