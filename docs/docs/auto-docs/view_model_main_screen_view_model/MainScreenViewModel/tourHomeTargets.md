


# tourHomeTargets method








void tourHomeTargets
()





<p>this functions starts the tour and info to be displayed is mentioned in this functions.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void tourHomeTargets() {
  targets.clear();
  targets.add(
    focusTarget(
      keySHOrgName,
      'keySHOrgName',
      'Current selected Organization Name',
    ),
  );
  targets.add(
    focusTarget(
      keySHMenuIcon,
      'keySHMenuIcon',
      'Click this button to see options related to switching, joining and leaving organization(s)',
      isCircle: true,
      next: () => scaffoldKey.currentState!.openDrawer(),
    ),
  );
  targets.add(
    focusTarget(
      keyDrawerCurOrg,
      'keyDrawerCurOrg',
      "Current selected Organization's Name appears here",
    ),
  );
  targets.add(
    focusTarget(
      keyDrawerSwitchableOrg,
      'keyDrawerSwitchableOrg',
      "All your joined organizations appear over here you can click on them to change the current organization",
    ),
  );
  targets.add(
    focusTarget(
      keyDrawerJoinOrg,
      'keyDrawerJoinOrg',
      "From this button you can join other listed organizations",
      align: ContentAlign.top,
    ),
  );
  targets.add(
    focusTarget(
      keyDrawerLeaveCurrentOrg,
      'keyDrawerLeaveCurrentOrg',
      "To leave the current organization you can use this option",
      align: ContentAlign.top,
      next: () => navigationService.pop(),
    ),
  );
  targets.add(
    focusTarget(
      keyBNHome,
      'keyBNHome',
      "This is the home tab here you can see the latest post from other members of the current organization",
      isCircle: true,
      align: ContentAlign.top,
    ),
  );
  targets.add(
    focusTarget(
      keySHPinnedPost,
      'keySHPinnedPost',
      "This section displays all the important post set by the organization admin(s)",
      align: ContentAlign.bottom,
    ),
  );
  targets.add(
    focusTarget(
      keySHPost,
      'keySHPost',
      "This is the post card you can like and comment on the post from the options available",
      align: ContentAlign.bottom,
    ),
  );
  showTutorial(
    onClickTarget: showHome,
    onFinish: () {
      onTabTapped(currentPageIndex + 1);
      if (!tourComplete && !tourSkipped) {
        tourEventTargets();
      }
    },
  );
}
```







