<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/widgets_view_models/custom_drawer_view_model.dart](../view_model_widgets_view_models_custom_drawer_view_model/)
3.  CustomDrawerViewModel class

<div class="self-name">

CustomDrawerViewModel

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library-sidebar.html"
below-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html">

<div>

# <span class="kind-class">CustomDrawerViewModel</span> class

</div>

<div class="section desc markdown">

CustomDrawerViewModel class helps to serve the data and to react to
user's input for Custom Dialog Widget.

Functions include:

- `switchOrg`
- `isPresentinSwitchableOrg`
- `setSelectedOrganizationName`

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- CustomDrawerViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[CustomDrawerViewModel](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/CustomDrawerViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[controller](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/controller.md)</span> <span class="signature">→ [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)</span>  
Scroll controller for managing scrolling behavior.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether any listeners are currently registered.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[selectedOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/selectedOrg.md)</span> <span class="signature">→ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)?</span>  
/ Getter method to retrieve the selected organization.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[switchAbleOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/switchAbleOrg.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span></span>  
Getter method to retrieve the switchAble organization.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[targets](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/targets.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)</span>  
List of TargetFocus objects used for tutorial coaching.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[tutorialCoachMark](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/tutorialCoachMark.md)</span> <span class="signature">↔ dynamic</span>  
Instance of TutorialCoachMark responsible for providing tutorial
guidance.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[dispose](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[exitAlertDialog](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/exitAlertDialog.md)</span><span class="signature"> <span class="returntype parameter">→ [CustomAlertDialog](../widgets_custom_alert_dialog/CustomAlertDialog-class.md)</span> </span>  
returns an exit alert dialog.

<span class="name">[initialize](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/initialize.md)</span><span class="signature">(<span id="initialize-param-homeModel" class="parameter"><span class="type-annotation">[MainScreenViewModel](../view_model_main_screen_view_model/MainScreenViewModel-class.md)</span> <span class="parameter-name">homeModel</span>, </span><span id="initialize-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ void</span> </span>  
initializer.

<span class="name">[isPresentinSwitchableOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/isPresentinSwitchableOrg.md)</span><span class="signature">(<span id="isPresentinSwitchableOrg-param-switchToOrg" class="parameter"><span class="type-annotation">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span> <span class="parameter-name">switchToOrg</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
This function checks `switchOrg` is present in the `switchAbleOrg`.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[notifyListeners](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/notifyListeners.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Call all the registered listeners.

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[setSelectedOrganizationName](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/setSelectedOrganizationName.md)</span><span class="signature">(<span id="setSelectedOrganizationName-param-updatedOrganization" class="parameter"><span class="type-annotation">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span> <span class="parameter-name">updatedOrganization</span></span>) <span class="returntype parameter">→ void</span> </span>  
This function switches the current organization to new organization.

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[switchOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/switchOrg.md)</span><span class="signature">(<span id="switchOrg-param-switchToOrg" class="parameter"><span class="type-annotation">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span> <span class="parameter-name">switchToOrg</span></span>) <span class="returntype parameter">→ void</span> </span>  
This function switches the organization to the specified `switchToOrg`.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [custom_drawer_view_model](../view_model_widgets_view_models_custom_drawer_view_model/)
3.  CustomDrawerViewModel class

##### custom_drawer_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
