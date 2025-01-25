




buildSuggestions method - EventSearch class - event\_search\_delegate library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/event\_search\_delegate.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_search_delegate/)
3. [EventSearch](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_search_delegate/EventSearch-class.html)
4. buildSuggestions method

buildSuggestions


dark\_mode

light\_mode




# buildSuggestions method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
buildSuggestions(

1. dynamic context

)

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
2. [event\_search\_delegate](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_search_delegate/)
3. [EventSearch](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_search_delegate/EventSearch-class.html)
4. buildSuggestions method

##### EventSearch class





talawa
1.0.0+1






