:::::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library-sidebar.html" below-sidebar="view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class-sidebar.html"}
<div>

# [SelectOrganizationViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
SelectOrganizationViewModel class helps to interact with model to serve
data and react to user\'s input in Select Organization View.

Methods include:

-   `selectOrg`
-   `onTapJoin`
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   SelectOrganizationViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[SelectOrganizationViewModel](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/SelectOrganizationViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[allOrgController](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/allOrgController.html)]{.name} [→ [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)]{.signature}
:   Organization selection required data.
    ::: features
    [final]{.feature}
    :::

[[controller](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/controller.html)]{.name} [→ [ScrollController](https://api.flutter.dev/flutter/widgets/ScrollController-class.html)]{.signature}
:   Organization selection required data.
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

[[organizations](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/organizations.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Organization selection required data.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[orgId](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/orgId.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   Organization selection required data.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[qrKey](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/qrKey.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   Organization selection required data.
    ::: features
    [final]{.feature}
    :::

[[result](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/result.html)]{.name} [↔ [Barcode](https://pub.dev/documentation/qr_code_scanner_plus/2.0.9+1/qr_code_scanner_plus/Barcode-class.html)]{.signature}
:   Organization selection required data.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[searchController](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchController.html)]{.name} [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   Organization selection required data.
    ::: features
    [final]{.feature}
    :::

[[searchFocus](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchFocus.html)]{.name} [→ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   Organization selection required data.
    ::: features
    [final]{.feature}
    :::

[[searching](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searching.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Organization selection required data.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[selectedOrganization](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/selectedOrganization.html)]{.name} [↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.signature}
:   Organization selection required data.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[showSearchOrgList](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/showSearchOrgList.html)]{.name} [↔ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.signature}
:   Organization selection required data.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[fetchMoreHelper](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/fetchMoreHelper.html)]{.name}[([[[FetchMore](https://pub.dev/documentation/graphql_flutter/5.2.0-beta.7/graphql_flutter/FetchMore.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-annotation} [fetchMore]{.parameter-name}, ]{#fetchMoreHelper-param-fetchMore .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)]{.type-annotation} [organizations]{.parameter-name}]{#fetchMoreHelper-param-organizations .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function fetch more option.

[[initialise](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/initialise.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [initialData]{.parameter-name}]{#initialise-param-initialData .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   initializer.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Call all the registered listeners.
    ::: features
    [inherited]{.feature}
    :::

[[onTapContinue](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/onTapContinue.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Helper for listener to check if user can tap on continue option or
    not.

[[onTapJoin](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/onTapJoin.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function make user to join the selected organization.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[searchActive](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchActive.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   if search is enabled.

[[selectOrg](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/selectOrg.html)]{.name}[([[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]{.type-annotation} [item]{.parameter-name}]{#selectOrg-param-item .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function select the organization.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

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
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [select_organization_view_model](../view_model_pre_auth_view_models_select_organization_view_model/)
3.  SelectOrganizationViewModel class

##### select_organization_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
