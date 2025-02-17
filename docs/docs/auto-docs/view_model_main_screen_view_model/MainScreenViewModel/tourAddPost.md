
<div>

# tourAddPost method

</div>


void 



This function show the tutorial to add Post in the organization.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  targets.;
  targets.add(
    FocusTarget(
      key: keyBNPost,
      keyName: 'keyBNPost',
      description:
          'This is the Create post tab here you can add post to the current selected organization',
      isCircle: true,
      align: ContentAlign.top,
      appTour: appTour,
    ),
  );
  appTour.showTutorial(
    onFinish: () {
      onTabTapped(currentPageIndex + 1);
      if (!tourComplete && !tourSkipped) {
        // ;
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
4.  tourAddPost method

##### MainScreenViewModel class







