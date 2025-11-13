<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/navigation_service.dart](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.md)
4.  removeAllAndPush method

<div class="self-name">

removeAllAndPush

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_navigation_service/NavigationService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">removeAllAndPush</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)</span>
<span class="name">removeAllAndPush</span>(

1.  <span id="removeAllAndPush-param-routeName"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">routeName</span>, </span>
2.  <span id="removeAllAndPush-param-tillRoute"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">tillRoute</span>, )

</div>

<div class="section desc markdown">

This function remove all the routes till the particular route and add
new route.

**params**:

- `routeName`: Name of the Route
- `tillRoute`: Route till we want to remove
- `arguments`: Set of arguments

**returns**:

- `Future<dynamic>`: resolves if the Screen was succesfully
  removeAllAndPushed.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<dynamic> removeAllAndPush(
  String routeName,
  String tillRoute, ) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.md)
4.  removeAllAndPush method

##### NavigationService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
