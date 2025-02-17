::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_main_screen_view_model/MainScreenViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [tourEventTargets]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [tourEventTargets]{.name}()
:::

::: {.section .desc .markdown}
This function show the tutorial for Events.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void tourEventTargets() {
  targets.clear();
  targets.add(
    FocusTarget(
      key: keyBNEvents,
      keyName: 'keyBNEvents',
      description:
          'This is the Events tab here you can see all event related information of the current selected organization',
      isCircle: true,
      align: ContentAlign.top,
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keySECategoryMenu,
      keyName: 'keySECategoryMenu',
      description: 'Filter Events based on categories',
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keySEDateFilter,
      keyName: 'keySEDateFilter',
      description: 'Filter Events between selected dates',
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keySECard,
      keyName: 'keySECard',
      description:
          'Description of event to see more details click on the card',
      appTour: appTour,
    ),
  );

  targets.add(
    FocusTarget(
      key: keySEAdd,
      keyName: 'keySEAdd',
      description: 'You can create a new event from here',
      align: ContentAlign.top,
      appTour: appTour,
    ),
  );

  appTour.showTutorial(
    onFinish: () {
      onTabTapped(currentPageIndex + 1);
      if (!tourComplete && !tourSkipped) {
        tourProfile();
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
4.  tourEventTargets method

##### MainScreenViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
