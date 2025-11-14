<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [user_action_handler](../../services_user_action_handler/services_user_action_handler-library.md)
3.  [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.md)
4.  performAction method

<div class="self-name">

performAction

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_user_action_handler/ActionHandlerService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">performAction</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">performAction</span>(

1.  <span id="performAction-param-actionType"
    class="parameter">

)

</div>

<div class="section desc markdown">

Processes a user action based on its type, with error handling and UI
update.

**params**:

- `actionType`: Specifies whether the action is optimistic or critical.
- `action`: The action to perform, which returns a
  `Future<QueryResult<Object?>?>`.
- `onValidResult`: A function to handle the result when the action is
  successful.
- `onActionException`: A function to handle exceptions that occur during
  the action.
- `updateUI`: A function to update the UI immediately for optimistic
  actions or after API call for critical actions.
- `apiCallSuccessUpdateUI`: A function to update the UI upon successful
  API call.
- `criticalActionFailureMessage`: The error message to use when a
  critical action fails.
- `onActionFinally`: A function to execute regardless of the success or
  failure of the action.

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<void>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [user_action_handler](../../services_user_action_handler/services_user_action_handler-library.md)
3.  [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.md)
4.  performAction method

##### ActionHandlerService class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
