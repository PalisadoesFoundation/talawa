import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/QueryMutation.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  LoginViewModel model = new LoginViewModel();
  bool _progressBarState = false;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation loginQuery = QueryMutation();

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  @override
  Widget build(BuildContext context) {
          return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text('Login',
                      style: TextStyle(fontSize: 35, color: Colors.white)),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    validator: (value) => Validator.validateEmail(value),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      hintText: 'foo@bar.com',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onSaved: (value) {
                      model.email = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (value) => Validator.validatePassword(value),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      focusColor: UIData.quitoThemeColor,
                      alignLabelWithHint: true,
                      hintText: 'foo@bar.com',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onSaved: (value) {
                      model.password = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(12.0),
                      shape: StadiumBorder(),
                      child: _progressBarState
                          ? const CircularProgressIndicator()
                          : Text(
                              "SIGN IN",
                            ),
                      color: Colors.white,
                      onPressed: () async {
                        GraphQLClient _client = graphQLConfiguration.clientToQuery();
                        FocusScope.of(context).unfocus();
                        print("validate");
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          QueryResult result = await _client.query(
                            QueryOptions(documentNode: gql(loginQuery.login),
                            variables: {"email":model.email, "password":model.password}
                            ),
                            
                          );
                          print(model.email);
                          print(model.password);
                          if (result.hasException) {
                            print(result.exception);
                            _progressBarState = false;
                            final snackBar = SnackBar(
                                content: Text(result.exception.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                backgroundColor: Colors.orange,
                                duration: Duration(seconds: 4));
                            Scaffold.of(context).showSnackBar(snackBar);
                          } else if (!result.hasException && !result.loading) {
                            setState(() {
                              toggleProgressBarState();
                            });
                            final snackBar = SnackBar(
                                content: Text("Getting Things Ready...",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 4));
                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                        }

                        // setState(() {
                        //   toggleProgressBarState();
                        //   if (_formKey.currentState.validate()) {
                        //     _formKey.currentState.save();
                        //     Provider.of<AuthController>(context, listen: false)
                        //         .login(context, model);
                        //   } else {}
                        //   toggleProgressBarState();
                        // });
                      },
                    ),
                  ),
                ],
              ));
        
  }
}
