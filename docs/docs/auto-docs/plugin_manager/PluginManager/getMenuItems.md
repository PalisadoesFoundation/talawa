<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [plugin/manager.dart](../../plugin_manager/)
3.  [PluginManager](../../plugin_manager/PluginManager-class.md)
4.  getMenuItems method

<div class="self-name">

getMenuItems

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="plugin_manager/PluginManager-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getMenuItems</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[PluginMenuItem](../../plugin_types/PluginMenuItem-class.md)</span>\></span></span>
<span class="name">getMenuItems</span>(

1.  <span id="getMenuItems-param-context"
    class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span>
    <span class="parameter-name">context</span></span>

)

</div>

<div class="section desc markdown">

Menu items contributed by active plugins.

**params**:

- `context`: Build context

**returns**:

- `List<PluginMenuItem>`: Menu items from plugins

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
List<PluginMenuItem> getMenuItems(BuildContext context) =>
    registry.collectMenuItems(context);
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [manager](../../plugin_manager/)
3.  [PluginManager](../../plugin_manager/PluginManager-class.md)
4.  getMenuItems method

##### PluginManager class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
