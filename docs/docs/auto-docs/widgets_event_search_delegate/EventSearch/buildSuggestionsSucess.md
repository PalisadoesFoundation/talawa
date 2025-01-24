




buildSuggestionsSucess method - EventSearch class - event\_search\_delegate library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/event\_search\_delegate.dart](../../widgets_event_search_delegate/widgets_event_search_delegate-library.html)
3. [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4. buildSuggestionsSucess method

buildSuggestionsSucess


dark\_mode

light\_mode




# buildSuggestionsSucess method


[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
buildSuggestionsSucess(

1. List<[Event](../../models_events_event_model/Event-class.html)> suggestions

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_search\_delegate](../../widgets_event_search_delegate/widgets_event_search_delegate-library.html)
3. [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4. buildSuggestionsSucess method

##### EventSearch class





talawa
1.0.0+1






