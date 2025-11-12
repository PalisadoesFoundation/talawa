<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [widgets/event_search_delegate.dart](../widgets_event_search_delegate/)
3.  EventSearch class

<div class="self-name">

EventSearch

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="widgets_event_search_delegate/widgets_event_search_delegate-library-sidebar.html"
below-sidebar="widgets_event_search_delegate/EventSearch-class-sidebar.html">

<div>

# <span class="kind-class">EventSearch</span> class

</div>

<div class="section desc markdown">

This class returns a list of the events which match the search query.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [SearchDelegate](https://api.flutter.dev/flutter/material/SearchDelegate-class.html)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span>
- EventSearch

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[EventSearch](../widgets_event_search_delegate/EventSearch/EventSearch.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[autocorrect](https://api.flutter.dev/flutter/material/SearchDelegate/autocorrect.html)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether to enable autocorrection.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[automaticallyImplyLeading](https://api.flutter.dev/flutter/material/SearchDelegate/automaticallyImplyLeading.html)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>  
Controls whether we should try to imply the leading widget if null.

<div class="features">

<span class="feature">getter/setter
pair</span><span class="feature">inherited</span>

</div>

<span class="name">[enableSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/enableSuggestions.html)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether to show input suggestions as the user types.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[eventList](../widgets_event_search_delegate/EventSearch/eventList.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span></span>  
List of events.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[exploreEventsViewModel](../widgets_event_search_delegate/EventSearch/exploreEventsViewModel.md)</span> <span class="signature">↔ [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md)</span>  
The model that contains the logic for exploring events.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[keyboardType](https://api.flutter.dev/flutter/material/SearchDelegate/keyboardType.html)</span> <span class="signature">→ [TextInputType](https://api.flutter.dev/flutter/services/TextInputType-class.html)?</span>  
The type of action button to use for the keyboard.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[leadingWidth](https://api.flutter.dev/flutter/material/SearchDelegate/leadingWidth.html)</span> <span class="signature">↔ [double](https://api.flutter.dev/flutter/dart-core/double-class.html)?</span>  
Defines the width of
[AppBar.leading](https://api.flutter.dev/flutter/material/AppBar/leading.html)
widget.

<div class="features">

<span class="feature">getter/setter
pair</span><span class="feature">inherited</span>

</div>

<span class="name">[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
The current query string shown in the
[AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

<div class="features">

<span class="feature">getter/setter
pair</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[searchFieldDecorationTheme](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldDecorationTheme.html)</span> <span class="signature">→ [InputDecorationTheme](https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html)?</span>  
The
[InputDecorationTheme](https://api.flutter.dev/flutter/material/InputDecorationTheme-class.html)
used to configure the search field's visuals.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[searchFieldLabel](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldLabel.html)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The hint text that is shown in the search field when it is empty.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[searchFieldStyle](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldStyle.html)</span> <span class="signature">→ [TextStyle](https://api.flutter.dev/flutter/painting/TextStyle-class.html)?</span>  
The style of the
[searchFieldLabel](https://api.flutter.dev/flutter/material/SearchDelegate/searchFieldLabel.html).

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[textInputAction](https://api.flutter.dev/flutter/material/SearchDelegate/textInputAction.html)</span> <span class="signature">→ [TextInputAction](https://api.flutter.dev/flutter/services/TextInputAction.html)</span>  
The text input action configuring the soft keyboard to a particular
action button.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[transitionAnimation](https://api.flutter.dev/flutter/material/SearchDelegate/transitionAnimation.html)</span> <span class="signature">→ [Animation](https://api.flutter.dev/flutter/animation/Animation-class.html)<span class="signature">\<<span class="type-parameter">[double](https://api.flutter.dev/flutter/dart-core/double-class.html)</span>\></span></span>  
[Animation](https://api.flutter.dev/flutter/animation/Animation-class.html)
triggered when the search pages fades in or out.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[appBarTheme](https://api.flutter.dev/flutter/material/SearchDelegate/appBarTheme.html)</span><span class="signature">(<span id="appBarTheme-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)</span> </span>  
The theme used to configure the search page.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[buildActions](../widgets_event_search_delegate/EventSearch/buildActions.md)</span><span class="signature">(<span id="buildActions-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span>\></span></span> </span>  
Widgets to display after the search query in the
[AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[buildBottom](https://api.flutter.dev/flutter/material/SearchDelegate/buildBottom.html)</span><span class="signature">(<span id="buildBottom-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [PreferredSizeWidget](https://api.flutter.dev/flutter/widgets/PreferredSizeWidget-class.html)?</span> </span>  
Widget to display across the bottom of the
[AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[buildFlexibleSpace](https://api.flutter.dev/flutter/material/SearchDelegate/buildFlexibleSpace.html)</span><span class="signature">(<span id="buildFlexibleSpace-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)?</span> </span>  
Widget to display a flexible space in the
[AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[buildLeading](../widgets_event_search_delegate/EventSearch/buildLeading.md)</span><span class="signature">(<span id="buildLeading-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span> </span>  
A widget to display before the current query in the
[AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[buildResults](../widgets_event_search_delegate/EventSearch/buildResults.md)</span><span class="signature">(<span id="buildResults-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span> </span>  
The results shown after the user submits a search from the search page.

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[buildSuggestions](../widgets_event_search_delegate/EventSearch/buildSuggestions.md)</span><span class="signature">(<span id="buildSuggestions-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span> </span>  
Suggestions shown in the body of the search page while the user types a
query into the search field.

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[buildSuggestionsSucess](../widgets_event_search_delegate/EventSearch/buildSuggestionsSucess.md)</span><span class="signature">(<span id="buildSuggestionsSucess-param-suggestions" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[Event](../models_events_event_model/Event-class.md)</span>\></span></span> <span class="parameter-name">suggestions</span></span>) <span class="returntype parameter">→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span> </span>  
Builds the suggestion success widget.

<span class="name">[close](https://api.flutter.dev/flutter/material/SearchDelegate/close.html)</span><span class="signature">(<span id="close-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span>, </span><span id="close-param-result" class="parameter"><span class="type-annotation">[Event](../models_events_event_model/Event-class.md)</span> <span class="parameter-name">result</span></span>) <span class="returntype parameter">→ void</span> </span>  
Closes the search page and returns to the underlying route.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[dispose](https://api.flutter.dev/flutter/material/SearchDelegate/dispose.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Releases the resources.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[showResults](https://api.flutter.dev/flutter/material/SearchDelegate/showResults.html)</span><span class="signature">(<span id="showResults-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ void</span> </span>  
Transition from the suggestions returned by
[buildSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/buildSuggestions.html)
to the
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
results returned by
[buildResults](https://api.flutter.dev/flutter/material/SearchDelegate/buildResults.html).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[showSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/showSuggestions.html)</span><span class="signature">(<span id="showSuggestions-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ void</span> </span>  
Transition from showing the results returned by
[buildResults](https://api.flutter.dev/flutter/material/SearchDelegate/buildResults.html)
to showing the suggestions returned by
[buildSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/buildSuggestions.html).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [event_search_delegate](../widgets_event_search_delegate/)
3.  EventSearch class

##### event_search_delegate library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
