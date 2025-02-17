
<div>

# tourEventTargets method

</div>


void 



This function show the tutorial for Events.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  targets.;
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
        ;
      }
    },
    onClickTarget: (TargetFocus a) {},
    targets: targets,
  );
}
```







1.  [talawa](../../index.html)
2.  [main_screen_view_model](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4.  tourEventTargets method

##### MainScreenViewModel class







