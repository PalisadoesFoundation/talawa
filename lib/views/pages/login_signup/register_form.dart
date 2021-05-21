//flutter packages are called here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
// pages are called here
import 'package:provider/provider.dart';
import 'package:talawa/controllers/signup_login_controller.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:talawa/views/pages/login_signup/image.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _originalPasswordController =
      TextEditingController();
  FocusNode confirmPassField = FocusNode();
  RegisterViewModel model = RegisterViewModel();
  bool _progressBarState = false;
  var _validate = AutovalidateMode.disabled;
  bool _obscureText = true;

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  @override
  void initState() {
    super.initState();
    Provider.of<GraphQLConfiguration>(
      context,
      listen: false,
    ).getOrgUrl();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: _validate,
        child: Column(
          children: <Widget>[
            AddImage(),
            Provider.of<SignupLoginController>(context).getImage == null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('Add Profile Image'),
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ))
                : IconButton(
                    icon: const Icon(Icons.delete, size: 30, color: Colors.red),
                    onPressed: () => Provider.of<SignupLoginController>(
                      context,
                      listen: false,
                    ).deleteImage(),
                  ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3.15),
            AutofillGroup(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofillHints: const <String>[AutofillHints.givenName],
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    controller: _firstNameController,
                    validator: (value) =>
                        Validator.validateFirstName(value, context),
                    textAlign: TextAlign.left,
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
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      labelText:
                          AppLocalizations.of(context).translate("First Name"),
                      labelStyle: const TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      hintText: AppLocalizations.of(context)
                          .translate('First Name Example'),
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    onSaved: (value) => model.firstName = value,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                  TextFormField(
                    autofillHints: const [AutofillHints.familyName],
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    controller: _lastNameController,
                    validator: (val) =>
                        Validator.validateLastName(val, context),
                    textAlign: TextAlign.left,
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
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      labelText:
                          AppLocalizations.of(context).translate("Last Name"),
                      labelStyle: const TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      hintText: AppLocalizations.of(context)
                          .translate('Last Name Example'),
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    onSaved: (value) => model.lastName = value,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                  TextFormField(
                    autofillHints: const <String>[AutofillHints.email],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => Validator.validateEmail(val, context),
                    controller: _emailController,
                    textAlign: TextAlign.left,
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
                      prefixIcon: const Icon(Icons.email, color: Colors.white),
                      labelText:
                          AppLocalizations.of(context).translate("Email"),
                      labelStyle: const TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      hintText: AppLocalizations.of(context)
                          .translate("Email Example"),
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    onSaved: (value) => model.email = value,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                  TextFormField(
                    autofillHints: const <String>[AutofillHints.password],
                    textInputAction: TextInputAction.next,
                    obscureText: _obscureText,
                    controller: _originalPasswordController,
                    validator: (val) =>
                        Validator.validatePassword(val, context),
                    textAlign: TextAlign.left,
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
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      suffixIcon: TextButton(
                        onPressed: _toggle,
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      labelText:
                          AppLocalizations.of(context).translate("Password"),
                      labelStyle: const TextStyle(color: Colors.white),
                      focusColor: UIData.primaryColor,
                      alignLabelWithHint: true,
                      hintText: AppLocalizations.of(context)
                          .translate('Password Hint'),
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(confirmPassField);
                    },
                    onChanged: (_) => setState(() {}),
                    onSaved: (value) => model.password = value,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 1.25),
                  FlutterPwValidator(
                    width: 400,
                    height: 150,
                    minLength: 8,
                    uppercaseCharCount: 1,
                    specialCharCount: 1,
                    numericCharCount: 1,
                    onSuccess: (_) => setState(() {}),
                    controller: _originalPasswordController,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                  TextFormField(
                    autofillHints: const <String>[AutofillHints.password],
                    obscureText: true,
                    focusNode: confirmPassField,
                    validator: (value) => Validator.validatePasswordConfirm(
                        _originalPasswordController.text, value, context),
                    textAlign: TextAlign.left,
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
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      labelText: AppLocalizations.of(context)
                          .translate("Confirm Password"),
                      labelStyle: const TextStyle(color: Colors.white),
                      focusColor: UIData.primaryColor,
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 2.5,
                horizontal: SizeConfig.safeBlockHorizontal * 7.5,
              ),
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
                  _validate = AutovalidateMode.always;
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Provider.of<SignupLoginController>(context, listen: false)
                        .registerNewUser(
                      context: context,
                      email: model.email,
                      firstName: model.firstName,
                      lastName: model.lastName,
                      password: model.password,
                      exceptionState: () => setState(() {
                        _progressBarState = false;
                      }),
                      successState: () => setState(() {
                        _progressBarState = true;
                      }),
                    );
                    setState(() {
                      toggleProgressBarState();
                    });
                  }
                },
                child: _progressBarState
                    ? SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 5,
                        height: SizeConfig.safeBlockVertical * 2.5,
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.orange),
                          strokeWidth: 3,
                          backgroundColor: Colors.black,
                        ))
                    : Text(AppLocalizations.of(context).translate("SIGN UP")),
              ),
            ),
          ],
        ),
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
