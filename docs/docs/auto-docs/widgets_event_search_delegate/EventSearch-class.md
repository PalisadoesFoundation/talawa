
<div>

# EventSearch class

</div>


This class returns a list of the events which match the search query.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [SearchDelegate](https://api.flutter.dev/flutter/material/SearchDelegate-class.html)[\<[[Event](../models_events_event_model/Event-class.md)]\>]
    -   EventSearch



## Constructors

[[EventSearch](../widgets_event_search_delegate/EventSearch/EventSearch.md)][({[required [[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Event](../models_events_event_model/Event-class.md)]\>]] eventList, ][required [[ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md)] exploreEventsViewModel]})]

:   



## Properties

[[autocorrect](https://api.flutter.dev/flutter/material/SearchDelegate/autocorrect.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether to enable autocorrection.
    ::: features
    finalinherited
    :::

[[automaticallyImplyLeading](https://api.flutter.dev/flutter/material/SearchDelegate/automaticallyImplyLeading.html)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]
:   Controls whether we should try to imply the leading widget if null.
    ::: features
    getter/setter pairinherited
    :::

[[enableSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/enableSuggestions.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether to show input suggestions as the user types.
    ::: features
    finalinherited
    :::

[[eventList](../widgets_event_search_delegate/EventSearch/eventList.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.md)]\>]]

:   ::: features
    final
    :::

[[exploreEventsViewModel](../widgets_event_search_delegate/EventSearch/exploreEventsViewModel.md)] [↔ [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md)]

:   ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[keyboardType](https://api.flutter.dev/flutter/material/SearchDelegate/keyboardType.html)] [→ [TextInputType](https://api.flutter.dev/flutter/services/TextInputType-class.html)?]
:   The type of action button to use for the keyboard.
    ::: features
    finalinherited
    :::

[[leadingWidth](https://api.flutter.dev/flutter/material/SearchDelegate/leadingWidth.html)] [↔ [double](https://api.flutter.dev/flutter/dart-core/double-class.html)?]
:   Defines the width of
    [AppBar.leading](https://api.flutter.dev/flutter/material/AppBar/leading.html)
    widget.
    ::: features
    getter/setter pairinherited
    :::

[[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   The current query string shown in the
    [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
    ::: features
    getter/setter pairinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[searchFieldDecorationTheme](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldDecorationTheme.html)] [→ [InputDecorationTheme](https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html)?]
:   The
    [InputDecorationTheme](https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html)
    used to configure the search field\'s visuals.
    ::: features
    finalinherited
    :::

[[searchFieldLabel](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldLabel.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The hint text that is shown in the search field when it is empty.
    ::: features
    finalinherited
    :::

[[searchFieldStyle](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldStyle.html)] [→ [TextStyle](https://api.flutter.dev/flutter/painting/TextStyle-class.html)?]
:   The style of the
    [searchFieldLabel](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldLabel.html).
    ::: features
    finalinherited
    :::

[[textInputAction](https://api.flutter.dev/flutter/material/SearchDelegate/textInputAction.html)] [→ [TextInputAction](https://api.flutter.dev/flutter/services/TextInputAction.html)]
:   The text input action configuring the soft keyboard to a particular
    action button.
    ::: features
    finalinherited
    :::

[[transitionAnimation](https://api.flutter.dev/flutter/material/SearchDelegate/transitionAnimation.html)] [→ [Animation](https://api.flutter.dev/flutter/animation/Animation-class.html)[\<[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)]\>]]
:   [Animation](https://api.flutter.dev/flutter/animation/Animation-class.html)
    triggered when the search pages fades in or out.
    ::: features
    no setterinherited
    :::



## Methods

[[appBarTheme](https://api.flutter.dev/flutter/material/SearchDelegate/appBarTheme.html)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)] ]
:   The theme used to configure the search page.
    ::: features
    inherited
    :::

[[buildActions](../widgets_event_search_delegate/EventSearch/buildActions.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]\>]] ]
:   Widgets to display after the search query in the
    [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
    ::: features
    override
    :::

[[buildBottom](https://api.flutter.dev/flutter/material/SearchDelegate/buildBottom.html)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [PreferredSizeWidget](https://api.flutter.dev/flutter/widgets/PreferredSizeWidget-class.html)?] ]
:   Widget to display across the bottom of the
    [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
    ::: features
    inherited
    :::

[[buildFlexibleSpace](https://api.flutter.dev/flutter/material/SearchDelegate/buildFlexibleSpace.html)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)?] ]
:   Widget to display a flexible space in the
    [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
    ::: features
    inherited
    :::

[[buildLeading](../widgets_event_search_delegate/EventSearch/buildLeading.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)] ]
:   A widget to display before the current query in the
    [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
    ::: features
    override
    :::

[[buildResults](../widgets_event_search_delegate/EventSearch/buildResults.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)] ]
:   The results shown after the user submits a search from the search
    page.
    ::: features
    override
    :::

[[buildSuggestions](../widgets_event_search_delegate/EventSearch/buildSuggestions.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)] ]
:   Suggestions shown in the body of the search page while the user
    types a query into the search field.
    ::: features
    override
    :::

[[buildSuggestionsSucess](../widgets_event_search_delegate/EventSearch/buildSuggestionsSucess.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Event](../models_events_event_model/Event-class.md)]\>]] suggestions]) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)] ]

:   

[[close](https://api.flutter.dev/flutter/material/SearchDelegate/close.html)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[Event](../models_events_event_model/Event-class.md)] result]) → void ]
:   Closes the search page and returns to the underlying route.
    ::: features
    inherited
    :::

[dispose](https://api.flutter.dev/flutter/material/SearchDelegate/dispose.html) [→ void ]
:   Releases the resources.
    ::: features
    inherited
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[showResults](https://api.flutter.dev/flutter/material/SearchDelegate/showResults.html)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) → void ]
:   Transition from the suggestions returned by
    [buildSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/buildSuggestions.html)
    to the
    [query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
    results returned by
    [buildResults](https://api.flutter.dev/flutter/material/SearchDelegate/buildResults.html).
    ::: features
    inherited
    :::

[[showSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/showSuggestions.html)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) → void ]
:   Transition from showing the results returned by
    [buildResults](https://api.flutter.dev/flutter/material/SearchDelegate/buildResults.html)
    to showing the suggestions returned by
    [buildSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/buildSuggestions.html).
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [event_search_delegate](../widgets_event_search_delegate/)
3.  EventSearch class

##### event_search_delegate library







