




paint method - TelegramLogo class - telegram\_logo library - Dart API







menu

1. [talawa](../../index.html)
2. [custom\_painters/telegram\_logo.dart](../../custom_painters_telegram_logo/custom_painters_telegram_logo-library.html)
3. [TelegramLogo](../../custom_painters_telegram_logo/TelegramLogo-class.html)
4. paint method

paint


dark\_mode

light\_mode




# paint method


1. @override

void
paint(

1. [Canvas](https://api.flutter.dev/flutter/painting/Canvas-class.html) canvas,
2. [Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html) size

)
override

Called whenever the object needs to paint. The given [Canvas](https://api.flutter.dev/flutter/painting/Canvas-class.html) has its
coordinate space configured such that the origin is at the top left of the
box. The area of the box is the size of the `size` argument.

Paint operations should remain inside the given area. Graphical
operations outside the bounds may be silently ignored, clipped, or not
clipped. It may sometimes be difficult to guarantee that a certain
operation is inside the bounds (e.g., drawing a rectangle whose size is
determined by user inputs). In that case, consider calling
[Canvas.clipRect](https://api.flutter.dev/flutter/painting/Canvas/clipRect.html) at the beginning of [paint](../../custom_painters_telegram_logo/TelegramLogo/paint.html) so everything that follows
will be guaranteed to only draw within the clipped area.

Implementations should be wary of correctly pairing any calls to
[Canvas.save](https://api.flutter.dev/flutter/painting/Canvas/save.html)/[Canvas.saveLayer](https://api.flutter.dev/flutter/painting/Canvas/saveLayer.html) and [Canvas.restore](https://api.flutter.dev/flutter/painting/Canvas/restore.html), otherwise all
subsequent painting on this canvas may be affected, with potentially
hilarious but confusing results.

To paint text on a [Canvas](https://api.flutter.dev/flutter/painting/Canvas-class.html), use a [TextPainter](https://api.flutter.dev/flutter/painting/TextPainter-class.html).

To paint an image on a [Canvas](https://api.flutter.dev/flutter/painting/Canvas-class.html):

1. Obtain an [ImageStream](https://api.flutter.dev/flutter/painting/ImageStream-class.html), for example by calling [ImageProvider.resolve](https://api.flutter.dev/flutter/painting/ImageProvider/resolve.html)
   on an [AssetImage](https://api.flutter.dev/flutter/painting/AssetImage-class.html) or [NetworkImage](https://api.flutter.dev/flutter/painting/NetworkImage-class.html) object.
2. Whenever the [ImageStream](https://api.flutter.dev/flutter/painting/ImageStream-class.html)'s underlying [ImageInfo](https://api.flutter.dev/flutter/painting/ImageInfo-class.html) object changes
   (see [ImageStream.addListener](https://api.flutter.dev/flutter/painting/ImageStream/addListener.html)), create a new instance of your custom
   paint delegate, giving it the new [ImageInfo](https://api.flutter.dev/flutter/painting/ImageInfo-class.html) object.
3. In your delegate's [paint](../../custom_painters_telegram_logo/TelegramLogo/paint.html) method, call the [Canvas.drawImage](https://api.flutter.dev/flutter/painting/Canvas/drawImage.html),
   [Canvas.drawImageRect](https://api.flutter.dev/flutter/painting/Canvas/drawImageRect.html), or [Canvas.drawImageNine](https://api.flutter.dev/flutter/painting/Canvas/drawImageNine.html) methods to paint the
   [ImageInfo.image](https://api.flutter.dev/flutter/painting/ImageInfo/image.html) object, applying the [ImageInfo.scale](https://api.flutter.dev/flutter/painting/ImageInfo/scale.html) value to
   obtain the correct rendering size.

## Implementation

```
@override
void paint(Canvas canvas, Size size) {
  final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
  paint0Fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.6670000, size.height * 0.1670000),
      Offset(size.width * 0.4170000, size.height * 0.7500000), [
    const Color(0xff37aee2).withOpacity(1),
    const Color(0xff1e96c8).withOpacity(1),
  ], [
    0,
    1,
  ]);
  canvas.drawCircle(
    Offset(size.width * 0.5000000, size.height * 0.5000000),
    size.width * 0.5000000,
    paint0Fill,
  );

  final Path path_1 = Path();
  path_1.moveTo(size.width * 0.4083333, size.height * 0.7291667);
  path_1.cubicTo(
    size.width * 0.3921333,
    size.height * 0.7291667,
    size.width * 0.3948875,
    size.height * 0.7230500,
    size.width * 0.3893000,
    size.height * 0.7076250,
  );
  path_1.lineTo(size.width * 0.3416667, size.height * 0.5508625);
  path_1.lineTo(size.width * 0.7083333, size.height * 0.3333333);

  final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
  paint1Fill.color = const Color(0xffc8daea).withOpacity(1.0);
  canvas.drawPath(path_1, paint1Fill);

  final Path path_2 = Path();
  path_2.moveTo(size.width * 0.4083333, size.height * 0.7291667);
  path_2.cubicTo(
    size.width * 0.4208333,
    size.height * 0.7291667,
    size.width * 0.4263542,
    size.height * 0.7234500,
    size.width * 0.4333333,
    size.height * 0.7166667,
  );
  path_2.lineTo(size.width * 0.5000000, size.height * 0.6518417);
  path_2.lineTo(size.width * 0.4168417, size.height * 0.6016958);

  final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
  paint2Fill.color = const Color(0xffa9c9dd).withOpacity(1.0);
  canvas.drawPath(path_2, paint2Fill);

  final Path path_3 = Path();
  path_3.moveTo(size.width * 0.4168333, size.height * 0.6017083);
  path_3.lineTo(size.width * 0.6183333, size.height * 0.7505792);
  path_3.cubicTo(
    size.width * 0.6413292,
    size.height * 0.7632667,
    size.width * 0.6579208,
    size.height * 0.7566958,
    size.width * 0.6636500,
    size.height * 0.7292333,
  );
  path_3.lineTo(size.width * 0.7456708, size.height * 0.3427208);
  path_3.cubicTo(
    size.width * 0.7540667,
    size.height * 0.3090542,
    size.width * 0.7328375,
    size.height * 0.2937792,
    size.width * 0.7108375,
    size.height * 0.3037667,
  );
  path_3.lineTo(size.width * 0.2292125, size.height * 0.4894792);
  path_3.cubicTo(
    size.width * 0.1963375,
    size.height * 0.5026667,
    size.width * 0.1965333,
    size.height * 0.5210083,
    size.width * 0.2232208,
    size.height * 0.5291792,
  );
  path_3.lineTo(size.width * 0.3468167, size.height * 0.5677583);
  path_3.lineTo(size.width * 0.6329542, size.height * 0.3872375);
  path_3.cubicTo(
    size.width * 0.6464625,
    size.height * 0.3790458,
    size.width * 0.6588625,
    size.height * 0.3834458,
    size.width * 0.6486875,
    size.height * 0.3924792,
  );

  final Paint paint3Fill = Paint()..style = PaintingStyle.fill;
  paint3Fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.6600000, size.height * 0.4370000),
      Offset(size.width * 0.8510000, size.height * 0.8020000), [
    const Color(0xffeff7fc).withOpacity(1),
    const Color(0xffffffff).withOpacity(1),
  ], [
    0,
    1,
  ]);
  canvas.drawPath(path_3, paint3Fill);
}
```

 


1. [talawa](../../index.html)
2. [telegram\_logo](../../custom_painters_telegram_logo/custom_painters_telegram_logo-library.html)
3. [TelegramLogo](../../custom_painters_telegram_logo/TelegramLogo-class.html)
4. paint method

##### TelegramLogo class





talawa
1.0.0+1






