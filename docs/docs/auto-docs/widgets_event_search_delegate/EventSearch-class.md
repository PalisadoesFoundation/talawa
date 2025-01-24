




EventSearch class - event\_search\_delegate library - Dart API







menu

1. [talawa](../index.html)
2. [widgets/event\_search\_delegate.dart](../widgets_event_search_delegate/widgets_event_search_delegate-library.html)
3. EventSearch class

EventSearch


dark\_mode

light\_mode




# EventSearch class


This class returns a list of the events which match the search query.


Inheritance

* Object
* [SearchDelegate](https://api.flutter.dev/flutter/material/SearchDelegate-class.html)<[Event](../models_events_event_model/Event-class.html)>
* EventSearch



## Constructors

[EventSearch](../widgets_event_search_delegate/EventSearch/EventSearch.html)({required List<[Event](../models_events_event_model/Event-class.html)> eventList, required [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html) exploreEventsViewModel})




## Properties

[automaticallyImplyLeading](https://api.flutter.dev/flutter/material/SearchDelegate/automaticallyImplyLeading.html)
↔ bool?

Controls whether we should try to imply the leading widget if null.
getter/setter pairinherited

[eventList](../widgets_event_search_delegate/EventSearch/eventList.html)
→ List<[Event](../models_events_event_model/Event-class.html)>

final

[exploreEventsViewModel](../widgets_event_search_delegate/EventSearch/exploreEventsViewModel.html)
↔ [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)

getter/setter pair

[hashCode](https://api.flutter.dev/flutter/material/SearchDelegate/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[keyboardType](https://api.flutter.dev/flutter/material/SearchDelegate/keyboardType.html)
→ [TextInputType](https://api.flutter.dev/flutter/services/TextInputType-class.html)?

The type of action button to use for the keyboard.
finalinherited

[leadingWidth](https://api.flutter.dev/flutter/material/SearchDelegate/leadingWidth.html)
↔ double?

Defines the width of [AppBar.leading](https://api.flutter.dev/flutter/material/AppBar/leading.html) widget.
getter/setter pairinherited

[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
↔ String

The current query string shown in the [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
getter/setter pairinherited

[runtimeType](https://api.flutter.dev/flutter/material/SearchDelegate/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[searchFieldDecorationTheme](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldDecorationTheme.html)
→ [InputDecorationTheme](https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html)?

The [InputDecorationTheme](https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html) used to configure the search field's visuals.
finalinherited

[searchFieldLabel](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldLabel.html)
→ String?

The hint text that is shown in the search field when it is empty.
finalinherited

[searchFieldStyle](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldStyle.html)
→ [TextStyle](https://api.flutter.dev/flutter/painting/TextStyle-class.html)?

The style of the [searchFieldLabel](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldLabel.html).
finalinherited

[textInputAction](https://api.flutter.dev/flutter/material/SearchDelegate/textInputAction.html)
→ [TextInputAction](https://api.flutter.dev/flutter/services/TextInputAction.html)

The text input action configuring the soft keyboard to a particular action
button.
finalinherited

[transitionAnimation](https://api.flutter.dev/flutter/material/SearchDelegate/transitionAnimation.html)
→ [Animation](https://api.flutter.dev/flutter/animation/Animation-class.html)<double>

[Animation](https://api.flutter.dev/flutter/animation/Animation-class.html) triggered when the search pages fades in or out.
no setterinherited



## Methods

[appBarTheme](https://api.flutter.dev/flutter/material/SearchDelegate/appBarTheme.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)


The theme used to configure the search page.
inherited

[buildActions](../widgets_event_search_delegate/EventSearch/buildActions.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ List<[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)>


Widgets to display after the search query in the [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
override

[buildBottom](https://api.flutter.dev/flutter/material/SearchDelegate/buildBottom.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ [PreferredSizeWidget](https://api.flutter.dev/flutter/widgets/PreferredSizeWidget-class.html)?


Widget to display across the bottom of the [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
inherited

[buildFlexibleSpace](https://api.flutter.dev/flutter/material/SearchDelegate/buildFlexibleSpace.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)?


Widget to display a flexible space in the [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
inherited

[buildLeading](../widgets_event_search_delegate/EventSearch/buildLeading.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)


A widget to display before the current query in the [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
override

[buildResults](../widgets_event_search_delegate/EventSearch/buildResults.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)


The results shown after the user submits a search from the search page.
override

[buildSuggestions](../widgets_event_search_delegate/EventSearch/buildSuggestions.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)


Suggestions shown in the body of the search page while the user types a
query into the search field.
override

[buildSuggestionsSucess](../widgets_event_search_delegate/EventSearch/buildSuggestionsSucess.html)(List<[Event](../models_events_event_model/Event-class.html)> suggestions)
→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)



[close](https://api.flutter.dev/flutter/material/SearchDelegate/close.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, [Event](../models_events_event_model/Event-class.html) result)
→ void


Closes the search page and returns to the underlying route.
inherited

[dispose](https://api.flutter.dev/flutter/material/SearchDelegate/dispose.html)()
→ void


Releases the resources.
inherited

[noSuchMethod](https://api.flutter.dev/flutter/material/SearchDelegate/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[showResults](https://api.flutter.dev/flutter/material/SearchDelegate/showResults.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ void


Transition from the suggestions returned by [buildSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/buildSuggestions.html) to the
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html) results returned by [buildResults](https://api.flutter.dev/flutter/material/SearchDelegate/buildResults.html).
inherited

[showSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/showSuggestions.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ void


Transition from showing the results returned by [buildResults](https://api.flutter.dev/flutter/material/SearchDelegate/buildResults.html) to showing
the suggestions returned by [buildSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/buildSuggestions.html).
inherited

[toString](https://api.flutter.dev/flutter/material/SearchDelegate/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/material/SearchDelegate/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [event\_search\_delegate](../widgets_event_search_delegate/widgets_event_search_delegate-library.html)
3. EventSearch class

##### event\_search\_delegate library





talawa
1.0.0+1






