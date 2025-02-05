


# SignupDetailsViewModel class









<p>SignupDetailsViewModel class helps to interact with model to serve data
and react to user's input for Sign Up Details section.</p>
<p>Methods include:</p>
<ul>
<li><code>signUp</code></li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- SignupDetailsViewModel








## Constructors

[SignupDetailsViewModel](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/SignupDetailsViewModel.md) ()

   


## Properties

##### [confirmFocus](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/confirmFocus.md) &#8596; [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)



  
_<span class="feature">read / write</span>_



##### [confirmPassword](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/confirmPassword.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">read / write</span>_



##### [email](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/email.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">read / write</span>_



##### [firstName](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/firstName.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">read / write</span>_



##### [formKey](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/formKey.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)>



  
_<span class="feature">final</span>_



##### [greeting](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/greeting.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>>



  
_<span class="feature">read / write</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hidePassword](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/hidePassword.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read / write</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [lastName](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/lastName.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">read / write</span>_



##### [password](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/password.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">read / write</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [selectedOrganization](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/selectedOrganization.md) &#8596; [OrgInfo](../models_organization_org_info/OrgInfo-class.md)



  
_<span class="feature">read / write</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [validate](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/validate.md) &#8596; [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)



  
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



##### [initialise](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/initialise.md)([OrgInfo](../models_organization_org_info/OrgInfo-class.md) org) void



  




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



##### [signUp](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/signUp.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to sign up the user into the application by passing the data to database query.
The function uses <code>gqlNonAuthMutation</code> method provided by <code>databaseFunctions</code> services.  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















