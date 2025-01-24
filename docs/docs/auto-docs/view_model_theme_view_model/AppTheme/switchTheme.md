




switchTheme method - AppTheme class - theme\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/theme\_view\_model.dart](../../view_model_theme_view_model/view_model_theme_view_model-library.html)
3. [AppTheme](../../view_model_theme_view_model/AppTheme-class.html)
4. switchTheme method

switchTheme


dark\_mode

light\_mode




# switchTheme method


void
switchTheme({

1. required bool isOn,

})

This function switches the app theme.

**params**:

* `isOn`: `bool` type, the state to switch the theme to (true for Dark, false for Light).

**returns**:
None


## Implementation

```
void switchTheme({required bool isOn}) {
  _isDarkMode = isOn;
  _saveToPrefs();
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [theme\_view\_model](../../view_model_theme_view_model/view_model_theme_view_model-library.html)
3. [AppTheme](../../view_model_theme_view_model/AppTheme-class.html)
4. switchTheme method

##### AppTheme class





talawa
1.0.0+1






