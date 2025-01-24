




AppSettingViewModel class - app\_setting\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/settings\_view\_models/app\_setting\_view\_model.dart](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library.html)
3. AppSettingViewModel class

AppSettingViewModel


dark\_mode

light\_mode




# AppSettingViewModel class


ViewModel for the App Settings functionality.

This ViewModel handles the logic and data for the application settings.


Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* AppSettingViewModel



## Constructors

[AppSettingViewModel](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel/AppSettingViewModel.html)()




## Properties

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[launchWebsite](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel/launchWebsite.html)(String url)
→ Future<bool>


Launches a website using the provided URL.

[logout](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel/logout.html)()
→ Future<void>


This method destroys the user's session or sign out the user from app, The function asks for the confimation in Custom Alert Dialog.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [app\_setting\_view\_model](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library.html)
3. AppSettingViewModel class

##### app\_setting\_view\_model library





talawa
1.0.0+1






