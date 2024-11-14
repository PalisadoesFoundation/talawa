


# LoginViewModel class









<p>LoginViewModel class helps to interact with model to serve data
and react to user's input in Login View.</p>
<p>Methods include:</p>
<ul>
<li><code>login</code></li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- LoginViewModel








## Constructors

[LoginViewModel](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/LoginViewModel.md) ()

   


## Properties

##### [email](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/email.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">read / write</span>_



##### [emailFocus](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/emailFocus.md) &#8596; [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)



  
_<span class="feature">read / write</span>_



##### [formKey](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/formKey.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)>



  
_<span class="feature">final</span>_



##### [greeting](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/greeting.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>>



  
_<span class="feature">read / write</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hidePassword](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/hidePassword.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read / write</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [password](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/password.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">read / write</span>_



##### [passwordFocus](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/passwordFocus.md) &#8596; [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)



  
_<span class="feature">read / write</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [validate](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/validate.md) &#8596; [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)



  
_<span class="feature">read / write</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">inherited</span>_



##### [initialize](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/initialize.md)() void



  




##### [login](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/login.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to sign-in the user into application.  




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



##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















