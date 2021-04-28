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
                padding: const EdgeInsets.only(bottom: 30.0),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    RegisterForm(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already have an account?",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text(
                              "SIGN IN!",
                              textAlign: TextAlign.start,
                              style:
                                  const TextStyle(color: UIData.primaryColor),
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
      //resizeToAvoidBottomInset: false,
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: const AssetImage(UIData.cloud1), fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: registrationScreenForm(),
          ),
        ),
      ),
    );
  }
}
