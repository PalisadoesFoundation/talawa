




tourChat method - MainScreenViewModel class - main\_screen\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/main\_screen\_view\_model.dart](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. tourChat method

tourChat


dark\_mode

light\_mode




# tourChat method


void
tourChat()

This function show the tour of chats.

**params**:
None

**returns**:
None


## Implementation

```
void tourChat() {
  targets.clear();
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
4. tourChat method

##### MainScreenViewModel class





talawa
1.0.0+1






