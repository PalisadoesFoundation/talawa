::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_main_screen_view_model/MainScreenViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [tourProfile]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [tourProfile]{.name}()
:::

::: {.section .desc .markdown}
This function show the tutorial for the profile page.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void tourProfile() {
  targets.clear();
  targets.add(
    FocusTarget(
      key: keyBNProfile,
      keyName: 'keyBNProfile',
      description:
          'This is the Profile tab here you can see all options related to account, app setting, invitation, help etc',
      isCircle: true,
      align: ContentAlign.top,
      nextCrossAlign: CrossAxisAlignment.start,
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keySPAppSetting,
      keyName: 'keySPAppSetting',
      description:
          'You can edit application settings like language, theme etc from here',
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keySPHelp,
      keyName: 'keySPHelp',
      description:
          'For any help we are always there. You can reach us from here',
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keySPDonateUs,
      keyName: 'keySPDonateUs',
      description:
          'To help your organization grow you can support them financially from here',
      appTour: appTour,
    ),
  );

// Uncomment the section below if you want to add the keySPInvite target
// targets.add(
//   FocusTarget(
//     key: keySPInvite,
//     keyName: 'keySPInvite',
//     description: 'Wanna invite colleague, invite them from here',
//   ),
// );

  targets.add(
    FocusTarget(
      key: keySPPalisadoes,
      keyName: 'keySPPalisadoes',
      description: 'You are all set to go lets get you in',
      isEnd: true,
      appTour: appTour,
    ),
  );

  appTour.showTutorial(
    onFinish: () {
      if (!tourComplete && !tourSkipped) {
        tourComplete = true;
        onTabTapped(0);
      }
    },
    onClickTarget: (TargetFocus a) {},
    targets: targets,
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [main_screen_view_model](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4.  tourProfile method

##### MainScreenViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
