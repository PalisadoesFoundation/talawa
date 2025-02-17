
<div>

# showHome method

</div>


void showHome(

1.  [[[TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.md)]
    clickedTarget]

)



This function shows the Home screen.

**params**:

-   `clickedTarget`: object to identify clickedTarget.

**returns**: None



## Implementation

``` language-dart
void showHome(TargetFocus clickedTarget) {
  switch (clickedTarget.identify) {
    case "keySHMenuIcon":
      scaffoldKey.currentState!.;
      break;
    case "keyDrawerLeaveCurrentOrg":
      navigationService.;
  }
}
```







1.  [talawa](../../index.md)
2.  [main_screen_view_model](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.md)
4.  showHome method

##### MainScreenViewModel class







