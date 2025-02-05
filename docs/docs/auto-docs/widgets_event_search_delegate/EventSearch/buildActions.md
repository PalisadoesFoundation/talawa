


# buildActions method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)> buildActions
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>Widgets to display after the search query in the <a href="https://api.flutter.dev/flutter/material/AppBar-class.html">AppBar</a>.</p>
<p>If the <a href="https://api.flutter.dev/flutter/material/SearchDelegate/query.html">query</a> is not empty, this should typically contain a button to
clear the query and show the suggestions again (via <a href="https://api.flutter.dev/flutter/material/SearchDelegate/showSuggestions.html">showSuggestions</a>) if
the results are currently shown.</p>
<p>Returns null if no widget should be shown.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/material/AppBar/actions.html">AppBar.actions</a>, the intended use for the return value of this method.</li>
</ul>



## Implementation

```dart
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
```







