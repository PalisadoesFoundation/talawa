//flutter packages are called here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//pages are called here
import 'package:provider/provider.dart';
import 'package:talawa/controllers/signup_login_controller.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  LoginViewModel model = LoginViewModel();
  bool _progressBarState = false;
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

  //Main build starts here
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('Login'),
            style: const TextStyle(
              fontSize: 35,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 6.25,
          ),
          AutofillGroup(
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofillHints: const <String>[
                    AutofillHints.email,
                  ],
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  controller: _emailController,
                  validator: (val) => Validator.validateEmail(val, context),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  //Changed text input action to next
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.orange,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelText: AppLocalizations.of(context).translate("Email"),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    alignLabelWithHint: true,
                    hintText:
                        AppLocalizations.of(context).translate('Email Example'),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onSaved: (value) {
                    model.email = value;
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                TextFormField(
                  autofillHints: const <String>[
                    AutofillHints.password,
                  ],
                  obscureText: _obscureText,
                  textAlign: TextAlign.left,
                  controller: _passwordController,
                  validator: (val) => Validator.validatePassword(val, context),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.orange,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
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
                    labelText:
                        AppLocalizations.of(context).translate("Password"),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    focusColor: UIData.primaryColor,
                    alignLabelWithHint: true,
                    hintText: '**********',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onSaved: (value) {
                    model.password = value;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2.5,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.safeBlockVertical * 2.5,
              horizontal: SizeConfig.safeBlockHorizontal * 7.25,
            ),
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(12.0)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    const StadiumBorder()),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
              ),
              onPressed: () async {
                FocusScope.of(context).unfocus();
                //checks to see if all the fields have been validated then authenticate a user
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Provider.of<SignupLoginController>(context, listen: false)
                      .loginUser(
                    context: context,
                    email: model.email,
                    password: model.password,
                    exceptionState: () {
                      setState(() {
                        _progressBarState = false;
                      });
                    },
                    successState: () {
                      setState(() {
                        _progressBarState = true;
                      });
                    },
                  );
                  setState(() {
                    toggleProgressBarState();
                  });
                }
              },
              child: _progressBarState
                  ? const CircularProgressIndicator()
                  : Text(
                      AppLocalizations.of(context).translate("SIGN IN"),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  //function toggles _obscureText value
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
