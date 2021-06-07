//flutter packages are called here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/lang_selector.dart';
import 'package:talawa/views/pages/login_signup/login_form.dart';
import 'package:talawa/views/pages/login_signup/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  Widget loginScreenForm() => Center(
        child: Container(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: SizeConfig.safeBlockHorizontal * 75,
              minWidth: SizeConfig.safeBlockHorizontal * 62.5,
              minHeight: SizeConfig.safeBlockVertical * 37.5,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: SizeConfig.safeBlockVertical * 7.5,
              ),
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  LoginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)
                            .translate("Dont have an account?"),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context).translate("SIGN UP!"),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: UIData.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  LanguageSelectorPage(),
                          fullscreenDialog: true,
                          transitionDuration: const Duration(milliseconds: 500),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                              begin: const Offset(0.0, 1.0),
                              end: Offset.zero,
                            );

                            final curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.ease,
                            );

                            return SlideTransition(
                              position: tween.animate(curvedAnimation),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        const Icon(
                          Icons.translate,
                          color: UIData.primaryColor,
                        ),
                        const SizedBox(width: 5),
                        const Text('Change App Language'),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  //main build starts here
  @override
  build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(UIData.cloud1),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: loginScreenForm(),
          ),
        ),
      ),
    );
  }
}
