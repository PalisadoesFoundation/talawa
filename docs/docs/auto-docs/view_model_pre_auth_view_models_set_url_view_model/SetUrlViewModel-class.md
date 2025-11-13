<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/pre_auth_view_models/set_url_view_model.dart](../view_model_pre_auth_view_models_set_url_view_model/view_model_pre_auth_view_models_set_url_view_model-library.md)
3.  SetUrlViewModel class

<div class="self-name">

SetUrlViewModel

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_pre_auth_view_models_set_url_view_model/view_model_pre_auth_view_models_set_url_view_model-library-sidebar.html"
below-sidebar="view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class-sidebar.html">

<div>

# <span class="kind-class">SetUrlViewModel</span> class

</div>

<div class="section desc markdown">

SetUrlViewModel class helps to interact with model to serve data.

and react to user's input for Set Url Section. Methods include:

- `checkURLandNavigate`
- `scanQR`
- `initialise`
- `checkURLandNavigate`
- `checkURLandShowPopUp`
- `scanQR`
- `_onQRViewCreated`

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- SetUrlViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[SetUrlViewModel](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/SetUrlViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[formKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/formKey.md)</span> <span class="signature">→ GlobalKey<span class="signature">\<<span class="type-parameter">FormState</span>\></span></span>  
formKey.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[greeting](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/greeting.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span>\></span></span>  
qrController.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

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

<span class="name">[orgId](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/orgId.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
organizationID.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[qrKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/qrKey.md)</span> <span class="signature">→ GlobalKey<span class="signature">\<<span class="type-parameter">State<span class="signature">\<<span class="type-parameter">StatefulWidget</span>\></span></span>\></span></span>  
qrKey.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[result](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/result.md)</span> <span class="signature">↔ [Barcode](https://pub.dev/documentation/qr_code_scanner_plus/2.0.14/qr_code_scanner_plus/Barcode-class.html)</span>  
qrText.

<div class="features">

<span class="feature">getter/setter pair</span>

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

<span class="name">[url](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/url.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
url.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[validate](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/validate.md)</span> <span class="signature">↔ AutovalidateMode</span>  
qrValidator.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](../view_model_base_view_model/BaseModel/addListener.md)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[checkURLandNavigate](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/checkURLandNavigate.md)</span><span class="signature">(<span id="checkURLandNavigate-param-navigateTo" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">navigateTo</span>, </span><span id="checkURLandNavigate-param-argument" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">argument</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function check the URL and navigate to the respective URL.

<span class="name">[dispose](../view_model_base_view_model/BaseModel/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](../view_model_base_view_model/BaseModel/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[initialise](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/initialise.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function initialises the variables.

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

<span class="name">[scanQR](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/scanQR.md)</span><span class="signature">(<span id="scanQR-param-context" class="parameter"><span class="type-annotation">BuildContext</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ void</span> </span>  
This function create a widget which is used to scan the QR-code.

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

<div id="constants" class="section summary offset-anchor">

## Constants

<span class="name">[imageUrlKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/imageUrlKey-constant.md)</span> <span class="signature">→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
imageUrlKey.

<span class="name">[urlKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/urlKey-constant.md)</span> <span class="signature">→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
urlKey.

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [set_url_view_model](../view_model_pre_auth_view_models_set_url_view_model/view_model_pre_auth_view_models_set_url_view_model-library.md)
3.  SetUrlViewModel class

##### set_url_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
