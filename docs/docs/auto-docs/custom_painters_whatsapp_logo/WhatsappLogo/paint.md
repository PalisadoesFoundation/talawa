


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
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/clipRect.html">Canvas.clipRect</a> at the beginning of <a href="../../custom_painters_whatsapp_logo/WhatsappLogo/paint.md">paint</a> so everything that follows
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
<p>In your delegate's <a href="../../custom_painters_whatsapp_logo/WhatsappLogo/paint.md">paint</a> method, call the <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImage.html">Canvas.drawImage</a>,
<a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageRect.html">Canvas.drawImageRect</a>, or <a href="https://api.flutter.dev/flutter/dart-ui/Canvas/drawImageNine.html">Canvas.drawImageNine</a> methods to paint the
<a href="https://api.flutter.dev/flutter/painting/ImageInfo/image.html">ImageInfo.image</a> object, applying the <a href="https://api.flutter.dev/flutter/painting/ImageInfo/scale.html">ImageInfo.scale</a> value to
obtain the correct rendering size.</p>
</li>
</ol>



## Implementation

```dart
@override
void paint(Canvas canvas, Size size) {
  final Path path_0 = Path();
  path_0.moveTo(size.width * 0.3580000, size.height * 0.1673307);
  path_0.cubicTo(
    size.width * 0.4170000,
    size.height * 0.1406375,
    size.width * 0.4836000,
    size.height * 0.1314741,
    size.width * 0.5480000,
    size.height * 0.1400398,
  );
  path_0.cubicTo(
    size.width * 0.6134000,
    size.height * 0.1486056,
    size.width * 0.6760000,
    size.height * 0.1764940,
    size.width * 0.7260000,
    size.height * 0.2193227,
  );
  path_0.cubicTo(
    size.width * 0.7740000,
    size.height * 0.2595618,
    size.width * 0.8106000,
    size.height * 0.3129482,
    size.width * 0.8308000,
    size.height * 0.3719124,
  );
  path_0.cubicTo(
    size.width * 0.8540000,
    size.height * 0.4390438,
    size.width * 0.8558000,
    size.height * 0.5133466,
    size.width * 0.8360000,
    size.height * 0.5810757,
  );
  path_0.arcToPoint(
    Offset(size.width * 0.7034000, size.height * 0.7677291),
    radius:
        Radius.elliptical(size.width * 0.3520000, size.height * 0.3505976),
    rotation: 0,
    largeArc: false,
    clockwise: true,
  );
  path_0.arcToPoint(
    Offset(size.width * 0.5662000, size.height * 0.8264940),
    radius:
        Radius.elliptical(size.width * 0.3500000, size.height * 0.3486056),
    rotation: 0,
    largeArc: false,
    clockwise: true,
  );
  path_0.cubicTo(
    size.width * 0.4822000,
    size.height * 0.8424303,
    size.width * 0.3930000,
    size.height * 0.8268924,
    size.width * 0.3202000,
    size.height * 0.7826693,
  );
  path_0.cubicTo(
    size.width * 0.3156000,
    size.height * 0.7806773,
    size.width * 0.3112000,
    size.height * 0.7756972,
    size.width * 0.3058000,
    size.height * 0.7778884,
  );
  path_0.lineTo(size.width * 0.1780000, size.height * 0.8107570);
  path_0.lineTo(size.width * 0.2120000, size.height * 0.6864542);
  path_0.cubicTo(
    size.width * 0.2140000,
    size.height * 0.6820717,
    size.width * 0.2100000,
    size.height * 0.6784861,
    size.width * 0.2080000,
    size.height * 0.6745020,
  );
  path_0.cubicTo(
    size.width * 0.1694000,
    size.height * 0.6159363,
    size.width * 0.1494000,
    size.height * 0.5454183,
    size.width * 0.1514000,
    size.height * 0.4752988,
  );
  path_0.cubicTo(
    size.width * 0.1534000,
    size.height * 0.3318725,
    size.width * 0.2454000,
    size.height * 0.2183267,
    size.width * 0.3574000,
    size.height * 0.1665339,
  );

  final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
  paint0Fill.color = const Color(0xff40c351).withOpacity(1.0);
  canvas.drawPath(path_0, paint0Fill);

  final Path path_1 = Path();
  path_1.moveTo(size.width * 0.3760000, size.height * 0.2908367);
  path_1.cubicTo(
    size.width * 0.3854000,
    size.height * 0.2910359,
    size.width * 0.3916000,
    size.height * 0.2994024,
    size.width * 0.3952000,
    size.height * 0.3067729,
  );
  path_1.cubicTo(
    size.width * 0.4072000,
    size.height * 0.3326693,
    size.width * 0.4168000,
    size.height * 0.3593625,
    size.width * 0.4282000,
    size.height * 0.3854582,
  );
  path_1.cubicTo(
    size.width * 0.4306000,
    size.height * 0.3908367,
    size.width * 0.4322000,
    size.height * 0.3968127,
    size.width * 0.4302000,
    size.height * 0.4025896,
  );
  path_1.cubicTo(
    size.width * 0.4242000,
    size.height * 0.4195219,
    size.width * 0.4102000,
    size.height * 0.4316733,
    size.width * 0.3990000,
    size.height * 0.4452191,
  );
  path_1.cubicTo(
    size.width * 0.3950000,
    size.height * 0.4498008,
    size.width * 0.3954000,
    size.height * 0.4563745,
    size.width * 0.3986000,
    size.height * 0.4611554,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.5456000, size.height * 0.5876494),
    radius:
        Radius.elliptical(size.width * 0.2600000, size.height * 0.2589641),
    rotation: 0,
    largeArc: false,
    clockwise: false,
  );
  path_1.cubicTo(
    size.width * 0.5516000,
    size.height * 0.5902390,
    size.width * 0.5588000,
    size.height * 0.5896414,
    size.width * 0.5630000,
    size.height * 0.5844622,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.5970000, size.height * 0.5428287),
    radius:
        Radius.elliptical(size.width * 0.5640000, size.height * 0.5617530),
    rotation: 0,
    largeArc: false,
    clockwise: false,
  );
  path_1.cubicTo(
    size.width * 0.6062000,
    size.height * 0.5308765,
    size.width * 0.6142000,
    size.height * 0.5342629,
    size.width * 0.6262000,
    size.height * 0.5392430,
  );
  path_1.lineTo(size.width * 0.7030000, size.height * 0.5760956);
  path_1.cubicTo(
    size.width * 0.7090000,
    size.height * 0.5786853,
    size.width * 0.7150000,
    size.height * 0.5830677,
    size.width * 0.7144000,
    size.height * 0.5900398,
  );
  path_1.cubicTo(
    size.width * 0.7184000,
    size.height * 0.6418327,
    size.width * 0.6718000,
    size.height * 0.6820717,
    size.width * 0.6230000,
    size.height * 0.6836653,
  );
  path_1.cubicTo(
    size.width * 0.4970000,
    size.height * 0.6745020,
    size.width * 0.4110000,
    size.height * 0.6047809,
    size.width * 0.3490000,
    size.height * 0.5243028,
  );
  path_1.cubicTo(
    size.width * 0.3286000,
    size.height * 0.4960159,
    size.width * 0.3070000,
    size.height * 0.4675299,
    size.width * 0.2958000,
    size.height * 0.4338645,
  );
  path_1.cubicTo(
    size.width * 0.2852000,
    size.height * 0.4043825,
    size.width * 0.2848000,
    size.height * 0.3707171,
    size.width * 0.2974000,
    size.height * 0.3416335,
  );
  path_1.cubicTo(
    size.width * 0.3168000,
    size.height * 0.3027888,
    size.width * 0.3338000,
    size.height * 0.2878486,
    size.width * 0.3766000,
    size.height * 0.2902390,
  );
  path_1.close();
  path_1.moveTo(size.width * 0.2580000, size.height * 0.1422311);
  path_1.cubicTo(
    size.width * 0.3504000,
    size.height * 0.07649402,
    size.width * 0.4700000,
    size.height * 0.05139442,
    size.width * 0.5820000,
    size.height * 0.07370518,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.7774000, size.height * 0.1699203),
    radius:
        Radius.elliptical(size.width * 0.4180000, size.height * 0.4163347),
    rotation: 0,
    largeArc: false,
    clockwise: true,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.9178000, size.height * 0.4368526),
    radius:
        Radius.elliptical(size.width * 0.4200000, size.height * 0.4183267),
    rotation: 0,
    largeArc: false,
    clockwise: true,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.8918000, size.height * 0.6380478),
    radius:
        Radius.elliptical(size.width * 0.4220000, size.height * 0.4203187),
    rotation: 0,
    largeArc: false,
    clockwise: true,
  );
  path_1.cubicTo(
    size.width * 0.8622000,
    size.height * 0.7137450,
    size.width * 0.8098000,
    size.height * 0.7802789,
    size.width * 0.7434000,
    size.height * 0.8272908,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.5254000, size.height * 0.9039841),
    radius:
        Radius.elliptical(size.width * 0.4180000, size.height * 0.4163347),
    rotation: 0,
    largeArc: false,
    clockwise: true,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.2994000, size.height * 0.8541833),
    radius:
        Radius.elliptical(size.width * 0.4200000, size.height * 0.4183267),
    rotation: 0,
    largeArc: false,
    clockwise: true,
  );
  path_1.lineTo(size.width * 0.07540000, size.height * 0.9119522);
  path_1.lineTo(size.width * 0.1344000, size.height * 0.6968127);
  path_1.cubicTo(
    size.width * 0.1356000,
    size.height * 0.6942231,
    size.width * 0.1338000,
    size.height * 0.6920319,
    size.width * 0.1324000,
    size.height * 0.6900398,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.08240000, size.height * 0.4310757),
    radius:
        Radius.elliptical(size.width * 0.4200000, size.height * 0.4183267),
    rotation: 0,
    largeArc: false,
    clockwise: true,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.2574000, size.height * 0.1422311),
    radius:
        Radius.elliptical(size.width * 0.4260000, size.height * 0.4243028),
    rotation: 0,
    largeArc: false,
    clockwise: true,
  );
  path_1.moveTo(size.width * 0.3568000, size.height * 0.1673307);
  path_1.cubicTo(
    size.width * 0.2898000,
    size.height * 0.1972112,
    size.width * 0.2328000,
    size.height * 0.2486056,
    size.width * 0.1964000,
    size.height * 0.3121514,
  );
  path_1.cubicTo(
    size.width * 0.1676000,
    size.height * 0.3619522,
    size.width * 0.1516000,
    size.height * 0.4187251,
    size.width * 0.1504000,
    size.height * 0.4760956,
  );
  path_1.cubicTo(
    size.width * 0.1484000,
    size.height * 0.5462151,
    size.width * 0.1684000,
    size.height * 0.6165339,
    size.width * 0.2070000,
    size.height * 0.6752988,
  );
  path_1.cubicTo(
    size.width * 0.2090000,
    size.height * 0.6788845,
    size.width * 0.2126000,
    size.height * 0.6826693,
    size.width * 0.2110000,
    size.height * 0.6872510,
  );
  path_1.lineTo(size.width * 0.1770000, size.height * 0.8115538);
  path_1.cubicTo(
    size.width * 0.2196000,
    size.height * 0.8007968,
    size.width * 0.2622000,
    size.height * 0.7892430,
    size.width * 0.3050000,
    size.height * 0.7784861,
  );
  path_1.cubicTo(
    size.width * 0.3104000,
    size.height * 0.7764940,
    size.width * 0.3150000,
    size.height * 0.7808765,
    size.width * 0.3194000,
    size.height * 0.7832669,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.5654000, size.height * 0.8272908),
    radius:
        Radius.elliptical(size.width * 0.3500000, size.height * 0.3486056),
    rotation: 0,
    largeArc: false,
    clockwise: false,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.7026000, size.height * 0.7685259),
    radius:
        Radius.elliptical(size.width * 0.3460000, size.height * 0.3446215),
    rotation: 0,
    largeArc: false,
    clockwise: false,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.8352000, size.height * 0.5818725),
    radius:
        Radius.elliptical(size.width * 0.3520000, size.height * 0.3505976),
    rotation: 0,
    largeArc: false,
    clockwise: false,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.8300000, size.height * 0.3727092),
    radius:
        Radius.elliptical(size.width * 0.3500000, size.height * 0.3486056),
    rotation: 0,
    largeArc: false,
    clockwise: false,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.7252000, size.height * 0.2201195),
    radius:
        Radius.elliptical(size.width * 0.3500000, size.height * 0.3486056),
    rotation: 0,
    largeArc: false,
    clockwise: false,
  );
  path_1.arcToPoint(
    Offset(size.width * 0.5470000, size.height * 0.1408367),
    radius:
        Radius.elliptical(size.width * 0.3480000, size.height * 0.3466135),
    rotation: 0,
    largeArc: false,
    clockwise: false,
  );
  path_1.cubicTo(
    size.width * 0.4830000,
    size.height * 0.1322709,
    size.width * 0.4162000,
    size.height * 0.1414343,
    size.width * 0.3570000,
    size.height * 0.1681275,
  );
  path_1.close();

  final Paint paint1fill = Paint()..style = PaintingStyle.fill;
  paint1fill.color = const Color(0xfffcfcfc).withOpacity(1.0);
  canvas.drawPath(path_1, paint1fill);
}
```







