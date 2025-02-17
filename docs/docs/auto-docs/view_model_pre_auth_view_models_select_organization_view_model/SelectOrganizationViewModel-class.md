
<div>

# SelectOrganizationViewModel class

</div>


SelectOrganizationViewModel class helps to interact with model to serve
data and react to user\'s input in Select Organization View.

Methods include:

-   `selectOrg`
-   `onTapJoin`




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   SelectOrganizationViewModel



## Constructors

[SelectOrganizationViewModel](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/SelectOrganizationViewModel.html)

:   



## Properties

[[allOrgController](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/allOrgController.html)] [→ [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)]
:   Organization selection required data.
    ::: features
    final
    :::

[[controller](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/controller.html)] [→ [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)]
:   Organization selection required data.
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

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[organizations](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/organizations.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]]
:   Organization selection required data.
    ::: features
    getter/setter pair
    :::

[[orgId](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/orgId.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Organization selection required data.
    ::: features
    getter/setter pair
    :::

[[qrKey](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/qrKey.html)] [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]\>]]\>]]
:   Organization selection required data.
    ::: features
    final
    :::

[[result](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/result.html)] [↔ [Barcode](https://pub.dev/documentation/qr_code_scanner_plus/2.0.9+1/qr_code_scanner_plus/Barcode-class.html)]
:   Organization selection required data.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[searchController](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchController.html)] [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   Organization selection required data.
    ::: features
    final
    :::

[[searchFocus](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchFocus.html)] [→ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   Organization selection required data.
    ::: features
    final
    :::

[[searching](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searching.html)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Organization selection required data.
    ::: features
    getter/setter pair
    :::

[[selectedOrganization](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/selectedOrganization.html)] [↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]
:   Organization selection required data.
    ::: features
    getter/setter pair
    :::

[[showSearchOrgList](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/showSearchOrgList.html)] [↔ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
:   Organization selection required data.
    ::: features
    getter/setter pair
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)] [→ [ViewState](../enums_enums/ViewState.html)]

:   ::: features
    no setterinherited
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[fetchMoreHelper](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/fetchMoreHelper.html)][([[[FetchMore](https://pub.dev/documentation/graphql_flutter/5.2.0-beta.7/graphql_flutter/FetchMore.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]] fetchMore, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)] organizations]) → void ]
:   This function fetch more option.

[[initialise](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/initialise.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] initialData]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   initializer.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[onTapContinue](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/onTapContinue.html) [→ void ]
:   Helper for listener to check if user can tap on continue option or
    not.

[[onTapJoin](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/onTapJoin.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function make user to join the selected organization.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[searchActive](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchActive.html) [→ void ]
:   if search is enabled.

[[selectOrg](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/selectOrg.html)][([[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)?] item]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function select the organization.

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [select_organization_view_model](../view_model_pre_auth_view_models_select_organization_view_model/)
3.  SelectOrganizationViewModel class

##### select_organization_view_model library







