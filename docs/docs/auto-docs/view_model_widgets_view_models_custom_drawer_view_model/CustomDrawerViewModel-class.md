
<div>

# CustomDrawerViewModel class

</div>


CustomDrawerViewModel class helps to serve the data and to react to
user\'s input for Custom Dialog Widget.

Functions include:

-   `switchOrg`
-   `isPresentinSwitchableOrg`
-   `setSelectedOrganizationName`




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   CustomDrawerViewModel



## Constructors

[CustomDrawerViewModel](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/CustomDrawerViewModel.md)

:   



## Properties

[[controller](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/controller.md)] [→ [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)]
:   Scroll controller for managing scrolling behavior.
    ::: features
    final
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[selectedOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/selectedOrg.md)] [→ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)?]
:   / Getter method to retrieve the selected organization.
    ::: features
    no setter
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[switchAbleOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/switchAbleOrg.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]]
:   Getter method to retrieve the switchAble organization.
    ::: features
    getter/setter pair
    :::

[[targets](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/targets.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.html)]\>]]
:   List of TargetFocus objects used for tutorial coaching.
    ::: features
    final
    :::

[[tutorialCoachMark](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/tutorialCoachMark.md)] [↔ [TutorialCoachMark](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TutorialCoachMark-class.html)]
:   Instance of TutorialCoachMark responsible for providing tutorial
    guidance.
    ::: features
    getter/setter pair
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[dispose](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/dispose.md) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    override
    :::

[[exitAlertDialog](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/exitAlertDialog.md)][ [→ [CustomAlertDialog](../widgets_custom_alert_dialog/CustomAlertDialog-class.md)] ]
:   returns an exit alert dialog.

[[initialize](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/initialize.md)][([[[MainScreenViewModel](../view_model_main_screen_view_model/MainScreenViewModel-class.md)] homeModel, ][[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)] context]) → void ]
:   initializer.

[[isPresentinSwitchableOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/isPresentinSwitchableOrg.md)][([[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)] switchToOrg]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   This function checks `switchOrg` is present in the `switchAbleOrg`.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/notifyListeners.md) [→ void ]
:   Call all the registered listeners.
    ::: features
    override
    :::

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[setSelectedOrganizationName](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/setSelectedOrganizationName.md)][([[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)] updatedOrganization]) → void ]
:   This function switches the current organization to new organization.

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[switchOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/switchOrg.md)][([[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)] switchToOrg]) → void ]
:   This function switches the organization to the specified
    `switchToOrg`.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [custom_drawer_view_model](../view_model_widgets_view_models_custom_drawer_view_model/)
3.  CustomDrawerViewModel class

##### custom_drawer_view_model library







