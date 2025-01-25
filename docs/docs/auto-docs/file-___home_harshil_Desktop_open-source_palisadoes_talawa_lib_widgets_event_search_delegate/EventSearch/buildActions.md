




buildActions method - EventSearch class - event\_search\_delegate library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/event\_search\_delegate.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_search_delegate/)
3. [EventSearch](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_search_delegate/EventSearch-class.html)
4. buildActions method

buildActions


dark\_mode

light\_mode




# buildActions method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[List](https://api.flutter.dev/flutter/dart-core/List-class.html)
buildActions(

1. dynamic context

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_search\_delegate](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_search_delegate/)
3. [EventSearch](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_event_search_delegate/EventSearch-class.html)
4. buildActions method

##### EventSearch class





talawa
1.0.0+1






