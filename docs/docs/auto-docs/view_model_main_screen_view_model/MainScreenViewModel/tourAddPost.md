




tourAddPost method - MainScreenViewModel class - main\_screen\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/main\_screen\_view\_model.dart](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. tourAddPost method

tourAddPost


dark\_mode

light\_mode




# tourAddPost method


void
tourAddPost()

This function show the tutorial to add Post in the organization.

**params**:
None

**returns**:
None


## Implementation

```
void tourAddPost() {
  targets.clear();
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
        // tourChat();
        tourProfile();
      }
    },
    onClickTarget: (TargetFocus a) {},
    targets: targets,
  );
}
```

 


1. [talawa](../../index.html)
2. [main\_screen\_view\_model](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. tourAddPost method

##### MainScreenViewModel class





talawa
1.0.0+1






