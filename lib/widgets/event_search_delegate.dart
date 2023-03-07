// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/widgets/event_card.dart';

/// This class returns a list of the events which match the search query.
class EventSearch extends SearchDelegate<Event> {
  EventSearch({required this.eventList, required this.exploreEventsViewModel});
  ExploreEventsViewModel exploreEventsViewModel;

  final List<Event> eventList;

  @override
  List<Widget> buildActions(BuildContext context) {
    /// Returns an icon button which closes the search page and returns
    /// to the underlying route if the query is empty. Otherwise it sets the
    /// query empty.
    return [
      IconButton(
        onPressed: () {
          query.isNotEmpty ? query = '' : close(context, eventList.first);
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

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

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

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
}
