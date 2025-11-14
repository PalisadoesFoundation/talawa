<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [signup_details_view_model](../view_model_pre_auth_view_models_signup_details_view_model/view_model_pre_auth_view_models_signup_details_view_model-library.md)
3.  SignupDetailsViewModel class

<div class="self-name">

SignupDetailsViewModel

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_pre_auth_view_models_signup_details_view_model/view_model_pre_auth_view_models_signup_details_view_model-library-sidebar.html"
below-sidebar="view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class-sidebar.html">

<div>

# <span class="kind-class">SignupDetailsViewModel</span> class

</div>

<div class="section desc markdown">

SignupDetailsViewModel class helps to interact with model to serve data
and react to user's input for Sign Up Details section.

Methods include:

- `signUp`

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- SignupDetailsViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[SignupDetailsViewModel](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/SignupDetailsViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[confirmFocus](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/confirmFocus.md)</span> <span class="signature">↔ FocusNode</span>  
FocusNode to manage focus for the confirmation password input field.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[confirmPassword](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/confirmPassword.md)</span> <span class="signature">↔ TextEditingController</span>  
TextEditingController for handling confirmation password input field.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[email](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/email.md)</span> <span class="signature">↔ TextEditingController</span>  
TextEditingController for handling email input field.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[firstName](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/firstName.md)</span> <span class="signature">↔ TextEditingController</span>  
TextEditingController for handling first name input field.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[formKey](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/formKey.md)</span> <span class="signature">→ GlobalKey<span class="signature">\<<span class="type-parameter">FormState</span>\></span></span>  
GlobalKey to identify and manage the state of a form widget.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[greeting](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/greeting.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span>\></span></span>  
List of maps to store greeting information, where each greeting is
represented by a map with String keys and dynamic values.

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

<span class="name">[hidePassword](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/hidePassword.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Boolean to toggle password visibility (true for hidden, false for
visible).

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[lastName](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/lastName.md)</span> <span class="signature">↔ TextEditingController</span>  
TextEditingController for handling last name input field.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[password](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/password.md)</span> <span class="signature">↔ TextEditingController</span>  
TextEditingController for handling password input field.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[secureStorage](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/secureStorage.md)</span> <span class="signature">↔ [FlutterSecureStorage](https://pub.dev/documentation/flutter_secure_storage/9.2.4/flutter_secure_storage/FlutterSecureStorage-class.html)</span>  
Secure local storage instance.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[selectedOrganization](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/selectedOrganization.md)</span> <span class="signature">↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>  
Represents information about the selected organization.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[validate](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/validate.md)</span> <span class="signature">↔ AutovalidateMode</span>  
AutovalidateMode to determine when to perform automatic validation of
form fields.

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

<span class="name">[dispose](../view_model_base_view_model/BaseModel/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](../view_model_base_view_model/BaseModel/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[initialise](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/initialise.md)</span><span class="signature">(<span id="initialise-param-org" class="parameter"><span class="type-annotation">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span> <span class="parameter-name">org</span></span>) <span class="returntype parameter">→ void</span> </span>  
Initializes the greeting message for a selected organization.

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

<span class="name">[signUp](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/signUp.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Initiates the sign-up process.

<span class="name">[storingCredentialsInSecureStorage](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/storingCredentialsInSecureStorage.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Storing credentials in secure storage.

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
2.  [signup_details_view_model](../view_model_pre_auth_view_models_signup_details_view_model/view_model_pre_auth_view_models_signup_details_view_model-library.md)
3.  SignupDetailsViewModel class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
