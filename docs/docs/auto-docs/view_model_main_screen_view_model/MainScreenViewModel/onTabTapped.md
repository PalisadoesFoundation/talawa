




onTabTapped method - MainScreenViewModel class - main\_screen\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/main\_screen\_view\_model.dart](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. onTabTapped method

onTabTapped


dark\_mode

light\_mode




# onTabTapped method


void
onTabTapped(

1. int index

)

Handles click on [BottomNavigationBarItem](https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html).

**params**:

* `index`: it is track of current page index.

**returns**:
None


## Implementation

```
void onTabTapped(int index) {
  currentPageIndex = index;
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [main\_screen\_view\_model](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. onTabTapped method

##### MainScreenViewModel class





talawa
1.0.0+1






