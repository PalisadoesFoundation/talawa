




buildLeading method - EventSearch class - event\_search\_delegate library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/event\_search\_delegate.dart](../../widgets_event_search_delegate/widgets_event_search_delegate-library.html)
3. [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4. buildLeading method

buildLeading


dark\_mode

light\_mode




# buildLeading method


1. @override

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
buildLeading(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)
override

A widget to display before the current query in the [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

Typically an [IconButton](https://api.flutter.dev/flutter/material/IconButton-class.html) configured with a [BackButtonIcon](https://api.flutter.dev/flutter/material/BackButtonIcon-class.html) that exits
the search with [close](https://api.flutter.dev/flutter/material/SearchDelegate/close.html). One can also use an [AnimatedIcon](https://api.flutter.dev/flutter/material/AnimatedIcon-class.html) driven by
[transitionAnimation](https://api.flutter.dev/flutter/material/SearchDelegate/transitionAnimation.html), which animates from e.g. a hamburger menu to the
back button as the search overlay fades in.

Returns null if no widget should be shown.

See also:

* [AppBar.leading](https://api.flutter.dev/flutter/material/AppBar/leading.html), the intended use for the return value of this method.

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_search\_delegate](../../widgets_event_search_delegate/widgets_event_search_delegate-library.html)
3. [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4. buildLeading method

##### EventSearch class





talawa
1.0.0+1






