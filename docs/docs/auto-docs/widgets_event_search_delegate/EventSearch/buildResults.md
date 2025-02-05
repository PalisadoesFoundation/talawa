


# buildResults method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) buildResults
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>The results shown after the user submits a search from the search page.</p>
<p>The current value of <a href="https://api.flutter.dev/flutter/material/SearchDelegate/query.html">query</a> can be used to determine what the user
searched for.</p>
<p>This method might be applied more than once to the same query.
If your <a href="../../widgets_event_search_delegate/EventSearch/buildResults.md">buildResults</a> method is computationally expensive, you may want
to cache the search results for one or more queries.</p>
<p>Typically, this method returns a <a href="https://api.flutter.dev/flutter/widgets/ListView-class.html">ListView</a> with the search results.
When the user taps on a particular search result, <a href="https://api.flutter.dev/flutter/material/SearchDelegate/close.html">close</a> should be called
with the selected result as argument. This will close the search page and
communicate the result back to the initial caller of <a href="https://api.flutter.dev/flutter/material/showSearch.html">showSearch</a>.</p>



## Implementation

```dart
@override
Widget buildResults(BuildContext context) {
  return Container();
}
```







