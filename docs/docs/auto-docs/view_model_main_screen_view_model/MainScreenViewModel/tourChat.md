
<div>

# tourChat method

</div>


void 



This function show the tour of chats.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  targets.;
  targets.add(
    FocusTarget(
      key: keyBNChat,
      keyName: 'keyBNChat',
      description:
          'This is the Chat tab here you can see all your messages of the current selected organization',
      isCircle: true,
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







1.  [talawa](../../index.md)
2.  [main_screen_view_model](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.md)
4.  tourChat method

##### MainScreenViewModel class







