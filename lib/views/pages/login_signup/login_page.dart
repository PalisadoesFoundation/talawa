//flutter packages are called here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/login_signup/login_form.dart';
import 'package:talawa/views/pages/login_signup/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  //providing the initial states to the variables
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  Widget loginScreenForm() => Center(
        child: Container(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
              constraints: BoxConstraints(
                  maxWidth: SizeConfig.safeBlockHorizontal * 75,
                  minWidth: SizeConfig.safeBlockHorizontal * 62.5,
                  minHeight: SizeConfig.safeBlockVertical * 37.5),
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 7.5),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    LoginForm(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Dont have an account?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: const Text(
                              "SIGN UP!",
                              textAlign: TextAlign.start,
                              style: TextStyle(color: UIData.primaryColor),
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
  //main build starts here
  @override
  build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        key: _scaffoldkey,
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(UIData.cloud1), fit: BoxFit.cover),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: loginScreenForm(),
            ),
          ),
        ));
  }
}
