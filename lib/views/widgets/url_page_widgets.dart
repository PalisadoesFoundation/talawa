import 'package:flutter/material.dart';
import 'package:talawa/services/app_localization.dart';

import 'package:talawa/utils/ui_scaling.dart';

class LoginCreateAccountButton extends StatelessWidget {
  const LoginCreateAccountButton(
      {Key key, @required this.isLogin, this.onPressed, this.loginAnimation})
      : super(key: key);
  final bool isLogin;
  final Function() onPressed;
  final Animation<double> loginAnimation;

  @override
  Widget build(BuildContext context) {
    final String buttonName = isLogin ? "Login" : "Create an Account";
    return FadeTransition(
      opacity: loginAnimation,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 12.5,
          right: SizeConfig.safeBlockHorizontal * 12.5,
          top: SizeConfig.safeBlockVertical * 1.25,
        ),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                onPressed: onPressed,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 2.5,
                    horizontal: SizeConfig.safeBlockHorizontal * 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate(buttonName),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UrlPageAnimation {
  UrlPageAnimation(TickerProvider ticketProvider) {
    // Initializing all the animationControllers
    controller = AnimationController(
        vsync: ticketProvider, duration: const Duration(milliseconds: 2000));
    loginController = AnimationController(
        vsync: ticketProvider, duration: const Duration(milliseconds: 500));
    helloController = AnimationController(
        vsync: ticketProvider, duration: const Duration(milliseconds: 500));
    createController = AnimationController(
        vsync: ticketProvider, duration: const Duration(milliseconds: 500));
  }

  //Check if First Time
  bool firstTime = true;

  //animation Controllers
  AnimationController controller;
  AnimationController loginController;
  AnimationController helloController;
  AnimationController createController;

  // animation
  Animation<double> loginAnimation;
  Animation<double> createAnimation;
  Animation<double> animation;
  Animation<double> helloAnimation;

  void changeFirst() {
    this.firstTime = false;
  }

  void assignAnimation() {
    final double beginVal = this.firstTime ? 0.0 : 1.0;
    animation = Tween(begin: beginVal, end: 1.0).animate(controller);
    helloAnimation = Tween(begin: beginVal, end: 1.0).animate(helloController);
    createAnimation =
        Tween(begin: beginVal, end: 1.0).animate(createController);
    loginAnimation = Tween(begin: beginVal, end: 1.0).animate(loginController);
  }

  Future<void> load() async {
    await controller?.forward();
    await helloController?.forward();
    await createController?.forward();
    await loginController?.forward();
    changeFirst();
  }

  void startAnimation() {
    this.assignAnimation();
    this.load();
  }

  void disposeAnimation() {
    controller.dispose();
    helloController.dispose();
    createController.dispose();
    loginController.dispose();
  }
}
