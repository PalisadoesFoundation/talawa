




test method - SizeConfig class - size\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/size\_config.dart](../../services_size_config/services_size_config-library.html)
3. [SizeConfig](../../services_size_config/SizeConfig-class.html)
4. test method

test


dark\_mode

light\_mode




# test method


void
test()

## Implementation

```
void test() {
  _mediaQueryData =
      const MediaQueryData(size: Size(360, 684), padding: EdgeInsets.zero);
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
}
```

 


1. [talawa](../../index.html)
2. [size\_config](../../services_size_config/services_size_config-library.html)
3. [SizeConfig](../../services_size_config/SizeConfig-class.html)
4. test method

##### SizeConfig class





talawa
1.0.0+1






