<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [plugin/manager.dart](../../plugin_manager/plugin_manager-library.md)
3.  [PluginManager](../../plugin_manager/PluginManager-class.md)
4.  getInjectors method

<div class="self-name">

getInjectors

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="plugin_manager/PluginManager-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getInjectors</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[PluginInjectorExtension](../../plugin_types/PluginInjectorExtension-class.md)</span>\></span></span>
<span class="name">getInjectors</span>(

1.  <span id="getInjectors-param-type"
    class="parameter"><span class="type-annotation">[InjectorType](../../plugin_types/InjectorType.md)</span>
    <span class="parameter-name">type</span></span>

)

</div>

<div class="section desc markdown">

Gets injectors for a specific type.

**params**:

- `type`: Injector location/type

**returns**:

- `List<PluginInjectorExtension>`: Ordered injectors

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
List<PluginInjectorExtension> getInjectors(InjectorType type) =>
    registry.collectInjectors(type);
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [manager](../../plugin_manager/plugin_manager-library.md)
3.  [PluginManager](../../plugin_manager/PluginManager-class.md)
4.  getInjectors method

##### PluginManager class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
