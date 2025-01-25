::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/event_search_delegate.dart](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4.  buildSuggestionsSucess method

::: self-name
buildSuggestionsSucess
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_event_search_delegate/EventSearch-class-sidebar.html" below-sidebar=""}
<div>

# [buildSuggestionsSucess]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[buildSuggestionsSucess]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [suggestions]{.parameter-name}]{#buildSuggestionsSucess-param-suggestions
    .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Widget buildSuggestionsSucess(List<Event> suggestions) {
  /// Takes a List of Events as parameter which is passed by the "buildSuggestions" function.
  /// Returns a SingleChildScrollView of the events from the list.
  /// SingleChildScrollView is box in which a single widget can be scrolled.
  return SingleChildScrollView(
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        final highlightedText =
            suggestions[index].title!.substring(0, query.length);
        final normalText = suggestions[index].title!.substring(query.length);

        /// Returns a widget that detects gestures.
        /// Defers to its child for its sizing behavior.
        /// Navigates to the screen with the event information.
        return GestureDetector(
          onTap: () {
            navigationService.pushScreen(
              "/eventInfo",
              arguments: {
                "event": suggestions[index],
                "exploreEventViewModel": exploreEventsViewModel,
              },
            );
          },
          child: EventCard(
            event: suggestions[index],
            isSearchItem: true,
            eventTitleHighlightedText: highlightedText,
            eventTitleNormalText: normalText,
          ),
        );
      },
    ),
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
4.  buildSuggestionsSucess method

##### EventSearch class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
