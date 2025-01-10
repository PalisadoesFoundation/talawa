


# SelectOrganizationViewModel class









<p>SelectOrganizationViewModel class helps to interact with model to serve data
and react to user's input in Select Organization View.</p>
<p>Methods include:</p>
<ul>
<li><code>selectOrg</code></li>
<li><code>onTapJoin</code></li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- SelectOrganizationViewModel








## Constructors

[SelectOrganizationViewModel](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/SelectOrganizationViewModel.md) ()

   


## Properties

##### [allOrgController](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/allOrgController.md) &#8594; [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)



  
_<span class="feature">final</span>_



##### [controller](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/controller.md) &#8594; [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)



  
_<span class="feature">final</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [organizations](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/organizations.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../models_organization_org_info/OrgInfo-class.md)>



  
_<span class="feature">read / write</span>_



##### [orgId](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/orgId.md) &#8596; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



  
_<span class="feature">read / write</span>_



##### [qrKey](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/qrKey.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



  
_<span class="feature">final</span>_



##### [result](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/result.md) &#8596; [Barcode](https://pub.dev/documentation/qr_code_scanner/1.0.1/qr_code_scanner/Barcode-class.html)



  
_<span class="feature">read / write</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [searchController](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchController.md) &#8594; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">final</span>_



##### [searchFocus](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchFocus.md) &#8594; [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)



  
_<span class="feature">final</span>_



##### [searching](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searching.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read / write</span>_



##### [selectedOrganization](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/selectedOrganization.md) &#8596; [OrgInfo](../models_organization_org_info/OrgInfo-class.md)



  
_<span class="feature">read / write</span>_



##### [showSearchOrgList](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/showSearchOrgList.md) &#8596; [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)



  
_<span class="feature">read / write</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">inherited</span>_



##### [fetchMoreHelper](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/fetchMoreHelper.md)([FetchMore](https://pub.dev/documentation/graphql_flutter/5.2.0-beta.5/graphql_flutter/FetchMore.html)&lt;[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?> fetchMore, [List](https://api.flutter.dev/flutter/dart-core/List-class.html) organizations) void



This function fetch more option.  




##### [initialise](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/initialise.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) initialData) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners.  
_<span class="feature">inherited</span>_



##### [onTapContinue](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/onTapContinue.md)() void



  




##### [onTapJoin](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/onTapJoin.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function make user to join the selected organization.
The function uses <code>joinOrgById</code> graph QL query.  




##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [searchActive](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchActive.md)() void



  




##### [selectOrg](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/selectOrg.md)([OrgInfo](../models_organization_org_info/OrgInfo-class.md) item) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function select the organization.  




##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















