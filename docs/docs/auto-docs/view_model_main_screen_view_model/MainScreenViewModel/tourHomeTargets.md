
<div>

# tourHomeTargets method

</div>


void tourHomeTargets(\[

1.  [[[UserConfig](../../services_user_config/UserConfig-class.md)?]
    givenUserConfig]

\])



Starts the tour and info to be displayed is mentioned in this functions.

**params**:

-   `givenUserConfig`: Mock user config that helps in testing.

**returns**: None



## Implementation

``` language-dart
void tourHomeTargets([UserConfig? givenUserConfig]) {
  final UserConfig localUserConfig = givenUserConfig ?? userConfig;
  targets.;
  targets.add(
    FocusTarget(
      key: keySHOrgName,
      keyName: 'keySHOrgName',
      description: 'Current selected Organization Name',
      appTour: appTour,
    ),
  );
  targets.add(
    FocusTarget(
      key: keySHMenuIcon,
      keyName: 'keySHMenuIcon',
      description:
          'Click this button to see options related to switching, joining and leaving organization(s)',
      isCircle: true,
      next: () => scaffoldKey.currentState!.,
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keyDrawerCurOrg,
      keyName: 'keyDrawerCurOrg',
      description: "Current selected Organization's Name appears here",
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keyDrawerSwitchableOrg,
      keyName: 'keyDrawerSwitchableOrg',
      description:
          "All your joined organizations appear over here you can click on them to change the current organization",
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keyDrawerJoinOrg,
      keyName: 'keyDrawerJoinOrg',
      description: "From this button you can join other listed organizations",
      appTour: appTour,
      align: ContentAlign.top,
      next: () {
        if (!localUserConfig.loggedIn) {
          navigationService.;
        }
      },
    ),
  );

  if (localUserConfig.loggedIn) {
    targets.add(
      FocusTarget(
        key: keyDrawerLeaveCurrentOrg,
        keyName: 'keyDrawerLeaveCurrentOrg',
        description:
            "To leave the current organization you can use this option",
        align: ContentAlign.top,
        next: () => navigationService.,
        appTour: appTour,
      ),
    );
  }

  targets.add(
    FocusTarget(
      key: keyBNHome,
      keyName: 'keyBNHome',
      description:
          "This is the home tab here you can see the latest post from other members of the current organization",
      isCircle: true,
      align: ContentAlign.top,
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keySHPinnedPost,
      keyName: 'keySHPinnedPost',
      description:
          "This section displays all the important post set by the organization admin(s)",
      align: ContentAlign.bottom,
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keySHPost,
      keyName: 'keySHPost',
      description:
          "This is the post card you can like and comment on the post from the options available",
      align: ContentAlign.bottom,
      appTour: appTour,
    ),
  );
  appTour.showTutorial(
    onClickTarget: showHome,
    onFinish: () {
      onTabTapped(currentPageIndex + 1);
      if (!tourComplete && !tourSkipped) {
        ;
      }
    },
    targets: targets,
  );
}
```







1.  [talawa](../../index.md)
2.  [main_screen_view_model](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.md)
4.  tourHomeTargets method

##### MainScreenViewModel class







