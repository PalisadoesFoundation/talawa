


# AppLanguage class









<p>AppLanguage view model class interact with modal in the context of the App Language.
The class provides methods that set's the language, change the language in the modal.</p>
<p>Methods include:</p>
<ul>
<li><code>fetchLocale</code></li>
<li><code>changeLanguage</code></li>
<li><code>selectLanguagePress</code></li>
<li><code>dbLanguageUpdate</code></li>
<li><code>appLanguageQuery</code></li>
<li><code>userLanguageQuery</code></li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- AppLanguage








## Constructors

[AppLanguage](../view_model_lang_view_model/AppLanguage/AppLanguage.md) ({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isTest = false})

   


## Properties

##### [appLocal](../view_model_lang_view_model/AppLanguage/appLocal.md) &#8594; [Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)



  
_<span class="feature">read-only</span>_



##### [databaseFunctions](../view_model_lang_view_model/AppLanguage/databaseFunctions.md) &#8594; [DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions-class.md)



  
_<span class="feature">final</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isTest](../view_model_lang_view_model/AppLanguage/isTest.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">final</span>_



##### [navigationService](../view_model_lang_view_model/AppLanguage/navigationService.md) &#8594; [NavigationService](../services_navigation_service/NavigationService-class.md)



  
_<span class="feature">final</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [appLanguageQuery](../view_model_lang_view_model/AppLanguage/appLanguageQuery.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function perform graphQL query to check the app language.
The function uses <code>gqlAuthQuery</code> method provided by Database Functions Services.  




##### [changeLanguage](../view_model_lang_view_model/AppLanguage/changeLanguage.md)([Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) type) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function change the app default language.  




##### [dbLanguageUpdate](../view_model_lang_view_model/AppLanguage/dbLanguageUpdate.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function updates the Database Language by running the graphQL <code>mutations</code>.  




##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">inherited</span>_



##### [fetchLocale](../view_model_lang_view_model/AppLanguage/fetchLocale.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function fetch the language of the user's app.  




##### [initialize](../view_model_lang_view_model/AppLanguage/initialize.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



  




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



##### [selectLanguagePress](../view_model_lang_view_model/AppLanguage/selectLanguagePress.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function navigate user to <code>/appSettingsPage</code> route if the user is authenticated
else navigate to <code>/setUrl</code> route.  




##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_



##### [userLanguageQuery](../view_model_lang_view_model/AppLanguage/userLanguageQuery.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function perform graphQL query to check the user's language in the database.
The function uses <code>gqlAuthQuery</code> method provided by Database Functions Services.  






## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















