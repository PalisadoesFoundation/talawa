import 'package:flutter/material.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/login_signup/login_page.dart';
import 'package:talawa/views/pages/login_signup/register_form.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterePageState createState() => _RegisterePageState();
}

class _RegisterePageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  Widget registrationScreenForm() => Center(
        child: Container(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
              constraints: BoxConstraints(
                  maxWidth: SizeConfig.safeBlockHorizontal * 75,
                  minWidth: SizeConfig.safeBlockHorizontal * 62.5,
                  minHeight: SizeConfig.safeBlockVertical * 43.75),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 5,
                    horizontal: SizeConfig.safeBlockHorizontal * 5),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RegisterForm(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: UIData.primaryColor,
                              fontFamily: UIData.ralewayFont),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text(
                              "SIGN IN!",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: UIData.ralewayFont),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: registrationScreenForm(),
        ),
      ),
    );
  }
}
