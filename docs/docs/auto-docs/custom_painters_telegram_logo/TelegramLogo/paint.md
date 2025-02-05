


# paint method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void paint
([Canvas](https://api.flutter.dev/flutter/dart-ui/Canvas-class.html) canvas, [Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html) size)

_<span class="feature">override</span>_



<p>Called whenever the object needs to paint. The given <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a> has its
coordinate space configured such that the origin is at the top left of the
box. The area of the box is the size of the <code>size</code> argument.</p>
<p>Paint operations should remain inside the given area. Graphical
operations outside the bounds may be silently ignored, clipped, or not
clipped. It may sometimes be difficult to guarantee that a certain
operation is inside the bounds (e.g., drawing a rectangle whose size is
determined by user inputs). In that case, consider calling
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/clipRect.html">Canvas.clipRect</a> at the beginning of <a href="../../custom_painters_telegram_logo/TelegramLogo/paint.md">paint</a> so everything that follows
will be guaranteed to only draw within the clipped area.</p>
<p>Implementations should be wary of correctly pairing any calls to
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/save.html">Canvas.save</a>/<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/saveLayer.html">Canvas.saveLayer</a> and <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/restore.html">Canvas.restore</a>, otherwise all
subsequent painting on this canvas may be affected, with potentially
hilarious but confusing results.</p>
<p>To paint text on a <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a>, use a <a href="https://api.flutter.dev/flutter/painting/TextPainter-class.html">TextPainter</a>.</p>
<p>To paint an image on a <a href="https://api.flutter.dev/flutter/dart-ui/Canvas-class.html">Canvas</a>:</p>
<ol>
<li>
<p>Obtain an <a href="https://api.flutter.dev/flutter/painting/ImageStream-class.html">ImageStream</a>, for example by calling <a href="https://api.flutter.dev/flutter/painting/ImageProvider/resolve.html">ImageProvider.resolve</a>
on an <a href="https://api.flutter.dev/flutter/painting/AssetImage-class.html">AssetImage</a> or <a href="https://api.flutter.dev/flutter/painting/NetworkImage-class.html">NetworkImage</a> object.</p>
</li>
<li>
<p>Whenever the <a href="https://api.flutter.dev/flutter/painting/ImageStream-class.html">ImageStream</a>'s underlying <a href="https://api.flutter.dev/flutter/painting/ImageInfo-class.html">ImageInfo</a> object changes
(see <a href="https://api.flutter.dev/flutter/painting/ImageStream/addListener.html">ImageStream.addListener</a>), create a new instance of your custom
paint delegate, giving it the new <a href="https://api.flutter.dev/flutter/painting/ImageInfo-class.html">ImageInfo</a> object.</p>
</li>
<li>
<p>In your delegate's <a href="../../custom_painters_telegram_logo/TelegramLogo/paint.md">paint</a> method, call the <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImage.html">Canvas.drawImage</a>,
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageRect.html">Canvas.drawImageRect</a>, or <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageNine.html">Canvas.drawImageNine</a> methods to paint the
<a href="https://api.flutter.dev/flutter/painting/ImageInfo/image.html">ImageInfo.image</a> object, applying the <a href="https://api.flutter.dev/flutter/painting/ImageInfo/scale.html">ImageInfo.scale</a> value to
obtain the correct rendering size.</p>
</li>
</ol>



## Implementation

```dart
@override
void paint(Canvas canvas, Size size) {
  final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
  paint0Fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.6670000, size.height * 0.1670000),
      Offset(size.width * 0.4170000, size.height * 0.7500000), [
    const Color(0xff37aee2).withOpacity(1),
    const Color(0xff1e96c8).withOpacity(1)
  ], [
    0,
    1
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
    const Color(0xffffffff).withOpacity(1)
  ], [
    0,
    1
  ]);
  canvas.drawPath(path_3, paint3Fill);
}
```







