import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:talawa/utils/GraphAPI.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_login.dart';

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
  GraphAPI _graphAPI = GraphAPI();

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text('Login', style: TextStyle(fontSize: 35, color: Colors.white)),
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
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
                  FocusScope.of(context).unfocus();
                  //checks to see if all the fields have been validated then authenticate a user
                   if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _graphAPI.login(context, model);
                   }
                  // setState(() {
                  //   toggleProgressBarState();
                  //    if (_formKey.currentState.validate()) {
                  //   _formKey.currentState.save();
                  //   _graphAPI.login(context, model);
                      
                  //   } else{
                  //     toggleProgressBarState();
                  //   }
                  // });
                 
              
                }
              ),
            ),
          ],
        ));
  }
}
