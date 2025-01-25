::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [widgets/event_search_delegate.dart](../widgets_event_search_delegate/)
3.  EventSearch class

::: self-name
EventSearch
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_event_search_delegate/widgets_event_search_delegate-library-sidebar.html" below-sidebar="widgets_event_search_delegate/EventSearch-class-sidebar.html"}
<div>

# [EventSearch]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class returns a list of the events which match the search query.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [SearchDelegate](https://api.flutter.dev/flutter/material/SearchDelegate-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}
    -   EventSearch
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[EventSearch](../widgets_event_search_delegate/EventSearch/EventSearch.html)]{.name}[({[required [[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [eventList]{.parameter-name}, ]{#-param-eventList .parameter}[required [[ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)]{.type-annotation} [exploreEventsViewModel]{.parameter-name}]{#-param-exploreEventsViewModel .parameter}})]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[autocorrect](https://api.flutter.dev/flutter/material/SearchDelegate/autocorrect.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether to enable autocorrection.
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[automaticallyImplyLeading](https://api.flutter.dev/flutter/material/SearchDelegate/automaticallyImplyLeading.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.signature}
:   Controls whether we should try to imply the leading widget if null.
    ::: features
    [getter/setter pair]{.feature}[inherited]{.feature}
    :::

[[enableSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/enableSuggestions.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether to show input suggestions as the user types.
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[eventList](../widgets_event_search_delegate/EventSearch/eventList.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.signature}

:   ::: features
    [final]{.feature}
    :::

[[exploreEventsViewModel](../widgets_event_search_delegate/EventSearch/exploreEventsViewModel.html)]{.name} [↔ [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)]{.signature}

:   ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[keyboardType](https://api.flutter.dev/flutter/material/SearchDelegate/keyboardType.html)]{.name} [→ [TextInputType](https://api.flutter.dev/flutter/services/TextInputType-class.html)?]{.signature}
:   The type of action button to use for the keyboard.
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[leadingWidth](https://api.flutter.dev/flutter/material/SearchDelegate/leadingWidth.html)]{.name} [↔ [double](https://api.flutter.dev/flutter/dart-core/double-class.html)?]{.signature}
:   Defines the width of
    [AppBar.leading](https://api.flutter.dev/flutter/material/AppBar/leading.html)
    widget.
    ::: features
    [getter/setter pair]{.feature}[inherited]{.feature}
    :::

[[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   The current query string shown in the
    [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
    ::: features
    [getter/setter pair]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[searchFieldDecorationTheme](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldDecorationTheme.html)]{.name} [→ [InputDecorationTheme](https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html)?]{.signature}
:   The
    [InputDecorationTheme](https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html)
    used to configure the search field\'s visuals.
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[searchFieldLabel](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldLabel.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The hint text that is shown in the search field when it is empty.
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[searchFieldStyle](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldStyle.html)]{.name} [→ [TextStyle](https://api.flutter.dev/flutter/painting/TextStyle-class.html)?]{.signature}
:   The style of the
    [searchFieldLabel](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldLabel.html).
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[textInputAction](https://api.flutter.dev/flutter/material/SearchDelegate/textInputAction.html)]{.name} [→ [TextInputAction](https://api.flutter.dev/flutter/services/TextInputAction.html)]{.signature}
:   The text input action configuring the soft keyboard to a particular
    action button.
    ::: features
    [final]{.feature}[inherited]{.feature}
    :::

[[transitionAnimation](https://api.flutter.dev/flutter/material/SearchDelegate/transitionAnimation.html)]{.name} [→ [Animation](https://api.flutter.dev/flutter/animation/Animation-class.html)[\<[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   [Animation](https://api.flutter.dev/flutter/animation/Animation-class.html)
    triggered when the search pages fades in or out.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[appBarTheme](https://api.flutter.dev/flutter/material/SearchDelegate/appBarTheme.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#appBarTheme-param-context .parameter}) [→ [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)]{.returntype .parameter} ]{.signature}
:   The theme used to configure the search page.
    ::: features
    [inherited]{.feature}
    :::

[[buildActions](../widgets_event_search_delegate/EventSearch/buildActions.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#buildActions-param-context .parameter}) [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Widgets to display after the search query in the
    [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
    ::: features
    [override]{.feature}
    :::

[[buildBottom](https://api.flutter.dev/flutter/material/SearchDelegate/buildBottom.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#buildBottom-param-context .parameter}) [→ [PreferredSizeWidget](https://api.flutter.dev/flutter/widgets/PreferredSizeWidget-class.html)?]{.returntype .parameter} ]{.signature}
:   Widget to display across the bottom of the
    [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
    ::: features
    [inherited]{.feature}
    :::

[[buildFlexibleSpace](https://api.flutter.dev/flutter/material/SearchDelegate/buildFlexibleSpace.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#buildFlexibleSpace-param-context .parameter}) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)?]{.returntype .parameter} ]{.signature}
:   Widget to display a flexible space in the
    [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
    ::: features
    [inherited]{.feature}
    :::

[[buildLeading](../widgets_event_search_delegate/EventSearch/buildLeading.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#buildLeading-param-context .parameter}) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype .parameter} ]{.signature}
:   A widget to display before the current query in the
    [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).
    ::: features
    [override]{.feature}
    :::

[[buildResults](../widgets_event_search_delegate/EventSearch/buildResults.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#buildResults-param-context .parameter}) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype .parameter} ]{.signature}
:   The results shown after the user submits a search from the search
    page.
    ::: features
    [override]{.feature}
    :::

[[buildSuggestions](../widgets_event_search_delegate/EventSearch/buildSuggestions.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#buildSuggestions-param-context .parameter}) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype .parameter} ]{.signature}
:   Suggestions shown in the body of the search page while the user
    types a query into the search field.
    ::: features
    [override]{.feature}
    :::

[[buildSuggestionsSucess](../widgets_event_search_delegate/EventSearch/buildSuggestionsSucess.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [suggestions]{.parameter-name}]{#buildSuggestionsSucess-param-suggestions .parameter}) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype .parameter} ]{.signature}

:   

[[close](https://api.flutter.dev/flutter/material/SearchDelegate/close.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}, ]{#close-param-context .parameter}[[[Event](../models_events_event_model/Event-class.html)]{.type-annotation} [result]{.parameter-name}]{#close-param-result .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Closes the search page and returns to the underlying route.
    ::: features
    [inherited]{.feature}
    :::

[[dispose](https://api.flutter.dev/flutter/material/SearchDelegate/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Releases the resources.
    ::: features
    [inherited]{.feature}
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[showResults](https://api.flutter.dev/flutter/material/SearchDelegate/showResults.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#showResults-param-context .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Transition from the suggestions returned by
    [buildSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/buildSuggestions.html)
    to the
    [query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
    results returned by
    [buildResults](https://api.flutter.dev/flutter/material/SearchDelegate/buildResults.html).
    ::: features
    [inherited]{.feature}
    :::

[[showSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/showSuggestions.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#showSuggestions-param-context .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Transition from showing the results returned by
    [buildResults](https://api.flutter.dev/flutter/material/SearchDelegate/buildResults.html)
    to showing the suggestions returned by
    [buildSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/buildSuggestions.html).
    ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [event_search_delegate](../widgets_event_search_delegate/)
3.  EventSearch class

##### event_search_delegate library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
