import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/services/Queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/views/pages/nav_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  Queries _query = Queries();
  FToast fToast;
  Preferences _pref = Preferences();

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);
  }

  //function for login user which gets called when sign in is press
  Future loginUser() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.loginUser(model.email, model.password))));
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
      _successToast("All Set!");
      //Store user token and id in preferences

      final Token token = new Token(tokenString: result.data['login']['token']);
      await _pref.saveToken(token);
      final String currentUserId = result.data['login']['userId'];
      await _pref.saveUserId(currentUserId);
      print('User logged in');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => new HomePage()));
    }
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
              keyboardType: TextInputType.emailAddress,
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
                      loginUser();
                      setState(() {
                      toggleProgressBarState();
                    });
                    }
                  }),
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
      toastDuration: Duration(seconds: 5),
    );
  }
}
