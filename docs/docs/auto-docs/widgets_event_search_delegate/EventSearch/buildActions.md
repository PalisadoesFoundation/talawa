
<div>

# buildActions method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]\>]]
buildActions(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]
    context]

)


override




Widgets to display after the search query in the
[AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

If the
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
is not empty, this should typically contain a button to clear the query
and show the suggestions again (via
[showSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/showSuggestions.html))
if the results are currently shown.

Returns null if no widget should be shown.

See also:

-   [AppBar.actions](https://api.flutter.dev/flutter/material/AppBar/actions.html),
    the intended use for the return value of this method.



## Implementation

``` language-dart
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
    ),
  ];
}
```







1.  [talawa](../../index.html)
2.  [event_search_delegate](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.html)
4.  buildActions method

##### EventSearch class







