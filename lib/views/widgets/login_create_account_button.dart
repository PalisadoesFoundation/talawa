import 'package:flutter/material.dart';

import 'package:talawa/utils/ui_scaling.dart';

class LoginCreateAccountButton extends StatelessWidget {
  const LoginCreateAccountButton({Key key,@required this.isLogin, this.onPressed, this.loginAnimation}) : super(key: key);
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
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
                          buttonName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
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
