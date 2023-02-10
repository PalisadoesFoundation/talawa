import 'package:flutter/material.dart';

///This class draws the language icon using custom paint.
///CustomPaint is a widget from the Flutter SDK, which enables
/// you to use a canvas to draw different shapes.
class LanguageIcon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.2376568, size.height * 0.4381250);
    path_0.cubicTo(
      size.width * 0.2321886,
      size.height * 0.4003127,
      size.width * 0.2254689,
      size.height * 0.3343750,
      size.width * 0.2254689,
      size.height * 0.3343750,
    );
    path_0.lineTo(size.width * 0.2246875, size.height * 0.3343750);
    path_0.cubicTo(
      size.width * 0.2246875,
      size.height * 0.3343750,
      size.width * 0.2179686,
      size.height * 0.4003127,
      size.width * 0.2125000,
      size.height * 0.4381250,
    );
    path_0.lineTo(size.width * 0.1951561, size.height * 0.5553136);
    path_0.lineTo(size.width * 0.2546886, size.height * 0.5553136);
    path_0.lineTo(size.width * 0.2376568, size.height * 0.4381250);
    path_0.close();
    path_0.moveTo(size.width * 0.9625000, 0);
    path_0.lineTo(size.width * 0.5250000, 0);
    path_0.lineTo(size.width * 0.5250000, size.height);
    path_0.lineTo(size.width * 0.9625000, size.height);
    path_0.cubicTo(
      size.width * 0.9832818,
      size.height,
      size.width,
      size.height * 0.9665636,
      size.width,
      size.height * 0.9250000,
    );
    path_0.lineTo(size.width, size.height * 0.07500000);
    path_0.cubicTo(
      size.width,
      size.height * 0.03343750,
      size.width * 0.9832818,
      0,
      size.width * 0.9625000,
      0,
    );
    path_0.close();
    path_0.moveTo(size.width * 0.9250000, size.height * 0.3750000);
    path_0.cubicTo(
      size.width * 0.9250000,
      size.height * 0.3956250,
      size.width * 0.9165636,
      size.height * 0.4125000,
      size.width * 0.9062500,
      size.height * 0.4125000,
    );
    path_0.lineTo(size.width * 0.8884364, size.height * 0.4125000);
    path_0.cubicTo(
      size.width * 0.8776568,
      size.height * 0.4862500,
      size.width * 0.8545318,
      size.height * 0.5606227,
      size.width * 0.8217182,
      size.height * 0.6309364,
    );
    path_0.cubicTo(
      size.width * 0.8348432,
      size.height * 0.6509364,
      size.width * 0.8484364,
      size.height * 0.6700000,
      size.width * 0.8625000,
      size.height * 0.6871864,
    );
    path_0.cubicTo(
      size.width * 0.8710932,
      size.height * 0.6978136,
      size.width * 0.8739068,
      size.height * 0.7200000,
      size.width * 0.8689068,
      size.height * 0.7378136,
    );
    path_0.lineTo(size.width * 0.8565636, size.height * 0.7812500);
    path_0.cubicTo(
      size.width * 0.8512500,
      size.height * 0.7996864,
      size.width * 0.8395318,
      size.height * 0.8056227,
      size.width * 0.8304682,
      size.height * 0.7946864,
    );
    path_0.cubicTo(
      size.width * 0.8107818,
      size.height * 0.7703136,
      size.width * 0.7921886,
      size.height * 0.7443727,
      size.width * 0.7751568,
      size.height * 0.7168727,
    );
    path_0.cubicTo(
      size.width * 0.7581250,
      size.height * 0.7440636,
      size.width * 0.7396886,
      size.height * 0.7703136,
      size.width * 0.7198432,
      size.height * 0.7946864,
    );
    path_0.cubicTo(
      size.width * 0.7107818,
      size.height * 0.8056227,
      size.width * 0.6990636,
      size.height * 0.7996864,
      size.width * 0.6937500,
      size.height * 0.7812500,
    );
    path_0.lineTo(size.width * 0.6814068, size.height * 0.7378136);
    path_0.cubicTo(
      size.width * 0.6764068,
      size.height * 0.7203136,
      size.width * 0.6792182,
      size.height * 0.6978136,
      size.width * 0.6879682,
      size.height * 0.6871864,
    );
    path_0.cubicTo(
      size.width * 0.7025000,
      size.height * 0.6693727,
      size.width * 0.7160932,
      size.height * 0.6506273,
      size.width * 0.7287500,
      size.height * 0.6309364,
    );
    path_0.cubicTo(
      size.width * 0.7164068,
      size.height * 0.6046864,
      size.width * 0.7054682,
      size.height * 0.5778136,
      size.width * 0.6959386,
      size.height * 0.5506273,
    );
    path_0.cubicTo(
      size.width * 0.6896886,
      size.height * 0.5328136,
      size.width * 0.6925000,
      size.height * 0.5081273,
      size.width * 0.7017182,
      size.height * 0.4971864,
    );
    path_0.lineTo(size.width * 0.7118750, size.height * 0.4850000);
    path_0.lineTo(size.width * 0.7232818, size.height * 0.4715636);
    path_0.cubicTo(
      size.width * 0.7317182,
      size.height * 0.4615636,
      size.width * 0.7426568,
      size.height * 0.4662500,
      size.width * 0.7482818,
      size.height * 0.4821864,
    );
    path_0.cubicTo(
      size.width * 0.7560932,
      size.height * 0.5040636,
      size.width * 0.7651568,
      size.height * 0.5259364,
      size.width * 0.7754682,
      size.height * 0.5475000,
    );
    path_0.cubicTo(
      size.width * 0.7965614,
      size.height * 0.5031273,
      size.width * 0.8126568,
      size.height * 0.4571864,
      size.width * 0.8223432,
      size.height * 0.4125000,
    );
    path_0.lineTo(size.width * 0.6437500, size.height * 0.4125000);
    path_0.cubicTo(
      size.width * 0.6334386,
      size.height * 0.4125000,
      size.width * 0.6250000,
      size.height * 0.3956250,
      size.width * 0.6250000,
      size.height * 0.3750000,
    );
    path_0.lineTo(size.width * 0.6250000, size.height * 0.3250000);
    path_0.cubicTo(
      size.width * 0.6250000,
      size.height * 0.3043750,
      size.width * 0.6334386,
      size.height * 0.2875000,
      size.width * 0.6437500,
      size.height * 0.2875000,
    );
    path_0.lineTo(size.width * 0.7437500, size.height * 0.2875000);
    path_0.lineTo(size.width * 0.7437500, size.height * 0.2375000);
    path_0.cubicTo(
      size.width * 0.7437500,
      size.height * 0.2168750,
      size.width * 0.7521886,
      size.height * 0.2000000,
      size.width * 0.7625000,
      size.height * 0.2000000,
    );
    path_0.lineTo(size.width * 0.7875000, size.height * 0.2000000);
    path_0.cubicTo(
      size.width * 0.7978136,
      size.height * 0.2000000,
      size.width * 0.8062500,
      size.height * 0.2168750,
      size.width * 0.8062500,
      size.height * 0.2375000,
    );
    path_0.lineTo(size.width * 0.8062500, size.height * 0.2875000);
    path_0.lineTo(size.width * 0.9062500, size.height * 0.2875000);
    path_0.cubicTo(
      size.width * 0.9165636,
      size.height * 0.2875000,
      size.width * 0.9250000,
      size.height * 0.3043750,
      size.width * 0.9250000,
      size.height * 0.3250000,
    );
    path_0.lineTo(size.width * 0.9250000, size.height * 0.3750000);
    path_0.close();
    path_0.moveTo(0, size.height * 0.07500000);
    path_0.lineTo(0, size.height * 0.9250000);
    path_0.cubicTo(
      0,
      size.height * 0.9665636,
      size.width * 0.01671875,
      size.height,
      size.width * 0.03750000,
      size.height,
    );
    path_0.lineTo(size.width * 0.4750000, size.height);
    path_0.lineTo(size.width * 0.4750000, 0);
    path_0.lineTo(size.width * 0.03750000, 0);
    path_0.cubicTo(
      size.width * 0.01671875,
      0,
      0,
      size.height * 0.03343750,
      0,
      size.height * 0.07500000,
    );
    path_0.close();
    path_0.moveTo(size.width * 0.09203136, size.height * 0.7503136);
    path_0.lineTo(size.width * 0.1818750, size.height * 0.2218750);
    path_0.cubicTo(
      size.width * 0.1845314,
      size.height * 0.2065623,
      size.width * 0.1915625,
      size.height * 0.1965623,
      size.width * 0.1996875,
      size.height * 0.1965623,
    );
    path_0.lineTo(size.width * 0.2504682, size.height * 0.1965623);
    path_0.cubicTo(
      size.width * 0.2584386,
      size.height * 0.1965623,
      size.width * 0.2656250,
      size.height * 0.2068750,
      size.width * 0.2682818,
      size.height * 0.2218750,
    );
    path_0.lineTo(size.width * 0.3581250, size.height * 0.7503136);
    path_0.cubicTo(
      size.width * 0.3621864,
      size.height * 0.7746864,
      size.width * 0.3532818,
      size.height * 0.8000000,
      size.width * 0.3403136,
      size.height * 0.8000000,
    );
    path_0.lineTo(size.width * 0.3045318, size.height * 0.8000000);
    path_0.cubicTo(
      size.width * 0.3004886,
      size.height * 0.7999955,
      size.width * 0.2965523,
      size.height * 0.7973727,
      size.width * 0.2933159,
      size.height * 0.7925318,
    );
    path_0.cubicTo(
      size.width * 0.2900773,
      size.height * 0.7876864,
      size.width * 0.2877091,
      size.height * 0.7808818,
      size.width * 0.2865614,
      size.height * 0.7731227,
    );
    path_0.lineTo(size.width * 0.2718750, size.height * 0.6734364);
    path_0.lineTo(size.width * 0.1778125, size.height * 0.6734364);
    path_0.lineTo(size.width * 0.1635936, size.height * 0.7728136);
    path_0.cubicTo(
      size.width * 0.1612500,
      size.height * 0.7887500,
      size.width * 0.1539061,
      size.height * 0.8000000,
      size.width * 0.1456250,
      size.height * 0.8000000,
    );
    path_0.lineTo(size.width * 0.1098439, size.height * 0.8000000);
    path_0.cubicTo(
      size.width * 0.09703136,
      size.height * 0.8000000,
      size.width * 0.08796886,
      size.height * 0.7746864,
      size.width * 0.09203136,
      size.height * 0.7503136,
    );
    path_0.close();

    final Paint paint0fill = Paint()..style = PaintingStyle.fill;
    paint0fill.color = const Color(0xff737373).withOpacity(1.0);
    canvas.drawPath(path_0, paint0fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
