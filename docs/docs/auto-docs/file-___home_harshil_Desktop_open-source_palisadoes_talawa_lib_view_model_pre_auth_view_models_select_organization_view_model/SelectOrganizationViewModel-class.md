




SelectOrganizationViewModel class - select\_organization\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/pre\_auth\_view\_models/select\_organization\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/)
3. SelectOrganizationViewModel class

SelectOrganizationViewModel


dark\_mode

light\_mode




# SelectOrganizationViewModel class


SelectOrganizationViewModel class helps to interact with model to serve data and react to user's input in Select Organization View.

Methods include:

* `selectOrg`
* `onTapJoin`

## Constructors

[SelectOrganizationViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/SelectOrganizationViewModel.html)()




## Properties

[allOrgController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/allOrgController.html)
→ dynamic

Organization selection required data.
final

[controller](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/controller.html)
→ dynamic

Organization selection required data.
final

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[organizations](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/organizations.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

Organization selection required data.
getter/setter pair

[orgId](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/orgId.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

Organization selection required data.
getter/setter pair

[qrKey](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/qrKey.html)
→ dynamic

Organization selection required data.
final

[result](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/result.html)
↔ dynamic

Organization selection required data.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[searchController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchController.html)
→ dynamic

Organization selection required data.
final

[searchFocus](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchFocus.html)
→ dynamic

Organization selection required data.
final

[searching](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searching.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

Organization selection required data.
getter/setter pair

[selectedOrganization](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/selectedOrganization.html)
↔ dynamic

Organization selection required data.
getter/setter pair

[showSearchOrgList](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/showSearchOrgList.html)
↔ dynamic

Organization selection required data.
getter/setter pair



## Methods

[fetchMoreHelper](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/fetchMoreHelper.html)(dynamic fetchMore, [List](https://api.flutter.dev/flutter/dart-core/List-class.html) organizations)
→ void


This function fetch more option.

[initialise](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/initialise.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) initialData)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


initializer.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[onTapContinue](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/onTapContinue.html)()
→ void


Helper for listener to check if user can tap on continue option or not.

[onTapJoin](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/onTapJoin.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function make user to join the selected organization.

[searchActive](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/searchActive.html)()
→ void


if search is enabled.

[selectOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel/selectOrg.html)(dynamic item)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function select the organization.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [select\_organization\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_select_organization_view_model/)
3. SelectOrganizationViewModel class

##### select\_organization\_view\_model library





talawa
1.0.0+1






