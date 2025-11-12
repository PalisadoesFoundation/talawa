



menu

1.  [talawa](../../index.md)
2.  [widgets/event_search_delegate.dart](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildSuggestions method


buildSuggestions


 dark_mode   light_mode 




<div>

# buildSuggestions method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
buildSuggestions(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)]
    context]

)


override




Suggestions shown in the body of the search page while the user types a
query into the search field.

The delegate method is called whenever the content of
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
changes. The suggestions should be based on the current
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
string. If the query string is empty, it is good practice to show
suggested queries based on past queries or the current context.

Usually, this method will return a
[ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
with one
[ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html)
per suggestion. When
[ListTile.onTap](https://api.flutter.dev/flutter/material/ListTile/onTap.html)
is called,
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
should be updated with the corresponding suggestion and the results page
should be shown by calling
[showResults](https://api.flutter.dev/flutter/material/SearchDelegate/showResults.html).



## Implementation

``` language-dart
@override
Widget buildSuggestions(BuildContext context) 
```







1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildSuggestions method

##### EventSearch class









 talawa 1.0.0+1 
