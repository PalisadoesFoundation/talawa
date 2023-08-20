


# selectOrg method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> selectOrg
([OrgInfo](../../models_organization_org_info/OrgInfo-class.md) item)





<p>This function select the organization.</p>
<p>params:</p>
<ul>
<li><code>item</code> : Selected organization data.</li>
</ul>



## Implementation

```dart
Future<void> selectOrg(OrgInfo item) async {
  print(item.id);
  bool orgAlreadyJoined = false;
  bool orgRequestAlreadyPresent = false;
  final bool userLoggedIn = await userConfig.userLoggedIn();
  // if user session not expirec
  if (userLoggedIn) {
    // check if user has already joined the selected organization.
    userConfig.currentUser.joinedOrganizations!.forEach((element) {
      if (element.id! == item.id) {
        orgAlreadyJoined = true;
      }
    });
    // check if user has already send the membership request to the selected organization.
    userConfig.currentUser.membershipRequests!.forEach((element) {
      if (element.id! == item.id) {
        orgRequestAlreadyPresent = true;
      }
    });
    // if not already joined and not memebrship request.
    if (!orgAlreadyJoined && !orgRequestAlreadyPresent) {
      selectedOrganization = item;
      notifyListeners();
      onTapJoin();
      // print(selectedOrganization.isPublic);

      if (!selectedOrganization.isPublic!) {
        navigationService.pushScreen(
          Routes.requestAccess,
          arguments: selectedOrganization,
        );
      }
    } else if (orgAlreadyJoined) {
      selectedOrganization = OrgInfo(id: '-1');
      navigationService.showTalawaErrorSnackBar(
        'Organisation already joined',
        MessageType.warning,
      );
    } else {
      navigationService.showTalawaErrorSnackBar(
        'Membership request already sent',
        MessageType.warning,
      );
    }
  } else {
    selectedOrganization = item;
    notifyListeners();
    navigationService.pushScreen(
      Routes.signupDetailScreen,
      arguments: selectedOrganization,
    );
  }
}
```







