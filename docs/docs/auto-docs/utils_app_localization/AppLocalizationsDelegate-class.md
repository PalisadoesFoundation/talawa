<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [app_localization](../utils_app_localization/utils_app_localization-library.md)
3.  AppLocalizationsDelegate class

<div class="self-name">

AppLocalizationsDelegate

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_app_localization/utils_app_localization-library-sidebar.html"
below-sidebar="utils_app_localization/AppLocalizationsDelegate-class-sidebar.html">

<div>

# <span class="kind-class">AppLocalizationsDelegate</span> class

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[AppLocalizationsDelegate](../utils_app_localization/AppLocalizationsDelegate/AppLocalizationsDelegate.md)</span><span class="signature">(<span id="-param-isTest" class="parameter"></span>)</span>  
<div class="constructor-modifier features">

const

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isTest](../utils_app_localization/AppLocalizationsDelegate/isTest.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[type](../utils_app_localization/AppLocalizationsDelegate/type.md)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
The type of the object returned by the
[load](../utils_app_localization/AppLocalizationsDelegate/load.md)
method, T by default.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[isSupported](../utils_app_localization/AppLocalizationsDelegate/isSupported.md)</span><span class="signature">(<span id="isSupported-param-locale" class="parameter"><span class="type-annotation">[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.md)</span> <span class="parameter-name">locale</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Whether resources for the given locale can be loaded by this delegate.

<span class="name">[load](../utils_app_localization/AppLocalizationsDelegate/load.md)</span><span class="signature">(<span id="load-param-locale" class="parameter"><span class="type-annotation">[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.md)</span> <span class="parameter-name">locale</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[AppLocalizations](../utils_app_localization/AppLocalizations-class.md)</span>\></span></span> </span>  
Start loading the resources for `locale`. The returned future completes
when the resources have finished loading.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[shouldReload](../utils_app_localization/AppLocalizationsDelegate/shouldReload.md)</span><span class="signature">(<span id="shouldReload-param-old" class="parameter">covariant <span class="type-annotation">[AppLocalizationsDelegate](../utils_app_localization/AppLocalizationsDelegate-class.md)</span> <span class="parameter-name">old</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Returns true if the resources for this delegate should be loaded again
by calling the
[load](../utils_app_localization/AppLocalizationsDelegate/load.md)
method.

<span class="name">[toString](../utils_app_localization/AppLocalizationsDelegate/toString.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
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
2.  [app_localization](../utils_app_localization/utils_app_localization-library.md)
3.  AppLocalizationsDelegate class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
