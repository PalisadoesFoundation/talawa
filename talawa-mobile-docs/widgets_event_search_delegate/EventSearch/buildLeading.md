


# buildLeading method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) buildLeading
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>A widget to display before the current query in the <a href="https://api.flutter.dev/flutter/material/AppBar-class.html">AppBar</a>.</p>
<p>Typically an <a href="https://api.flutter.dev/flutter/material/IconButton-class.html">IconButton</a> configured with a <a href="https://api.flutter.dev/flutter/material/BackButtonIcon-class.html">BackButtonIcon</a> that exits
the search with <a href="https://api.flutter.dev/flutter/material/SearchDelegate/close.html">close</a>. One can also use an <a href="https://api.flutter.dev/flutter/material/AnimatedIcon-class.html">AnimatedIcon</a> driven by
<a href="https://api.flutter.dev/flutter/material/SearchDelegate/transitionAnimation.html">transitionAnimation</a>, which animates from e.g. a hamburger menu to the
back button as the search overlay fades in.</p>
<p>Returns null if no widget should be shown.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/material/AppBar/leading.html">AppBar.leading</a>, the intended use for the return value of this method.</li>
</ul>



## Implementation

```dart
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
```







