




CustomDrawerViewModel class - custom\_drawer\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/widgets\_view\_models/custom\_drawer\_view\_model.dart](../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. CustomDrawerViewModel class

CustomDrawerViewModel


dark\_mode

light\_mode




# CustomDrawerViewModel class


CustomDrawerViewModel class helps to serve the data and to react to user's input for Custom Dialog Widget.

Functions include:

* `switchOrg`
* `isPresentinSwitchableOrg`
* `setSelectedOrganizationName`

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* CustomDrawerViewModel



## Constructors

[CustomDrawerViewModel](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/CustomDrawerViewModel.html)()




## Properties

[controller](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/controller.html)
→ [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)

Scroll controller for managing scrolling behavior.
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

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[selectedOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/selectedOrg.html)
→ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?

/ Getter method to retrieve the selected organization.
no setter

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[switchAbleOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/switchAbleOrg.html)
↔ List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>

Getter method to retrieve the switchAble organization.
getter/setter pair

[targets](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/targets.html)
→ List<[TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.html)>

List of TargetFocus objects used for tutorial coaching.
final

[tutorialCoachMark](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/tutorialCoachMark.html)
↔ [TutorialCoachMark](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TutorialCoachMark-class.html)

Instance of TutorialCoachMark responsible for providing tutorial guidance.
getter/setter pair



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[dispose](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
override

[exitAlertDialog](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/exitAlertDialog.html)()
→ [CustomAlertDialog](../widgets_custom_alert_dialog/CustomAlertDialog-class.html)


returns an exit alert dialog.

[initialize](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/initialize.html)([MainScreenViewModel](../view_model_main_screen_view_model/MainScreenViewModel-class.html) homeModel, [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ void


initializer.

[isPresentinSwitchableOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/isPresentinSwitchableOrg.html)([OrgInfo](../models_organization_org_info/OrgInfo-class.html) switchToOrg)
→ bool


This function checks `switchOrg` is present in the `switchAbleOrg`.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/notifyListeners.html)()
→ void


Call all the registered listeners.
override

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[setSelectedOrganizationName](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/setSelectedOrganizationName.html)([OrgInfo](../models_organization_org_info/OrgInfo-class.html) updatedOrganization)
→ void


This function switches the current organization to new organization.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[switchOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/switchOrg.html)([OrgInfo](../models_organization_org_info/OrgInfo-class.html) switchToOrg)
→ void


This function switches the organization to the specified `switchToOrg`.

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
2. [custom\_drawer\_view\_model](../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. CustomDrawerViewModel class

##### custom\_drawer\_view\_model library





talawa
1.0.0+1






