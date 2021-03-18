
//flutter packages are called here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//pages are called here
import 'package:provider/provider.dart';
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

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final email = TextEditingController();
  final newPassword = TextEditingController();
  final repeatNewPassword = TextEditingController();
  final password = TextEditingController();

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
    if (result.hasException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });

      _exceptionToast(result.exception.toString().substring(16));
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
      if(organisations.isEmpty){
        //skip the steps below
      }else{
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

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => new HomePage()));
    }
  }


  //main build starts here
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
            AutofillGroup(child: Column(
              children: <Widget>[
                TextFormField(
                  autofillHints: <String>[AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validator.validateEmail(value),
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.white,),
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
                  autofillHints: <String>[AutofillHints.password],
                  obscureText: _obscureText,
                  validator: (value) => Validator.validatePassword(value),
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.white,),
                    suffixIcon: FlatButton(
                      onPressed: _toggle,
                      child: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                          color: Colors.white,
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    focusColor: UIData.primaryColor,
                    alignLabelWithHint: true,
                    hintText: '**********',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onSaved: (value) {
                    model.password = value;
                  },
                ),
              ],
            )),
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
          Expanded(child:Text(msg)),
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
