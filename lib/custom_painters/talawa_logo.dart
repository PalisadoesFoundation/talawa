import 'package:flutter/material.dart';

///This class draws the app logo using custom paint.
///CustomPaint is a widget from the Flutter SDK, which enables
/// you to use a canvas to draw different shapes.
class AppLogo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.6581984, size.height * 0.6200040);
    path_0.cubicTo(
      size.width * 0.6951984,
      size.height * 0.6792024,
      size.width * 0.7321984,
      size.height * 0.7386032,
      size.width * 0.7695992,
      size.height * 0.7978016,
    );
    path_0.cubicTo(
      size.width * 0.7737976,
      size.height * 0.8044008,
      size.width * 0.7730000,
      size.height * 0.8070040,
      size.width * 0.7664008,
      size.height * 0.8112024,
    );
    path_0.cubicTo(
      size.width * 0.7314008,
      size.height * 0.8330040,
      size.width * 0.6964008,
      size.height * 0.8552024,
      size.width * 0.6617976,
      size.height * 0.8776032,
    );
    path_0.cubicTo(
      size.width * 0.6560000,
      size.height * 0.8814008,
      size.width * 0.6534008,
      size.height * 0.8820040,
      size.width * 0.6491984,
      size.height * 0.8750040,
    );
    path_0.cubicTo(
      size.width * 0.5995992,
      size.height * 0.7930040,
      size.width * 0.5495992,
      size.height * 0.7112024,
      size.width * 0.4997976,
      size.height * 0.6292024,
    );
    path_0.cubicTo(
      size.width * 0.4941984,
      size.height * 0.6198016,
      size.width * 0.4940000,
      size.height * 0.6200040,
      size.width * 0.4884008,
      size.height * 0.6292024,
    );
    path_0.cubicTo(
      size.width * 0.4380000,
      size.height * 0.7114008,
      size.width * 0.3873992,
      size.height * 0.7938016,
      size.width * 0.3371992,
      size.height * 0.8762024,
    );
    path_0.cubicTo(
      size.width * 0.3337992,
      size.height * 0.8818016,
      size.width * 0.3317992,
      size.height * 0.8816032,
      size.width * 0.3267992,
      size.height * 0.8784008,
    );
    path_0.cubicTo(
      size.width * 0.2913992,
      size.height * 0.8558016,
      size.width * 0.2559992,
      size.height * 0.8334008,
      size.width * 0.2203992,
      size.height * 0.8112024,
    );
    path_0.cubicTo(
      size.width * 0.2165992,
      size.height * 0.8088016,
      size.width * 0.2131992,
      size.height * 0.8076032,
      size.width * 0.2167992,
      size.height * 0.8018016,
    );
    path_0.cubicTo(
      size.width * 0.2547992,
      size.height * 0.7420040,
      size.width * 0.2923992,
      size.height * 0.6818016,
      size.width * 0.3301992,
      size.height * 0.6218016,
    );
    path_0.cubicTo(
      size.width * 0.3575992,
      size.height * 0.5766032,
      size.width * 0.3853992,
      size.height * 0.5320040,
      size.width * 0.4130000,
      size.height * 0.4870040,
    );
    path_0.cubicTo(
      size.width * 0.4191984,
      size.height * 0.4768016,
      size.width * 0.4255992,
      size.height * 0.4666032,
      size.width * 0.4317976,
      size.height * 0.4564008,
    );
    path_0.cubicTo(
      size.width * 0.4347976,
      size.height * 0.4516032,
      size.width * 0.4377976,
      size.height * 0.4468016,
      size.width * 0.4441984,
      size.height * 0.4458016,
    );
    path_0.cubicTo(
      size.width * 0.4541984,
      size.height * 0.4452024,
      size.width * 0.4640000,
      size.height * 0.4472024,
      size.width * 0.4740000,
      size.height * 0.4474008,
    );
    path_0.cubicTo(
      size.width * 0.4960000,
      size.height * 0.4482024,
      size.width * 0.5167976,
      size.height * 0.4438016,
      size.width * 0.5377976,
      size.height * 0.4382024,
    );
    path_0.cubicTo(
      size.width * 0.5435992,
      size.height * 0.4374008,
      size.width * 0.5470000,
      size.height * 0.4408016,
      size.width * 0.5497976,
      size.height * 0.4454008,
    );
    path_0.cubicTo(
      size.width * 0.5830000,
      size.height * 0.5002024,
      size.width * 0.6170000,
      size.height * 0.5546032,
      size.width * 0.6497976,
      size.height * 0.6096032,
    );
    path_0.cubicTo(
      size.width * 0.6517976,
      size.height * 0.6136032,
      size.width * 0.6544008,
      size.height * 0.6172024,
      size.width * 0.6581984,
      size.height * 0.6200040,
    );
    path_0.close();

    final Paint paint0fill = Paint()..style = PaintingStyle.fill;
    paint0fill.color = const Color(0xff31BB6B).withOpacity(1.0);
    canvas.drawPath(path_0, paint0fill);

    final Path path_1 = Path();
    path_1.moveTo(size.width * 0.5405992, size.height * 0.4396032);
    path_1.cubicTo(
      size.width * 0.5084008,
      size.height * 0.4512024,
      size.width * 0.4754008,
      size.height * 0.4532024,
      size.width * 0.4418016,
      size.height * 0.4472024,
    );
    path_1.cubicTo(
      size.width * 0.4292024,
      size.height * 0.4490000,
      size.width * 0.4184008,
      size.height * 0.4428016,
      size.width * 0.4078016,
      size.height * 0.4382024,
    );
    path_1.cubicTo(
      size.width * 0.3772004,
      size.height * 0.4248016,
      size.width * 0.3516004,
      size.height * 0.4048016,
      size.width * 0.3326004,
      size.height * 0.3768020,
    );
    path_1.cubicTo(
      size.width * 0.3302004,
      size.height * 0.3732020,
      size.width * 0.3276004,
      size.height * 0.3696020,
      size.width * 0.3278004,
      size.height * 0.3650020,
    );
    path_1.cubicTo(
      size.width * 0.3124004,
      size.height * 0.3368020,
      size.width * 0.3032004,
      size.height * 0.3070020,
      size.width * 0.3040004,
      size.height * 0.2746020,
    );
    path_1.cubicTo(
      size.width * 0.3056004,
      size.height * 0.2126020,
      size.width * 0.3322004,
      size.height * 0.1636020,
      size.width * 0.3842004,
      size.height * 0.1300020,
    );
    path_1.cubicTo(
      size.width * 0.4872024,
      size.height * 0.06320198,
      size.width * 0.6244008,
      size.height * 0.1212020,
      size.width * 0.6494008,
      size.height * 0.2418020,
    );
    path_1.cubicTo(
      size.width * 0.6554008,
      size.height * 0.2704020,
      size.width * 0.6535992,
      size.height * 0.2994020,
      size.width * 0.6452024,
      size.height * 0.3276020,
    );
    path_1.cubicTo(
      size.width * 0.6444008,
      size.height * 0.3302020,
      size.width * 0.6440000,
      size.height * 0.3328020,
      size.width * 0.6434008,
      size.height * 0.3354020,
    );
    path_1.cubicTo(
      size.width * 0.6380000,
      size.height * 0.3574020,
      size.width * 0.6260000,
      size.height * 0.3756020,
      size.width * 0.6118016,
      size.height * 0.3924020,
    );
    path_1.cubicTo(
      size.width * 0.5960000,
      size.height * 0.4108016,
      size.width * 0.5770000,
      size.height * 0.4252024,
      size.width * 0.5548016,
      size.height * 0.4354008,
    );
    path_1.cubicTo(
      size.width * 0.5500000,
      size.height * 0.4376032,
      size.width * 0.5455992,
      size.height * 0.4394008,
      size.width * 0.5405992,
      size.height * 0.4396032,
    );
    path_1.close();

    final Paint paint1fill = Paint()..style = PaintingStyle.fill;
    paint1fill.color = const Color(0xffFEBC59).withOpacity(1.0);
    canvas.drawPath(path_1, paint1fill);

    final Path path_2 = Path();
    path_2.moveTo(size.width * 0.5405992, size.height * 0.4395992);
    path_2.cubicTo(
      size.width * 0.5880000,
      size.height * 0.4200000,
      size.width * 0.6224008,
      size.height * 0.3870008,
      size.width * 0.6410000,
      size.height * 0.3386008,
    );
    path_2.cubicTo(
      size.width * 0.6414008,
      size.height * 0.3374008,
      size.width * 0.6425992,
      size.height * 0.3364008,
      size.width * 0.6434008,
      size.height * 0.3354008,
    );
    path_2.cubicTo(
      size.width * 0.6850000,
      size.height * 0.4020000,
      size.width * 0.7265992,
      size.height * 0.4688016,
      size.width * 0.7685992,
      size.height * 0.5352024,
    );
    path_2.cubicTo(
      size.width * 0.7742024,
      size.height * 0.5440000,
      size.width * 0.7724008,
      size.height * 0.5470000,
      size.width * 0.7642024,
      size.height * 0.5520000,
    );
    path_2.cubicTo(
      size.width * 0.7285992,
      size.height * 0.5740000,
      size.width * 0.6924008,
      size.height * 0.5954008,
      size.width * 0.6584008,
      size.height * 0.6200000,
    );
    path_2.cubicTo(
      size.width * 0.6535992,
      size.height * 0.6225992,
      size.width * 0.6520000,
      size.height * 0.6190000,
      size.width * 0.6502024,
      size.height * 0.6158016,
    );
    path_2.cubicTo(
      size.width * 0.6158016,
      size.height * 0.5590000,
      size.width * 0.5814008,
      size.height * 0.5022024,
      size.width * 0.5470000,
      size.height * 0.4455992,
    );
    path_2.cubicTo(
      size.width * 0.5452024,
      size.height * 0.4430000,
      size.width * 0.5440000,
      size.height * 0.4402024,
      size.width * 0.5405992,
      size.height * 0.4395992,
    );
    path_2.close();

    final Paint paint2fill = Paint()..style = PaintingStyle.fill;
    paint2fill.color = const Color(0xff737373).withOpacity(1.0);
    canvas.drawPath(path_2, paint2fill);

    final Path path_3 = Path();
    path_3.moveTo(size.width * 0.3277992, size.height * 0.3651976);
    path_3.cubicTo(
      size.width * 0.3541992,
      size.height * 0.4085992,
      size.width * 0.3929992,
      size.height * 0.4351984,
      size.width * 0.4417976,
      size.height * 0.4471984,
    );
    path_3.cubicTo(
      size.width * 0.4287976,
      size.height * 0.4623968,
      size.width * 0.4197976,
      size.height * 0.4803968,
      size.width * 0.4094008,
      size.height * 0.4973968,
    );
    path_3.cubicTo(
      size.width * 0.3847992,
      size.height * 0.5373968,
      size.width * 0.3591992,
      size.height * 0.5765992,
      size.width * 0.3361992,
      size.height * 0.6173968,
    );
    path_3.cubicTo(
      size.width * 0.3347992,
      size.height * 0.6197976,
      size.width * 0.3333992,
      size.height * 0.6219960,
      size.width * 0.3301992,
      size.height * 0.6215992,
    );
    path_3.cubicTo(
      size.width * 0.3235992,
      size.height * 0.6143968,
      size.width * 0.3149992,
      size.height * 0.6097976,
      size.width * 0.3069992,
      size.height * 0.6045992,
    );
    path_3.cubicTo(
      size.width * 0.2783992,
      size.height * 0.5863968,
      size.width * 0.2493992,
      size.height * 0.5685992,
      size.width * 0.2205992,
      size.height * 0.5507976,
    );
    path_3.cubicTo(
      size.width * 0.2163992,
      size.height * 0.5481984,
      size.width * 0.2131992,
      size.height * 0.5465992,
      size.width * 0.2169992,
      size.height * 0.5403968,
    );
    path_3.cubicTo(
      size.width * 0.2535992,
      size.height * 0.4825992,
      size.width * 0.2899992,
      size.height * 0.4243968,
      size.width * 0.3263992,
      size.height * 0.3663976,
    );
    path_3.cubicTo(
      size.width * 0.3265992,
      size.height * 0.3659976,
      size.width * 0.3271992,
      size.height * 0.3655976,
      size.width * 0.3277992,
      size.height * 0.3651976,
    );
    path_3.close();

    final Paint paint3fill = Paint()..style = PaintingStyle.fill;
    paint3fill.color = const Color(0xff737373).withOpacity(1.0);
    canvas.drawPath(path_3, paint3fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
