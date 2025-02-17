
<div>

# init method

</div>


void init(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)]
    context]

)



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [size_config](../../services_size_config/)
3.  [SizeConfig](../../services_size_config/SizeConfig-class.md)
4.  init method

##### SizeConfig class







