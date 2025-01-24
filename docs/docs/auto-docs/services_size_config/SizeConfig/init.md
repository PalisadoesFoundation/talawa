




init method - SizeConfig class - size\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/size\_config.dart](../../services_size_config/services_size_config-library.html)
3. [SizeConfig](../../services_size_config/SizeConfig-class.html)
4. init method

init


dark\_mode

light\_mode




# init method


void
init(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [size\_config](../../services_size_config/services_size_config-library.html)
3. [SizeConfig](../../services_size_config/SizeConfig-class.html)
4. init method

##### SizeConfig class





talawa
1.0.0+1






