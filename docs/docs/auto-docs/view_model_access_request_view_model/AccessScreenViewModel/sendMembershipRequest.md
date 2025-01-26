::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/access_request_view_model.dart](../../view_model_access_request_view_model/)
3.  [AccessScreenViewModel](../../view_model_access_request_view_model/AccessScreenViewModel-class.html)
4.  sendMembershipRequest method

::: self-name
sendMembershipRequest
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_access_request_view_model/AccessScreenViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [sendMembershipRequest]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[sendMembershipRequest]{.name}()
:::

::: {.section .desc .markdown}
Sending member ship request function.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> sendMembershipRequest() async {
  //TODO: Implement Message arg for below function
  final result = await databaseFunctions.gqlAuthMutation(
    queries.sendMembershipRequest(selectedOrganization.id!),
  );
  if (result.data != null) {
    final OrgInfo membershipRequest = OrgInfo.fromJson(
      ((result.data!)['sendMembershipRequest']
          as Map<String, dynamic>)['organization'] as Map<String, dynamic>,
    );
    userConfig.updateUserMemberRequestOrg([membershipRequest]);
    if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
      navigationService.removeAllAndPush(
        Routes.waitingScreen,
        Routes.splashScreen,
      );
    } else {
      navigationService.pop();
      navigationService.showTalawaErrorSnackBar(
        'Join in request sent to ${selectedOrganization.name} successfully',
        MessageType.info,
      );
    }
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [access_request_view_model](../../view_model_access_request_view_model/)
3.  [AccessScreenViewModel](../../view_model_access_request_view_model/AccessScreenViewModel-class.html)
4.  sendMembershipRequest method

##### AccessScreenViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
