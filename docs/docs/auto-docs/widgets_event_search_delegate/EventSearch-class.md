


# EventSearch class









<p>This class returns a list of the events which match the search query.</p>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [SearchDelegate](https://api.flutter.dev/flutter/material/SearchDelegate-class.html)&lt;[Event](../models_events_event_model/Event-class.md)>
- EventSearch








## Constructors

[EventSearch](../widgets_event_search_delegate/EventSearch/EventSearch.md) ({required [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Event](../models_events_event_model/Event-class.md)> eventList, required [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md) exploreEventsViewModel})

   


## Properties

##### [eventList](../widgets_event_search_delegate/EventSearch/eventList.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Event](../models_events_event_model/Event-class.md)>



  
_<span class="feature">final</span>_



##### [exploreEventsViewModel](../widgets_event_search_delegate/EventSearch/exploreEventsViewModel.md) &#8596; [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md)



  
_<span class="feature">read / write</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [keyboardType](https://api.flutter.dev/flutter/material/SearchDelegate/keyboardType.html) &#8594; [TextInputType](https://api.flutter.dev/flutter/services/TextInputType-class.html)?



The type of action button to use for the keyboard.  
_<span class="feature">final</span><span class="feature">inherited</span>_



##### [query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html) &#8596; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



The current query string shown in the <a href="https://api.flutter.dev/flutter/material/AppBar-class.html">AppBar</a>.  
_<span class="feature">read / write</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [searchFieldDecorationTheme](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldDecorationTheme.html) &#8594; [InputDecorationTheme](https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html)?



The <a href="https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html">InputDecorationTheme</a> used to configure the search field's visuals.  
_<span class="feature">final</span><span class="feature">inherited</span>_



##### [searchFieldLabel](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldLabel.html) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?



The hint text that is shown in the search field when it is empty.  
_<span class="feature">final</span><span class="feature">inherited</span>_



##### [searchFieldStyle](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldStyle.html) &#8594; [TextStyle](https://api.flutter.dev/flutter/painting/TextStyle-class.html)?



The style of the <a href="https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldLabel.html">searchFieldLabel</a>.  
_<span class="feature">final</span><span class="feature">inherited</span>_



##### [textInputAction](https://api.flutter.dev/flutter/material/SearchDelegate/textInputAction.html) &#8594; [TextInputAction](https://api.flutter.dev/flutter/services/TextInputAction.html)



The text input action configuring the soft keyboard to a particular action
button.  
_<span class="feature">final</span><span class="feature">inherited</span>_



##### [transitionAnimation](https://api.flutter.dev/flutter/material/SearchDelegate/transitionAnimation.html) &#8594; [Animation](https://api.flutter.dev/flutter/animation/Animation-class.html)&lt;[double](https://api.flutter.dev/flutter/dart-core/double-class.html)>



<a href="https://api.flutter.dev/flutter/animation/Animation-class.html">Animation</a> triggered when the search pages fades in or out.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [appBarTheme](https://api.flutter.dev/flutter/material/SearchDelegate/appBarTheme.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)



The theme used to configure the search page.  
_<span class="feature">inherited</span>_



##### [buildActions](../widgets_event_search_delegate/EventSearch/buildActions.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)>



Widgets to display after the search query in the <a href="https://api.flutter.dev/flutter/material/AppBar-class.html">AppBar</a>.  
_<span class="feature">override</span>_



##### [buildBottom](https://api.flutter.dev/flutter/material/SearchDelegate/buildBottom.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) [PreferredSizeWidget](https://api.flutter.dev/flutter/widgets/PreferredSizeWidget-class.html)?



Widget to display across the bottom of the <a href="https://api.flutter.dev/flutter/material/AppBar-class.html">AppBar</a>.  
_<span class="feature">inherited</span>_



##### [buildLeading](../widgets_event_search_delegate/EventSearch/buildLeading.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)



A widget to display before the current query in the <a href="https://api.flutter.dev/flutter/material/AppBar-class.html">AppBar</a>.  
_<span class="feature">override</span>_



##### [buildResults](../widgets_event_search_delegate/EventSearch/buildResults.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)



The results shown after the user submits a search from the search page.  
_<span class="feature">override</span>_



##### [buildSuggestions](../widgets_event_search_delegate/EventSearch/buildSuggestions.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)



Suggestions shown in the body of the search page while the user types a
query into the search field.  
_<span class="feature">override</span>_



##### [buildSuggestionsSucess](../widgets_event_search_delegate/EventSearch/buildSuggestionsSucess.md)([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Event](../models_events_event_model/Event-class.md)> suggestions) [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)



  




##### [close](https://api.flutter.dev/flutter/material/SearchDelegate/close.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, [Event](../models_events_event_model/Event-class.md) result) void



Closes the search page and returns to the underlying route.  
_<span class="feature">inherited</span>_



##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [showResults](https://api.flutter.dev/flutter/material/SearchDelegate/showResults.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) void



Transition from the suggestions returned by <a href="../widgets_event_search_delegate/EventSearch/buildSuggestions.md">buildSuggestions</a> to the
<a href="https://api.flutter.dev/flutter/material/SearchDelegate/query.html">query</a> results returned by <a href="../widgets_event_search_delegate/EventSearch/buildResults.md">buildResults</a>.  
_<span class="feature">inherited</span>_



##### [showSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/showSuggestions.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) void



Transition from showing the results returned by <a href="../widgets_event_search_delegate/EventSearch/buildResults.md">buildResults</a> to showing
the suggestions returned by <a href="../widgets_event_search_delegate/EventSearch/buildSuggestions.md">buildSuggestions</a>.  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















