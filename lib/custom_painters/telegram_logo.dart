// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

///This class draws the telegram logo using custom paint.
///CustomPaint is a widget from the Flutter SDK, which enables
/// you to use a canvas to draw different shapes.

//Copy this CustomPainter code to the Bottom of the File
class TelegramLogo extends CustomPainter {
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
