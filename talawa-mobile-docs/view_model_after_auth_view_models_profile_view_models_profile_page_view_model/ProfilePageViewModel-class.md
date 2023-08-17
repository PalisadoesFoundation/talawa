


# ProfilePageViewModel class









<p>ProfilePageViewModel class helps to interact with model to serve data
and react to user's input in Profile Page view.</p>
<p>Methods include:</p>
<ul>
<li><code>logout</code></li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- ProfilePageViewModel








## Constructors

[ProfilePageViewModel](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/ProfilePageViewModel.md) ()

   


## Properties

##### [bottomSheetHeight](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/bottomSheetHeight.md) &#8596; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)



  
_<span class="feature">read / write</span>_



##### [currentOrg](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/currentOrg.md) &#8596; [OrgInfo](../models_organization_org_info/OrgInfo-class.md)



  
_<span class="feature">read / write</span>_



##### [currentUser](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/currentUser.md) &#8596; [User](../models_user_user_info/User-class.md)



  
_<span class="feature">read / write</span>_



##### [denomination](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/denomination.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>



  
_<span class="feature">final</span>_



##### [donationAmount](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationAmount.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">read / write</span>_



##### [donationCurrency](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationCurrency.md) &#8596; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



  
_<span class="feature">read / write</span>_



##### [donationCurrencySymbol](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationCurrencySymbol.md) &#8596; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



  
_<span class="feature">read / write</span>_



##### [donationField](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationField.md) &#8594; [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)



  
_<span class="feature">final</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [organisation](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/organisation.md) &#8596; [Box](https://pub.dev/documentation/hive/2.2.3/hive/Box-class.html)&lt;[OrgInfo](../models_organization_org_info/OrgInfo-class.md)>



  
_<span class="feature">late</span><span class="feature">final</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [scaffoldKey](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/scaffoldKey.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[ScaffoldState](https://api.flutter.dev/flutter/material/ScaffoldState-class.html)>



  
_<span class="feature">final</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [url](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/url.md) &#8596; [Box](https://pub.dev/documentation/hive/2.2.3/hive/Box-class.html)



  
_<span class="feature">late</span><span class="feature">final</span>_



##### [user](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/user.md) &#8596; [Box](https://pub.dev/documentation/hive/2.2.3/hive/Box-class.html)&lt;[User](../models_user_user_info/User-class.md)>



  
_<span class="feature">late</span><span class="feature">final</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [attachListener](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/attachListener.md)([Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) setter) void



  




##### [changeCurrency](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/changeCurrency.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) setter) void



This method changes the currency of the user for donation purpose.  




##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">inherited</span>_



##### [dominationButton](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/dominationButton.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) amount, [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) setter) [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)



This widget returns button for domination.  




##### [iconButton](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/iconButton.md)([Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) icon, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) onTap) [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)



This widget returns the button for social media sharing option.  




##### [initialize](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/initialize.md)() void



  




##### [invite](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/invite.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) void



This function generates the organization invitation link in a Dialog Box.
Dialog box contains the QR-code of organization invite link and social media sharing options.  




##### [logout](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/logout.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This method destroys the user's session or sign out the user from app.
The function asks for the confimation in Custom Alert Dialog.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners.  
_<span class="feature">inherited</span>_



##### [popBottomSheet](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/popBottomSheet.md)() void



  




##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [showSnackBar](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/showSnackBar.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) message) void



  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_



##### [updateSheetHeight](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/updateSheetHeight.md)() void



  






## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















