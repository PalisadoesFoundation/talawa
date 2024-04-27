


# buildSuggestionsSucess method








[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) buildSuggestionsSucess
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Event](../../models_events_event_model/Event-class.md)> suggestions)








## Implementation

```dart
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
                "exploreEventViewModel": exploreEventsViewModel
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







