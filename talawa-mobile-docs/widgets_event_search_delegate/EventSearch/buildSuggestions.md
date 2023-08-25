


# buildSuggestions method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) buildSuggestions
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>Suggestions shown in the body of the search page while the user types a
query into the search field.</p>
<p>The delegate method is called whenever the content of <a href="https://api.flutter.dev/flutter/material/SearchDelegate/query.html">query</a> changes.
The suggestions should be based on the current <a href="https://api.flutter.dev/flutter/material/SearchDelegate/query.html">query</a> string. If the query
string is empty, it is good practice to show suggested queries based on
past queries or the current context.</p>
<p>Usually, this method will return a <a href="https://api.flutter.dev/flutter/widgets/ListView-class.html">ListView</a> with one <a href="https://api.flutter.dev/flutter/material/ListTile-class.html">ListTile</a> per
suggestion. When <a href="https://api.flutter.dev/flutter/material/ListTile/onTap.html">ListTile.onTap</a> is called, <a href="https://api.flutter.dev/flutter/material/SearchDelegate/query.html">query</a> should be updated
with the corresponding suggestion and the results page should be shown
by calling <a href="https://api.flutter.dev/flutter/material/SearchDelegate/showResults.html">showResults</a>.</p>



## Implementation

```dart
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







