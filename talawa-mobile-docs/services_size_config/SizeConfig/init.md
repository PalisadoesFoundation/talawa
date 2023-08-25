


# init method








void init
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)








## Implementation

```dart
void init(BuildContext context) {
  _mediaQueryData = MediaQuery.of(context);
  screenWidth = _mediaQueryData.size.width;
  screenHeight = _mediaQueryData.size.height;
  blockSizeHorizontal = screenWidth! / 100;
  blockSizeVertical = screenHeight! / 100;

  _safeAreaHorizontal =
      _mediaQueryData.padding.left + _mediaQueryData.padding.right;
  _safeAreaVertical =
      _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
  safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal) / 100;
  safeBlockVertical = (screenHeight! - _safeAreaVertical) / 100;
  debugPrint("safeBlockHorizontal: $safeBlockHorizontal");
  debugPrint("safeBlockVertical: $safeBlockVertical");
}
```







