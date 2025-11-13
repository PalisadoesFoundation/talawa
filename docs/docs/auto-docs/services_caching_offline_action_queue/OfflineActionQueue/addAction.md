<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/caching/offline_action_queue.dart](../../services_caching_offline_action_queue/services_caching_offline_action_queue-library.md)
3.  [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.md)
4.  addAction method

<div class="self-name">

addAction

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_caching_offline_action_queue/OfflineActionQueue-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">addAction</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span>
<span class="name">addAction</span>(

1.  <span id="addAction-param-action"
    class="parameter"><span class="type-annotation">[CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.md)</span>
    <span class="parameter-name">action</span></span>

)

</div>

<div class="section desc markdown">

Adds an action to the queue with a TTL.

**params**:

- `action`: the action to be added.

**returns**:

- `Future<bool>`: returns true if the action was added successfully,
  otherwise false.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<bool> addAction(CachedUserAction action) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [offline_action_queue](../../services_caching_offline_action_queue/services_caching_offline_action_queue-library.md)
3.  [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.md)
4.  addAction method

##### OfflineActionQueue class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
