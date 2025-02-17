::::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_event_search_delegate/EventSearch-class-sidebar.html" below-sidebar=""}
<div>

# [buildResults]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[buildResults]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#buildResults-param-context .parameter}

)

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
The results shown after the user submits a search from the search page.

The current value of
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
can be used to determine what the user searched for.

This method might be applied more than once to the same query. If your
[buildResults](../../widgets_event_search_delegate/EventSearch/buildResults.html)
method is computationally expensive, you may want to cache the search
results for one or more queries.

Typically, this method returns a
[ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
with the search results. When the user taps on a particular search
result,
[close](https://api.flutter.dev/flutter/material/SearchDelegate/close.html)
should be called with the selected result as argument. This will close
the search page and communicate the result back to the initial caller of
[showSearch](https://api.flutter.dev/flutter/material/showSearch.html).
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
Widget buildResults(BuildContext context) {
  return Container();
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
4.  buildResults method

##### EventSearch class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
