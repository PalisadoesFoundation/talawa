



menu

1.  [talawa](../../index.md)
2.  [custom_painters/talawa_logo.dart](../../custom_painters_talawa_logo/)
3.  [AppLogo](../../custom_painters_talawa_logo/AppLogo-class.md)
4.  paint method


paint


 dark_mode   light_mode 




<div>

# paint method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

void paint(

1.  [[[Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.md)]
    canvas, ]
2.  [[[Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html)]
    size]

)


override




Called whenever the object needs to paint. The given
[Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) has
its coordinate space configured such that the origin is at the top left
of the box. The area of the box is the size of the `size` argument.

Paint operations should remain inside the given area. Graphical
operations outside the bounds may be silently ignored, clipped, or not
clipped. It may sometimes be difficult to guarantee that a certain
operation is inside the bounds (e.g., drawing a rectangle whose size is
determined by user inputs). In that case, consider calling
[Canvas.clipRect](https://api.flutter.dev/flutter/dart-ui/Canvas/clipRect.html)
at the beginning of
[paint](../../custom_painters_talawa_logo/AppLogo/paint.md) so
everything that follows will be guaranteed to only draw within the
clipped area.

Implementations should be wary of correctly pairing any calls to
[Canvas.save](https://api.flutter.dev/flutter/dart-ui/Canvas/save.html)/[Canvas.saveLayer](https://api.flutter.dev/flutter/dart-ui/Canvas/saveLayer.html)
and
[Canvas.restore](https://api.flutter.dev/flutter/dart-ui/Canvas/restore.html),
otherwise all subsequent painting on this canvas may be affected, with
potentially hilarious but confusing results.

To paint text on a
[Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html), use
a
[TextPainter](https://api.flutter.dev/flutter/painting/TextPainter-class.html).

To paint an image on a
[Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html):

1.  Obtain an
    [ImageStream](https://api.flutter.dev/flutter/painting/ImageStream-class.html),
    for example by calling
    [ImageProvider.resolve](https://api.flutter.dev/flutter/painting/ImageProvider/resolve.html)
    on an
    [AssetImage](https://api.flutter.dev/flutter/painting/AssetImage-class.html)
    or
    [NetworkImage](https://api.flutter.dev/flutter/painting/NetworkImage-class.html)
    object.

2.  Whenever the
    [ImageStream](https://api.flutter.dev/flutter/painting/ImageStream-class.html)\'s
    underlying
    [ImageInfo](https://api.flutter.dev/flutter/painting/ImageInfo-class.html)
    object changes (see
    [ImageStream.addListener](https://api.flutter.dev/flutter/painting/ImageStream/addListener.md)),
    create a new instance of your custom paint delegate, giving it the
    new
    [ImageInfo](https://api.flutter.dev/flutter/painting/ImageInfo-class.html)
    object.

3.  In your delegate\'s
    [paint](../../custom_painters_talawa_logo/AppLogo/paint.md)
    method, call the
    [Canvas.drawImage](https://api.flutter.dev/flutter/dart-ui/Canvas/drawImage.html),
    [Canvas.drawImageRect](https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageRect.html),
    or
    [Canvas.drawImageNine](https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageNine.html)
    methods to paint the
    [ImageInfo.image](https://api.flutter.dev/flutter/painting/ImageInfo/image.html)
    object, applying the
    [ImageInfo.scale](https://api.flutter.dev/flutter/painting/ImageInfo/scale.html)
    value to obtain the correct rendering size.



## Implementation

``` language-dart
@override
void paint(Canvas canvas, Size size) 
```







1.  [talawa](../../index.md)
2.  [talawa_logo](../../custom_painters_talawa_logo/)
3.  [AppLogo](../../custom_painters_talawa_logo/AppLogo-class.md)
4.  paint method

##### AppLogo class









 talawa 1.0.0+1 
