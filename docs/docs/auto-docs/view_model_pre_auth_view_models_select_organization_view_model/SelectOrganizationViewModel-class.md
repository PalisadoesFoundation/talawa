




SelectOrganizationViewModel class - select\_organization\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/pre\_auth\_view\_models/select\_organization\_view\_model.dart](../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. SelectOrganizationViewModel class

SelectOrganizationViewModel


dark\_mode

light\_mode




# SelectOrganizationViewModel class


SelectOrganizationViewModel class helps to interact with model to serve data and react to user's input in Select Organization View.

Methods include:

* `selectOrg`
* `onTapJoin`

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* SelectOrganizationViewModel



## Constructors

[SelectOrganizationViewModel](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/SelectOrganizationViewModel.html)()




## Properties

[allOrgController](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/allOrgController.html)
→ [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)

Organization selection required data.
final

[controller](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/controller.html)
→ [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)

Organization selection required data.
final

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

[organizations](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/organizations.html)
↔ List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>

Organization selection required data.
getter/setter pair

[orgId](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/orgId.html)
↔ String

Organization selection required data.
getter/setter pair

[qrKey](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/qrKey.html)
→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[State](https://api.flutter.dev/flutter/widgets/State-class.html)<[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>

Organization selection required data.
final

[result](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/result.html)
↔ [Barcode](https://pub.dev/documentation/qr_code_scanner/1.0.1/qr_code_scanner/Barcode-class.html)

Organization selection required data.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[searchController](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchController.html)
→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Organization selection required data.
final

[searchFocus](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchFocus.html)
→ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

Organization selection required data.
final

[searching](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searching.html)
↔ bool

Organization selection required data.
getter/setter pair

[selectedOrganization](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/selectedOrganization.html)
↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)

Organization selection required data.
getter/setter pair

[showSearchOrgList](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/showSearchOrgList.html)
↔ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)

Organization selection required data.
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

[fetchMoreHelper](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/fetchMoreHelper.html)([FetchMore](https://pub.dev/documentation/graphql_flutter/5.2.0-beta.7/graphql_flutter/FetchMore.html)<Object?> fetchMore, List organizations)
→ void


This function fetch more option.

[initialise](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/initialise.html)(String initialData)
→ Future<void>


initializer.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[onTapContinue](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/onTapContinue.html)()
→ void


Helper for listener to check if user can tap on continue option or not.

[onTapJoin](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/onTapJoin.html)()
→ Future<void>


This function make user to join the selected organization.

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[searchActive](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchActive.html)()
→ void


if search is enabled.

[selectOrg](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/selectOrg.html)([OrgInfo](../models_organization_org_info/OrgInfo-class.html) item)
→ Future<void>


This function select the organization.

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
2. [select\_organization\_view\_model](../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. SelectOrganizationViewModel class

##### select\_organization\_view\_model library





talawa
1.0.0+1






