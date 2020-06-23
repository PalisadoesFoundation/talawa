import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/user_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/views/pages/join_organization.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  bool isEmailAvailable = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController originalPassword = new TextEditingController();
  RegisterViewModel model = new RegisterViewModel();
  bool _progressBarState = false;
  Queries signupQuery = Queries();
  String _currentUserId;

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        documentNode: gql(signupQuery.signUp),
        update: (Cache cache, QueryResult result) {
          if (result.hasException) {
            print("exception");
            final snackBar = SnackBar(
                content: Text(result.exception.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                backgroundColor: Colors.orange,
                duration: Duration(seconds: 4));
            Scaffold.of(context).showSnackBar(snackBar);
          }
          return cache;
        },
        onCompleted: (dynamic resultData) {
          print(resultData);

          if (resultData != null) {
            final snackBar = SnackBar(
                content: Text("Getting Things Ready...",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 4));
            setState(() {
              toggleProgressBarState();
            });
            Scaffold.of(context).showSnackBar(snackBar);

            //Store user token in local storage
            final Token token =
                new Token(tokenString: resultData.data['signup']['token']);
            print(resultData.data['signup']['token']);
            // _currentUserId = await Preferences.saveCurrentUserId(token);

            //Navigate user to join organization screen
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => new JoinOrganization()));
          }
        },
      ),
      builder: (RunMutation runMutation, QueryResult result) {
        return Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Text('Register',
                    style: TextStyle(fontSize: 35, color: Colors.white)),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  validator: (value) => Validator.validateFirstName(value),
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    prefixIcon: Icon(Icons.person),
                    labelText: "First Name",
                    labelStyle: TextStyle(color: Colors.white),
                    alignLabelWithHint: true,
                    hintText: 'Earl',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onSaved: (value) {
                    model.firstName = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  validator: (value) => Validator.validateLastName(value),
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    prefixIcon: Icon(Icons.person),
                    labelText: "Last Name",
                    labelStyle: TextStyle(color: Colors.white),
                    alignLabelWithHint: true,
                    hintText: 'John',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onSaved: (value) {
                    model.lastName = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validator.validateEmail(value),
                  controller: emailController,
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
                  controller: originalPassword,
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
                TextFormField(
                  obscureText: true,
                  validator: (value) => Validator.validatePasswordConfirm(
                      originalPassword.text, value),
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(color: Colors.white),
                    focusColor: UIData.quitoThemeColor,
                  ),
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
                            "SIGN UP",
                          ),
                    color: Colors.white,
                    onPressed: () async {
                      // FocusScope.of(context).unfocus();
                      // setState(() {
                      //   toggleProgressBarState();
                      // });

                      // Flushbar(
                      //    message: result.exception.toString(),

                      //   icon: Icon(
                      //     Icons.info_outline,
                      //     size: 28.0,
                      //     color: Colors.white,
                      //   ),
                      //   backgroundColor: Colors.amber,
                      //   duration: Duration(seconds: 3),
                      // )..show(context);

                      // isEmailAvailable = await Provider.of<UserController>(context, listen: false).validateUserEmail(emailController.text);
                      if (_formKey.currentState.validate()) {
                        print("run mutation");
                        _formKey.currentState.save();
                        runMutation({
                          "firstName": model.firstName,
                          "lastName": model.lastName,
                          "email": model.email,
                          "password": model.password
                        });
                        //await Provider.of<AuthController>(context, listen: false).register(context, model);
                        if (result.loading) {
                          setState(() {
                            toggleProgressBarState();
                          });
                        }
                      }
                    },
                  ),
                ),
              ],
            ));
      },
    );
  }
}
