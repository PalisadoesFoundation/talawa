


# attachListener method








void attachListener
([Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) setter)








## Implementation

```dart
void attachListener(Function setter) {
  donationField.addListener(() {
    if (donationField.hasFocus) {
      setter(() {
        bottomSheetHeight = SizeConfig.screenHeight! * 0.8725;
      });
    } else {
      Future.delayed(const Duration(milliseconds: 300), () {
        {
          setter(() {
            bottomSheetHeight = SizeConfig.screenHeight! * 0.68;
          });
        }
      });
    }
  });
}
```







