::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/event_search_delegate.dart](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4.  buildLeading method

::: self-name
buildLeading
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_event_search_delegate/EventSearch-class-sidebar.html" below-sidebar=""}
<div>

# [buildLeading]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[buildLeading]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#buildLeading-param-context .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
A widget to display before the current query in the
[AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

Typically an
[IconButton](https://api.flutter.dev/flutter/material/IconButton-class.html)
configured with a
[BackButtonIcon](https://api.flutter.dev/flutter/material/BackButtonIcon-class.html)
that exits the search with
[close](https://api.flutter.dev/flutter/material/SearchDelegate/close.html).
One can also use an
[AnimatedIcon](https://api.flutter.dev/flutter/material/AnimatedIcon-class.html)
driven by
[transitionAnimation](https://api.flutter.dev/flutter/material/SearchDelegate/transitionAnimation.html),
which animates from e.g. a hamburger menu to the back button as the
search overlay fades in.

Returns null if no widget should be shown.

See also:

-   [AppBar.leading](https://api.flutter.dev/flutter/material/AppBar/leading.html),
    the intended use for the return value of this method.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
Widget buildLeading(BuildContext context) {
  /// Returns an icon button which closes the search page and returns
  /// to the underlying route
  return IconButton(
    onPressed: () {
      close(context, eventList.first);
    },
    icon: const Icon(Icons.arrow_back),
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_search_delegate](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4.  buildLeading method

##### EventSearch class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
