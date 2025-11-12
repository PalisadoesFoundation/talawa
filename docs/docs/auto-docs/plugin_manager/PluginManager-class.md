<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [plugin/manager.dart](../plugin_manager/)
3.  PluginManager class

<div class="self-name">

PluginManager

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="plugin_manager/plugin_manager-library-sidebar.html"
below-sidebar="plugin_manager/PluginManager-class-sidebar.html">

<div>

# <span class="kind-class">PluginManager</span> class

</div>

<div class="section desc markdown">

A thin manager that wires the registry with bundled plugins.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[PluginManager](../plugin_manager/PluginManager/PluginManager.md)</span><span class="signature">(<span id="-param-registry" class="parameter"><span class="type-annotation">[PluginRegistry](../plugin_registry/PluginRegistry-class.md)</span> <span class="parameter-name">registry</span></span>)</span>  
Creates a new plugin manager.

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isInitialized](../plugin_manager/PluginManager/isInitialized.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether the manager is initialized.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[registry](../plugin_manager/PluginManager/registry.md)</span> <span class="signature">→ [PluginRegistry](../plugin_registry/PluginRegistry-class.md)</span>  
Underlying registry instance.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[routes](../plugin_manager/PluginManager/routes.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[PluginRoute](../plugin_types/PluginRoute-class.md)</span>\></span></span>  
Routes contributed by active plugins.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[getInjectors](../plugin_manager/PluginManager/getInjectors.md)</span><span class="signature">(<span id="getInjectors-param-type" class="parameter"><span class="type-annotation">[InjectorType](../plugin_types/InjectorType.md)</span> <span class="parameter-name">type</span></span>) <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[PluginInjectorExtension](../plugin_types/PluginInjectorExtension-class.md)</span>\></span></span> </span>  
Gets injectors for a specific type.

<span class="name">[getMenuItems](../plugin_manager/PluginManager/getMenuItems.md)</span><span class="signature">(<span id="getMenuItems-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[PluginMenuItem](../plugin_types/PluginMenuItem-class.md)</span>\></span></span> </span>  
Menu items contributed by active plugins.

<span class="name">[initialize](../plugin_manager/PluginManager/initialize.md)</span><span class="signature">(<span id="initialize-param-available" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[TalawaMobilePlugin](../plugin_types/TalawaMobilePlugin-class.md)</span>\></span></span> <span class="parameter-name">available</span>, ) <span class="returntype parameter">→ void</span> </span>  
Initializes from pre-bundled available plugins.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[reset](../plugin_manager/PluginManager/reset.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Resets the manager for testing or re-initialization.

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

<div id="static-properties" class="section summary offset-anchor">

## Static Properties

<span class="name">[instance](../plugin_manager/PluginManager/instance.md)</span> <span class="signature">→ [PluginManager](../plugin_manager/PluginManager-class.md)</span>  
Global singleton instance for app-wide plugin access.

<div class="features">

<span class="feature">final</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [manager](../plugin_manager/)
3.  PluginManager class

##### manager library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
