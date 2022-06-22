import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/widgets/event_card.dart';

class EventSearch extends SearchDelegate<Event> {
  EventSearch({required this.eventList, required this.exploreEventsViewModel});
  ExploreEventsViewModel exploreEventsViewModel;

  final List<Event> eventList;

  @override
  List<Widget> buildActions(BuildContext context) {
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
    final suggestions = eventList.where((event) {
      final eventLowerCase = event.title!.toLowerCase();
      final queryLowerCase = query.toLowerCase();
      return eventLowerCase.startsWith(queryLowerCase);
    }).toList();
    return buildSuggestionsSucess(suggestions);
  }

  Widget buildSuggestionsSucess(List<Event> suggestions) {
    return SingleChildScrollView(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          final highlightedText =
              suggestions[index].title!.substring(0, query.length);
          final normalText = suggestions[index].title!.substring(query.length);
          return GestureDetector(
            onTap: () {
              navigationService.pushScreen(
                "/eventInfo",
                arguments: {
                  "eventId": suggestions[index].id,
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
