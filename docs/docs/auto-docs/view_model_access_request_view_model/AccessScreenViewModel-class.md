




AccessScreenViewModel class - access\_request\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/access\_request\_view\_model.dart](../view_model_access_request_view_model/view_model_access_request_view_model-library.html)
3. AccessScreenViewModel class

AccessScreenViewModel


dark\_mode

light\_mode




# AccessScreenViewModel class


AccessScreenViewModel widget.


Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* AccessScreenViewModel



## Constructors

[AccessScreenViewModel](../view_model_access_request_view_model/AccessScreenViewModel/AccessScreenViewModel.html)()




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

[optionalMessageController](../view_model_access_request_view_model/AccessScreenViewModel/optionalMessageController.html)
→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

text controller for optional message during the request.
final

[organizations](../view_model_access_request_view_model/AccessScreenViewModel/organizations.html)
↔ List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>

organizations list.
getter/setter pair

[orgId](../view_model_access_request_view_model/AccessScreenViewModel/orgId.html)
↔ String

org identifier.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[selectedOrganization](../view_model_access_request_view_model/AccessScreenViewModel/selectedOrganization.html)
↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)

selectedOrganization list.
getter/setter pair

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

[initialise](../view_model_access_request_view_model/AccessScreenViewModel/initialise.html)([OrgInfo](../models_organization_org_info/OrgInfo-class.html) org)
→ Future<void>


Initialization function.

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

[sendMembershipRequest](../view_model_access_request_view_model/AccessScreenViewModel/sendMembershipRequest.html)()
→ Future<void>


Sending member ship request function.

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
2. [access\_request\_view\_model](../view_model_access_request_view_model/view_model_access_request_view_model-library.html)
3. AccessScreenViewModel class

##### access\_request\_view\_model library





talawa
1.0.0+1






