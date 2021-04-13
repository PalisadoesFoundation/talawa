//flutter packages are called here
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//pages are called here
import 'package:provider/provider.dart';
import 'package:talawa/Animation/FadeAnimation.dart';
import 'package:talawa/services/Queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../_pages.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  /// [TextEditingController]'s for email and password.
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  LoginViewModel model = new LoginViewModel();
  bool _progressBarState = false;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  Queries _query = Queries();
  FToast fToast;
  Preferences _pref = Preferences();
  static String orgURI;
  bool _obscureText = true;

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  //providing variables with initial states
  @override
  void initState() {
    super.initState();
    Provider.of<GraphQLConfiguration>(context, listen: false).getOrgUrl();
    fToast = FToast();
    fToast.init(context);
  }

  //function for login user which gets called when sign in is press
  Future loginUser() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_query.loginUser(model.email, model.password))));
    bool connectionCheck = await DataConnectionChecker().hasConnection;
    if (!connectionCheck) {
      print('You are not connected to the internet');
      setState(() {
        _progressBarState = false;
      });
      _exceptionToast(
          'Connection Error. Make sure your Internet connection is stable');
    } else if (result.hasException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });

      _exceptionToast(result.exception.toString().substring(16, 35));
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });
      _successToast("All Set!");
      final Token accessToken =
          new Token(tokenString: result.data['login']['accessToken']);
      await _pref.saveToken(accessToken);
      final Token refreshToken =
          new Token(tokenString: result.data['login']['refreshToken']);
      await _pref.saveRefreshToken(refreshToken);
      final String currentUserId = result.data['login']['user']['_id'];
      await _pref.saveUserId(currentUserId);
      final String userFName = result.data['login']['user']['firstName'];
      await _pref.saveUserFName(userFName);
      final String userLName = result.data['login']['user']['lastName'];
      await _pref.saveUserLName(userLName);

      List organisations = result.data['login']['user']['joinedOrganizations'];
      if (organisations.isEmpty) {
        //skip the steps below
      } else {
        //execute the steps below
        final String currentOrgId =
            result.data['login']['user']['joinedOrganizations'][0]['_id'];
        await _pref.saveCurrentOrgId(currentOrgId);

        final String currentOrgImgSrc =
            result.data['login']['user']['joinedOrganizations'][0]['image'];
        await _pref.saveCurrentOrgImgSrc(currentOrgImgSrc);

        final String currentOrgName =
            result.data['login']['user']['joinedOrganizations'][0]['name'];
        await _pref.saveCurrentOrgName(currentOrgName);
      }
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>HomePage(openPageIndex: 0,)), (route) => false);
    }
  }

  //main build starts here
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text('Login', style: TextStyle(fontSize: 35, color: Colors.white)),

              AutofillGroup(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1.5, Text("Login", style: TextStyle(color: Color.fromRGBO(49, 39, 79, 1), fontWeight: FontWeight.bold, fontSize: 30),)),
                        SizedBox(height: 30,),
                        FadeAnimation(1.7, Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(196, 135, 198, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[200]
                                    ))
                                ),
                                child: TextFormField(
                                  autofillHints: <String>[AutofillHints.email],
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.left,
                                  controller: _emailController,
                                  validator: Validator.validateEmail,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "foo@bar.com",
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                  onSaved: (value) {
                                    model.email = value;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  autofillHints: <String>[AutofillHints.password],
                                  obscureText: _obscureText,
                                  textAlign: TextAlign.left,
                                  controller: _passwordController,
                                  validator: Validator.validatePassword,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "**********",
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                  onSaved: (value) {
                                    model.password = value;
                                  },
                                ),
                              )
                            ],
                          ),
                        )),
                        SizedBox(height: 20,),
                        // FadeAnimation(1.7, Center(child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),))),
                        SizedBox(height: 30,),
                        FadeAnimation(1.9, GestureDetector(
                          onTap: ()async{
                            FocusScope.of(context).unfocus();
                            //checks to see if all the fields have been validated then authenticate a user
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              loginUser();
                              setState(() {
                                toggleProgressBarState();
                              });
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromRGBO(49, 39, 79, 1),
                            ),
                            child: Center(
                              child: Text("Login", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        )),
                        SizedBox(height: 30,),
                        FadeAnimation(2, Center(child: Text("Create Account", style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),))),
                      ],
                    ),
                  )
              ),

              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              //   width: double.infinity,
              //   child: RaisedButton(
              //       padding: EdgeInsets.all(12.0),
              //       shape: StadiumBorder(),
              //       child: _progressBarState
              //           ? const CircularProgressIndicator()
              //           : Text(
              //               "SIGN IN",
              //             ),
              //       color: Colors.white,
              //       onPressed: () async {
              //         FocusScope.of(context).unfocus();
              //         //checks to see if all the fields have been validated then authenticate a user
              //         if (_formKey.currentState.validate()) {
              //           _formKey.currentState.save();
              //           loginUser();
              //           setState(() {
              //             toggleProgressBarState();
              //           });
              //         }
              //       }),
              // ),
            ],
          )),
    );
  }

  //the method called when the result is success
  _successToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Text(msg)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  //the method called when the result is an exception
  _exceptionToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Text(
            msg,
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }

  //function toggles _obscureText value
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
