<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/user_action_handler.dart](../../services_user_action_handler/services_user_action_handler-library.md)
3.  [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.md)
4.  executeApiCall method

<div class="self-name">

executeApiCall

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_user_action_handler/ActionHandlerService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">executeApiCall</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>\></span></span>
<span class="name">executeApiCall</span>

</div>

<div class="section desc markdown">

Method to execute an API action.

**params**:

- `action`: A function that performs the API call and returns a
  `Future<QueryResult<Object?>?>`.
- `onValidResult`: A function to handle the result when the API call is
  successful.
- `onActionException`: A function to handle exceptions that occur during
  the API call.
- `onActionFinally`: A function to execute regardless of the success or
  failure of the API call.

**returns**:

- `Future<bool?>`: that indicates the success (`true`), failure
  (`false`), or null if the result is invalid.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<bool?>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [user_action_handler](../../services_user_action_handler/services_user_action_handler-library.md)
3.  [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.md)
4.  executeApiCall method

##### ActionHandlerService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
