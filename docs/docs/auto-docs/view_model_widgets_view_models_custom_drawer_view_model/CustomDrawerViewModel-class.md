


# CustomDrawerViewModel class









<p>CustomDrawerViewModel class helps to serve the data and
to react to user's input for Custom Dialog Widget.</p>
<p>Functions include:</p>
<ul>
<li><code>switchOrg</code></li>
<li><code>isPresentinSwitchableOrg</code></li>
<li><code>setSelectedOrganizationName</code></li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- CustomDrawerViewModel








## Constructors

[CustomDrawerViewModel](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/CustomDrawerViewModel.md) ()

   


## Properties

##### [controller](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/controller.md) &#8594; [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)



  
_<span class="feature">final</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [selectedOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/selectedOrg.md) &#8594; [OrgInfo](../models_organization_org_info/OrgInfo-class.md)?



  
_<span class="feature">read-only</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [switchAbleOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/switchAbleOrg.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../models_organization_org_info/OrgInfo-class.md)>



  
_<span class="feature">read / write</span>_



##### [targets](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/targets.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/TargetFocus-class.html)>



  
_<span class="feature">final</span>_



##### [tutorialCoachMark](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/tutorialCoachMark.md) &#8596; [TutorialCoachMark](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/TutorialCoachMark-class.html)



  
_<span class="feature">read / write</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [dispose](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/dispose.md)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">override</span>_



##### [initialize](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/initialize.md)([MainScreenViewModel](../view_model_main_screen_view_model/MainScreenViewModel-class.md) homeModel, [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) void



  




##### [isPresentinSwitchableOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/isPresentinSwitchableOrg.md)([OrgInfo](../models_organization_org_info/OrgInfo-class.md) switchToOrg) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



This function checks <code>switchOrg</code> is present in the <code>switchAbleOrg</code>.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/notifyListeners.md)() void



Call all the registered listeners.  
_<span class="feature">override</span>_



##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [setSelectedOrganizationName](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/setSelectedOrganizationName.md)([OrgInfo](../models_organization_org_info/OrgInfo-class.md) updatedOrganization) void



This function switches the current organization to new organization.  




##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [switchOrg](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/switchOrg.md)([OrgInfo](../models_organization_org_info/OrgInfo-class.md) switchToOrg) void



This function switch the current organization to another organization,
if the organization(want switch to) is present.  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















