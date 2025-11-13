<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/settings_view_models/app_setting_view_model.dart](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library.md)
3.  AppSettingViewModel class

<div class="self-name">

AppSettingViewModel

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library-sidebar.html"
below-sidebar="view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class-sidebar.html">

<div>

# <span class="kind-class">AppSettingViewModel</span> class

</div>

<div class="section desc markdown">

ViewModel for the App Settings functionality.

This ViewModel handles the logic and data for the application settings.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- AppSettingViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[AppSettingViewModel](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel/AppSettingViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties"
class="section summary offset-anchor inherited">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasListeners](../view_model_base_view_model/BaseModel/hasListeners.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether any listeners are currently registered.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
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

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](../view_model_base_view_model/BaseModel/addListener.md)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[dispose](../view_model_base_view_model/BaseModel/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](../view_model_base_view_model/BaseModel/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[launchWebsite](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel/launchWebsite.md)</span><span class="signature">(<span id="launchWebsite-param-url" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">url</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Launches a website using the provided URL.

<span class="name">[logout](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel/logout.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This method destroys the user's session or sign out the user from app,
The function asks for the confimation in Custom Alert Dialog.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[notifyListeners](../view_model_base_view_model/BaseModel/notifyListeners.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Call all the registered listeners.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[removeListener](../view_model_base_view_model/BaseModel/removeListener.md)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
<div class="features">

<span class="feature">inherited</span>

</div>

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
2.  [app_setting_view_model](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library.md)
3.  AppSettingViewModel class

##### app_setting_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
