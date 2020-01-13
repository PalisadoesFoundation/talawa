import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/view_models/vm_register.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  RegisterViewModel model = new RegisterViewModel();
  AuthController _authController = new AuthController();
  bool _progressBarState = false;

  String _validateFirstName(String value){
    if (value.length < 4) {
      return 'First name must be at least 4 characters.';
    }
    return null;
  }
  String _validateLastName(String value){
    if (value.length < 4) {
      return 'Last name must be at least 4 characters.';
    }
    return null;
  }

  String _validateEmail(String value) {
    RegExp regExp = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
        multiLine: false);
    if (!regExp.hasMatch(value)) {
      return 'E-mail Address must be a valid email address.';
    }
    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be at least 4 characters.';
    }

    return null;
  }

  String _validatePasswordConfirm(String value){
    if(value != model.password){
      return 'Password does not match original';
    }
    return null;
  }
  void toggleProgressBarState(){
    _progressBarState = !_progressBarState;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text('Register', style: TextStyle(fontSize: 35, color: Colors.white)),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              validator: (value) {
                return _validateFirstName(value);
              },
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
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
              validator: (value) {
                return _validateLastName(value);
              },
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
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
              validator: (value) {
                return _validateEmail(value);
              },
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
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
              validator: (value) {
                return _validatePassword(value);
              },
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
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
              validator: (value) {
                return _validatePassword(value);
              },
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
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
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
                onPressed: () {
                  setState(() {
                    toggleProgressBarState(); 
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _authController.register(context, model).then((response) {});
                    } else {}
                    toggleProgressBarState(); 
                  });
                },
              ),
            ),
          ],
        ));
  }
}
