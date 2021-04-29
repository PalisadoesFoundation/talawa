//flutter packages are called here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//pages are called here
import 'package:provider/provider.dart';
import 'package:talawa/services/queries_.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/views/pages/home_page.dart';

import '../_pages.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  LoginViewModel model = LoginViewModel();
  bool _progressBarState = false;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final Queries _query = Queries();
  final Preferences _pref = Preferences();
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
  }

  //function for login user which gets called when sign in is press
  Future loginUser() async {
    final GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_query.loginUser(model.email, model.password))));
    if (result.hasException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });

      CustomToast.exceptionToast(msg: result.exception.toString());
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });
      CustomToast.sucessToast(msg: "All Set!");
      final Token accessToken =
          Token(tokenString: result.data['login']['accessToken'].toString());
      await _pref.saveToken(accessToken);
      final Token refreshToken =
          Token(tokenString: result.data['login']['refreshToken'].toString());
      await _pref.saveRefreshToken(refreshToken);
      final String currentUserId =
          result.data['login']['user']['_id'].toString();
      await _pref.saveUserId(currentUserId);
      final String userFName =
          result.data['login']['user']['firstName'].toString();
      await _pref.saveUserFName(userFName);
      final String userLName =
          result.data['login']['user']['lastName'].toString();
      await _pref.saveUserLName(userLName);

      final List organisations =
          result.data['login']['user']['joinedOrganizations'] as List;
      if (organisations.isEmpty) {
        //skip the steps below
      } else {
        //execute the steps below
        final String currentOrgId = result.data['login']['user']
                ['joinedOrganizations'][0]['_id']
            .toString();
        await _pref.saveCurrentOrgId(currentOrgId);

        final String currentOrgImgSrc = result.data['login']['user']
                ['joinedOrganizations'][0]['image']
            .toString();
        await _pref.saveCurrentOrgImgSrc(currentOrgImgSrc);

        final String currentOrgName = result.data['login']['user']
                ['joinedOrganizations'][0]['name']
            .toString();
        await _pref.saveCurrentOrgName(currentOrgName);
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const HomePage(
                    openPageIndex: 0,
                  )),
          (route) => false);
    }
  }

  //main build starts here
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const Text('Login',
                style: TextStyle(fontSize: 35, color: Colors.white)),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 6.25,
            ),
            AutofillGroup(
                child: Column(
              children: <Widget>[
                TextFormField(
                  autofillHints: const <String>[AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  controller: _emailController,
                  validator: Validator.validateEmail,
                  style: const TextStyle(color: Colors.white),
                  //Changed text input action to next
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelText: "Email",
                    labelStyle: const TextStyle(color: Colors.white),
                    alignLabelWithHint: true,
                    hintText: 'foo@bar.com',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  onSaved: (value) {
                    model.email = value;
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                TextFormField(
                  autofillHints: const <String>[AutofillHints.password],
                  obscureText: _obscureText,
                  textAlign: TextAlign.left,
                  controller: _passwordController,
                  validator: Validator.validatePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    suffixIcon: TextButton(
                      onPressed: _toggle,
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.white),
                    focusColor: UIData.primaryColor,
                    alignLabelWithHint: true,
                    hintText: '**********',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  onSaved: (value) {
                    model.password = value;
                  },
                ),
              ],
            )),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2.5,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 2.5,
                  horizontal: SizeConfig.safeBlockHorizontal * 7.25),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(12.0)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const StadiumBorder()),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
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
                },
                child: _progressBarState
                    ? const CircularProgressIndicator()
                    : const Text(
                        "SIGN IN",
                      ),
              ),
            ),
          ],
        ));
  }

  //function toggles _obscureText value
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
