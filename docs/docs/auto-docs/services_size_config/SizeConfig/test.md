
<div>

# test method

</div>


void 



## Implementation

``` language-dart
void  {
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







1.  [talawa](../../index.md)
2.  [size_config](../../services_size_config/)
3.  [SizeConfig](../../services_size_config/SizeConfig-class.md)
4.  test method

##### SizeConfig class







