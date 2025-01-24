




buildSuggestions method - EventSearch class - event\_search\_delegate library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/event\_search\_delegate.dart](../../widgets_event_search_delegate/widgets_event_search_delegate-library.html)
3. [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4. buildSuggestions method

buildSuggestions


dark\_mode

light\_mode




# buildSuggestions method


1. @override

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
buildSuggestions(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)
override

Suggestions shown in the body of the search page while the user types a
query into the search field.

The delegate method is called whenever the content of [query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html) changes.
The suggestions should be based on the current [query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html) string. If the query
string is empty, it is good practice to show suggested queries based on
past queries or the current context.

Usually, this method will return a [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html) with one [ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html) per
suggestion. When [ListTile.onTap](https://api.flutter.dev/flutter/material/ListTile/onTap.html) is called, [query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html) should be updated
with the corresponding suggestion and the results page should be shown
by calling [showResults](https://api.flutter.dev/flutter/material/SearchDelegate/showResults.html).


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_search\_delegate](../../widgets_event_search_delegate/widgets_event_search_delegate-library.html)
3. [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4. buildSuggestions method

##### EventSearch class





talawa
1.0.0+1






