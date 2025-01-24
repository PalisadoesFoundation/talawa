




showHome method - MainScreenViewModel class - main\_screen\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/main\_screen\_view\_model.dart](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. showHome method

showHome


dark\_mode

light\_mode




# showHome method


void
showHome(

1. [TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.html) clickedTarget

)

This function shows the Home screen.

**params**:

* `clickedTarget`: object to identify clickedTarget.

**returns**:
None


## Implementation

```
void showHome(TargetFocus clickedTarget) {
  switch (clickedTarget.identify) {
    case "keySHMenuIcon":
      scaffoldKey.currentState!.openDrawer();
      break;
    case "keyDrawerLeaveCurrentOrg":
      navigationService.pop();
  }
}
```

 


1. [talawa](../../index.html)
2. [main\_screen\_view\_model](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. showHome method

##### MainScreenViewModel class





talawa
1.0.0+1






