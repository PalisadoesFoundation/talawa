::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [view_model/widgets_view_models/custom_drawer_view_model.dart](../view_model_widgets_view_models_custom_drawer_view_model/)
3.  CustomDrawerViewModel class

::: self-name
CustomDrawerViewModel
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library-sidebar.html" below-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html"}
<div>

# [CustomDrawerViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
CustomDrawerViewModel class helps to serve the data and to react to
user\'s input for Custom Dialog Widget.

Functions include:

-   `switchOrg`
-   `isPresentinSwitchableOrg`
-   `setSelectedOrganizationName`
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   CustomDrawerViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[CustomDrawerViewModel](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/CustomDrawerViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[controller](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/controller.html)]{.name} [→ [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)]{.signature}
:   Scroll controller for managing scrolling behavior.
    ::: features
    [final]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether any listeners are currently registered.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[selectedOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/selectedOrg.html)]{.name} [→ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.signature}
:   / Getter method to retrieve the selected organization.
    ::: features
    [no setter]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[switchAbleOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/switchAbleOrg.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Getter method to retrieve the switchAble organization.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[targets](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/targets.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   List of TargetFocus objects used for tutorial coaching.
    ::: features
    [final]{.feature}
    :::

[[tutorialCoachMark](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/tutorialCoachMark.html)]{.name} [↔ [TutorialCoachMark](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TutorialCoachMark-class.html)]{.signature}
:   Instance of TutorialCoachMark responsible for providing tutorial
    guidance.
    ::: features
    [getter/setter pair]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[dispose](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [override]{.feature}
    :::

[[exitAlertDialog](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/exitAlertDialog.html)]{.name}[() [→ [CustomAlertDialog](../widgets_custom_alert_dialog/CustomAlertDialog-class.html)]{.returntype .parameter} ]{.signature}
:   returns an exit alert dialog.

[[initialize](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/initialize.html)]{.name}[([[[MainScreenViewModel](../view_model_main_screen_view_model/MainScreenViewModel-class.html)]{.type-annotation} [homeModel]{.parameter-name}, ]{#initialize-param-homeModel .parameter}[[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#initialize-param-context .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   initializer.

[[isPresentinSwitchableOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/isPresentinSwitchableOrg.html)]{.name}[([[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-annotation} [switchToOrg]{.parameter-name}]{#isPresentinSwitchableOrg-param-switchToOrg .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   This function checks `switchOrg` is present in the `switchAbleOrg`.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[notifyListeners](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/notifyListeners.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Call all the registered listeners.
    ::: features
    [override]{.feature}
    :::

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[setSelectedOrganizationName](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/setSelectedOrganizationName.html)]{.name}[([[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-annotation} [updatedOrganization]{.parameter-name}]{#setSelectedOrganizationName-param-updatedOrganization .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function switches the current organization to new organization.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[switchOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/switchOrg.html)]{.name}[([[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-annotation} [switchToOrg]{.parameter-name}]{#switchOrg-param-switchToOrg .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function switches the organization to the specified
    `switchToOrg`.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [custom_drawer_view_model](../view_model_widgets_view_models_custom_drawer_view_model/)
3.  CustomDrawerViewModel class

##### custom_drawer_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
