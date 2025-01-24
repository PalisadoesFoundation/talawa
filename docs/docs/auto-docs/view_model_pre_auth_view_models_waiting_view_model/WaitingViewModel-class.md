




WaitingViewModel class - waiting\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/pre\_auth\_view\_models/waiting\_view\_model.dart](../view_model_pre_auth_view_models_waiting_view_model/view_model_pre_auth_view_models_waiting_view_model-library.html)
3. WaitingViewModel class

WaitingViewModel


dark\_mode

light\_mode




# WaitingViewModel class


WaitingViewModel class helps to interact with model to serve data
and react to user's input for Waiting section.

Methods include:

* `logout`

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* WaitingViewModel



## Constructors

[WaitingViewModel](../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel/WaitingViewModel.html)()




## Properties

[currentUser](../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel/currentUser.html)
↔ [User](../models_user_user_info/User-class.html)

getter/setter pair

[greeting](../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel/greeting.html)
↔ List<Map<String, dynamic>>

getter/setter pair

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

[pendingRequestOrg](../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel/pendingRequestOrg.html)
↔ List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>

getter/setter pair

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

[initialise](../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel/initialise.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ void



[joinOrg](../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel/joinOrg.html)()
→ void



[logout](../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel/logout.html)()
→ void


This function ends the session for the user or logout the user from the application.

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
2. [waiting\_view\_model](../view_model_pre_auth_view_models_waiting_view_model/view_model_pre_auth_view_models_waiting_view_model-library.html)
3. WaitingViewModel class

##### waiting\_view\_model library





talawa
1.0.0+1






