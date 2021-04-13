//flutter packages are called here
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/Animation/FadeAnimation.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/views/pages/login_signup/login_form.dart';
import 'package:talawa/views/pages/login_signup/register_form.dart';
import 'package:talawa/views/pages/login_signup/register_page.dart';

import 'login_form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  //providing the initial states to the variables
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  loginScreenForm() => Center(

        child: Container(

          // alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
              // constraints: const BoxConstraints(
              //     maxWidth: 300.0, minWidth: 250.0, minHeight: 300.0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 30.0),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 210,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: -100,
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  child: FadeAnimation(1, Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/background.png'),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  )),
                                ),
                                Positioned(
                                  top: -60,
                                  height: 300,
                                  width: MediaQuery.of(context).size.width+20,
                                  child: FadeAnimation(1.3, Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/background-2.png'),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                        LoginForm()
                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     const Text(
                    //       "Dont have an account?",
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     Container(
                    //       margin: const EdgeInsets.only(left: 8.0),
                    //       child: GestureDetector(
                    //         onTap: () {
                    //           // Navigator.pop(context);
                    //           Navigator.pushReplacement(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => RegisterPage()));
                    //         },
                    //         child: const Text(
                    //           "SIGN UP!",
                    //           textAlign: TextAlign.start,
                    //           style:
                    //               const TextStyle(color: UIData.primaryColor),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )
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
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: const AssetImage(UIData.cloud1), fit: BoxFit.cover),
          // ),
          child: SingleChildScrollView(
            child: loginScreenForm(),
          ),
        ));
  }
}
