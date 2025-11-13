<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/hive_manager.dart](../../services_hive_manager/services_hive_manager-library.md)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.md)
4.  registerAdapter\<<span class="type-parameter">T</span>\> static
    method

<div class="self-name">

registerAdapter

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_hive_manager/HiveManager-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">registerAdapter\<<span class="type-parameter">T</span>\></span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">registerAdapter</span>\<<span class="type-parameter">T</span>\>(

1.  <span id="registerAdapter-param-adapter"
    class="parameter"><span class="type-annotation">[TypeAdapter](https://pub.dev/documentation/hive/2.2.3/hive/TypeAdapter-class.md)<span class="signature">\<<span class="type-parameter">T</span>\></span></span>
    <span class="parameter-name">adapter</span></span>

)

</div>

<div class="section desc markdown">

Registers the `adapter` named adapter.

**params**:

- `adapter`: Adapter to register.

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static Future<void> registerAdapter<T>(TypeAdapter<T> adapter) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [hive_manager](../../services_hive_manager/services_hive_manager-library.md)
3.  [HiveManager](../../services_hive_manager/HiveManager-class.md)
4.  registerAdapter\<<span class="type-parameter">T</span>\> static
    method

##### HiveManager class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
