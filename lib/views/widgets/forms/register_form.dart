import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'package:fluttertoast/fluttertoast.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController originalPassword = new TextEditingController();
  RegisterViewModel model = new RegisterViewModel();
  bool _progressBarState = false;
  Queries _signupQuery = Queries();
  bool _validate = false;
  Preferences _pref = Preferences();
  FToast fToast;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  bool _obscureText = true;

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);
  }

  //function for registering user which gets called when sign up is pressed
  registerUser() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_signupQuery.registerUser(
            model.firstName, model.lastName, model.email, model.password))));
    if (result.hasException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });
      print("exception");
      _exceptionToast(result.exception.toString());
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });
      _successToast("Successfully Registered");

      //Store user token in local storage
      void getToken() async {
        final Token token =
            new Token(tokenString: result.data['signUp']['token']);
        await _pref.saveToken(token);
        final String currentUserId = result.data['signUp']['userId'];
        await _pref.saveUserId(currentUserId);
      }

      getToken();

      //Navigate user to join organization screen
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => new JoinOrganization()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidate: _validate,
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
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                prefixIcon: Icon(Icons.person,color:Colors.grey[350]),
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
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                prefixIcon: Icon(Icons.person,color:Colors.grey[350]),
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
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                prefixIcon: Icon(Icons.email,color:Colors.grey[350]),
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
              obscureText: _obscureText,
              controller: originalPassword,
              validator: (value) => Validator.validatePassword(value),
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              prefixIcon: Icon(Icons.lock,color:Colors.grey[350]),
                suffixIcon: FlatButton(
                    onPressed: _toggle,
                    child: Icon(_obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                        color:Colors.grey[350])),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                focusColor: UIData.primaryColor,
                alignLabelWithHint: true,
                hintText: 'password',
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
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                prefixIcon: Icon(Icons.lock,color:Colors.grey[350]),
                labelText: "Confirm Password",
                labelStyle: TextStyle(color: Colors.white),
                focusColor: UIData.primaryColor,
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
                onPressed: () async {
                  _validate = true;
                  if (_formKey.currentState.validate()) {
                    print("run mutation");
                    _formKey.currentState.save();
                    registerUser();
                    setState(() {
                      toggleProgressBarState();
                    });
                  }
                },
              ),
            ),
          ],
        ));
  }

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
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  _exceptionToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Text(msg),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
