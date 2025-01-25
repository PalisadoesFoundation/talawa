::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/pre_auth_view_models/select_organization_view_model.dart](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  onTapJoin method

::: self-name
onTapJoin
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [onTapJoin]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[onTapJoin]{.name}()
:::

::: {.section .desc .markdown}
This function make user to join the selected organization.

The function uses `joinOrgById` graph QL query

**params**: None

**returns**:

-   `Future<void>`: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> onTapJoin() async {
  // if `selectedOrganization` registrations is not required.
  if (selectedOrganization.userRegistrationRequired == false) {
    try {
      // run the graph QL mutation
      final QueryResult result = await databaseFunctions.gqlAuthMutation(
        queries.joinOrgById(selectedOrganization.id!),
      );

      final List<OrgInfo>? joinedOrg =
          ((result.data!['joinPublicOrganization']
                      as Map<String, dynamic>)['joinedOrganizations']
                  as List<dynamic>?)
              ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
              .toList();
      userConfig.updateUserJoinedOrg(joinedOrg!);
      // if user joined organization length is 1
      if (userConfig.currentUser.joinedOrganizations!.length == 1) {
        userConfig.saveCurrentOrgInHive(
          userConfig.currentUser.joinedOrganizations![0],
        );
        navigationService.removeAllAndPush(
          Routes.mainScreen,
          Routes.splashScreen,
          arguments: MainScreenArgs(mainScreenIndex: 0),
        );
      } else {
        navigationService.pop();
        navigationService.showTalawaErrorSnackBar(
          'Joined ${selectedOrganization.name} successfully',
          MessageType.info,
        );
      }
    } on Exception catch (e) {
      print(e);
      navigationService.showTalawaErrorSnackBar(
        'Something went wrong',
        MessageType.error,
      );
    }
  }
  // else {
  //   try {
  //     // navigationService.pushScreen(Routes.requestAccess);
  //   } on Exception catch (e) {
  //     print(e);
  //     navigationService.showTalawaErrorSnackBar(
  //       'SomeThing went wrong',
  //       MessageType.error,
  //     );
  //   }
  // }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  onTapJoin method

##### SelectOrganizationViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
