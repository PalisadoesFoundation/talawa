
<div>

# buildSuggestionsSucess method

</div>


[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
buildSuggestionsSucess(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Event](../../models_events_event_model/Event-class.md)]\>]]
    suggestions]

)



## Implementation

``` language-dart
Widget buildSuggestionsSucess(List<Event> suggestions) {
  /// Takes a List of Events as parameter which is passed by the "buildSuggestions" function.
  /// Returns a SingleChildScrollView of the events from the list.
  /// SingleChildScrollView is box in which a single widget can be scrolled.
  return SingleChildScrollView(
    child: ListView.builder(
      physics: const ,
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







1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildSuggestionsSucess method

##### EventSearch class







