
<div>

# switchTheme method

</div>


void switchTheme({

1.  [required
    [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.md)]
    isOn, ]

})



This function switches the app theme.

**params**:

-   `isOn`: `bool` type, the state to switch the theme to (true for
    Dark, false for Light).

**returns**: None



## Implementation

``` language-dart
void switchTheme({required bool isOn}) {
  _isDarkMode = isOn;
  ;
  ;
}
```







1.  [talawa](../../index.md)
2.  [theme_view_model](../../view_model_theme_view_model/)
3.  [AppTheme](../../view_model_theme_view_model/AppTheme-class.md)
4.  switchTheme method

##### AppTheme class







