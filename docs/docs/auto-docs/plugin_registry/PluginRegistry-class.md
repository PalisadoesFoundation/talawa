<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [plugin/registry.dart](../plugin_registry/)
3.  PluginRegistry class

<div class="self-name">

PluginRegistry

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="plugin_registry/plugin_registry-library-sidebar.html"
below-sidebar="plugin_registry/PluginRegistry-class-sidebar.html">

<div>

# <span class="kind-class">PluginRegistry</span> class

</div>

<div class="section desc markdown">

A very small in-memory registry for activated plugins.

**params**: None

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[PluginRegistry.new](../plugin_registry/PluginRegistry/PluginRegistry.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[all](../plugin_registry/PluginRegistry/all.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[TalawaMobilePlugin](../plugin_types/TalawaMobilePlugin-class.md)</span>\></span></span>  
All registered plugins.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

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

<span class="name">[clear](../plugin_registry/PluginRegistry/clear.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Removes all registered plugins.

<span class="name">[collectInjectors](../plugin_registry/PluginRegistry/collectInjectors.md)</span><span class="signature">(<span id="collectInjectors-param-type" class="parameter"><span class="type-annotation">[InjectorType](../plugin_types/InjectorType.md)</span> <span class="parameter-name">type</span></span>) <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[PluginInjectorExtension](../plugin_types/PluginInjectorExtension-class.md)</span>\></span></span> </span>  
Collects injectors for a specific type.

<span class="name">[collectMenuItems](../plugin_registry/PluginRegistry/collectMenuItems.md)</span><span class="signature">(<span id="collectMenuItems-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[PluginMenuItem](../plugin_types/PluginMenuItem-class.md)</span>\></span></span> </span>  
Collects menu items from registered plugins.

<span class="name">[collectRoutes](../plugin_registry/PluginRegistry/collectRoutes.md)</span><span class="signature"> <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[PluginRoute](../plugin_types/PluginRoute-class.md)</span>\></span></span> </span>  
Collects all routes from registered plugins.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[register](../plugin_registry/PluginRegistry/register.md)</span><span class="signature">(<span id="register-param-plugin" class="parameter"><span class="type-annotation">[TalawaMobilePlugin](../plugin_types/TalawaMobilePlugin-class.md)</span> <span class="parameter-name">plugin</span></span>) <span class="returntype parameter">→ void</span> </span>  
Registers a single plugin.

<span class="name">[registerAll](../plugin_registry/PluginRegistry/registerAll.md)</span><span class="signature">(<span id="registerAll-param-plugins" class="parameter"><span class="type-annotation">[Iterable](https://api.flutter.dev/flutter/dart-core/Iterable-class.md)<span class="signature">\<<span class="type-parameter">[TalawaMobilePlugin](../plugin_types/TalawaMobilePlugin-class.md)</span>\></span></span> <span class="parameter-name">plugins</span></span>) <span class="returntype parameter">→ void</span> </span>  
Registers multiple plugins.

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
2.  [registry](../plugin_registry/)
3.  PluginRegistry class

##### registry library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
