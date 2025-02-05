


# SetUrlViewModel class









<p>SetUrlViewModel class helps to interact with model to serve data.</p>
<p>and react to user's input for Set Url Section.
Methods include:</p>
<ul>
<li><code>checkURLandNavigate</code></li>
<li><code>scanQR</code></li>
<li><code>initialise</code></li>
<li><code>checkURLandNavigate</code></li>
<li><code>checkURLandShowPopUp</code></li>
<li><code>scanQR</code></li>
<li><code>_onQRViewCreated</code></li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- SetUrlViewModel








## Constructors

[SetUrlViewModel](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/SetUrlViewModel.md) ()

   


## Properties

##### [formKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/formKey.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)>



formKey.  
_<span class="feature">final</span>_



##### [greeting](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/greeting.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>>



qrController.  
_<span class="feature">read / write</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [orgId](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/orgId.md) &#8596; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



organizationID.  
_<span class="feature">read / write</span>_



##### [qrKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/qrKey.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



qrKey.  
_<span class="feature">final</span>_



##### [result](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/result.md) &#8596; [Barcode](https://pub.dev/documentation/qr_code_scanner/1.0.1/qr_code_scanner/Barcode-class.html)



qrText.  
_<span class="feature">read / write</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [url](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/url.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



url.  
_<span class="feature">read / write</span>_



##### [urlFocus](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/urlFocus.md) &#8596; [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)



urlFocus.  
_<span class="feature">read / write</span>_



##### [validate](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/validate.md) &#8596; [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)



qrValidator.  
_<span class="feature">read / write</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [checkURLandNavigate](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/checkURLandNavigate.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) navigateTo, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) argument) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function check the URL and navigate to the respective URL.  




##### [checkURLandShowPopUp](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/checkURLandShowPopUp.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) argument) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function check the URL and navigate to the respective URL.  




##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">inherited</span>_



##### [initialise](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/initialise.md)({[String](https://api.flutter.dev/flutter/dart-core/String-class.html) inviteUrl = ''}) void



This function initialises the variables.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners.  
_<span class="feature">inherited</span>_



##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [scanQR](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/scanQR.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) void



This function create a widget which is used to scan the QR-code.  




##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_










## Constants

##### [imageUrlKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/imageUrlKey-constant.md) const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



imageUrlKey.  




##### [urlKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/urlKey-constant.md) const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



urlKey.  









