import 'package:flutter/material.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';
import 'package:talawa/services/size_config.dart';

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({required Key key, required this.swipePage})
      : super(key: key);
  final Function swipePage;
  @override
  _SignUpDetailsState createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  FocusNode confirmFocus = FocusNode();
  bool hidePassword = true;
  AutovalidateMode _validate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final text = [
      {'text': "Let's ", 'textStyle': Theme.of(context).textTheme.headline5},
      {'text': 'get ', 'textStyle': Theme.of(context).textTheme.headline5},
      {'text': "you ", 'textStyle': Theme.of(context).textTheme.headline5},
      {
        'text': 'SignUp ',
        'textStyle':
            Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24)
      },
    ];
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! * 0.06,
            SizeConfig.screenHeight! * 0.01,
            SizeConfig.screenWidth! * 0.06,
            0.0),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Form(
          key: _formKey,
          autovalidateMode: _validate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRichText(
                key: const Key('UrlPageText'),
                words: text,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              TextFormField(
                  controller: firstName,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  autofillHints: const <String>[AutofillHints.givenName],
                  enableSuggestions: true,
                  validator: (value) => Validator.validateFirstName(value!),
                  decoration: InputDecoration(
                    hintText: 'John',
                    labelText: 'Enter your first name',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                  )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.015,
              ),
              TextFormField(
                  controller: lastName,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  autofillHints: const <String>[AutofillHints.familyName],
                  enableSuggestions: true,
                  validator: (value) => Validator.validateLastName(value!),
                  decoration: InputDecoration(
                    hintText: 'Carlos',
                    labelText: 'Enter your last name',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                  )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.015,
              ),
              TextFormField(
                  controller: email,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const <String>[AutofillHints.email],
                  enableSuggestions: true,
                  validator: (value) => Validator.validateEmail(value!),
                  decoration: InputDecoration(
                    hintText: 'test@test.org',
                    labelText: 'Enter your registered Email *',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                  )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.015,
              ),
              TextFormField(
                  controller: password,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: hidePassword,
                  autofillHints: const <String>[AutofillHints.password],
                  enableSuggestions: true,
                  validator: (value) => Validator.validatePassword(value!),
                  onFieldSubmitted: (done) {
                    FocusScope.of(context).requestFocus(confirmFocus);
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    hintText: 'Password',
                    labelText: 'Enter your password',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                  )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.015,
              ),
              TextFormField(
                  controller: confirmPassword,
                  focusNode: confirmFocus,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  autofillHints: const <String>[AutofillHints.password],
                  obscureText: hidePassword,
                  validator: (value) =>
                      Validator.validatePasswordConfirm(password.text, value!),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Confirm your password',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                  )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.086,
              ),
              RaisedRoundedButton(
                buttonLabel: 'Next',
                onTap: () {
                  FocusScope.of(context).unfocus();
                  _validate = AutovalidateMode.always;
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    widget.swipePage();
                    print('tapped');
                  }
                },
                textColor: const Color(0xFF008A37),
                key: const Key('SignUpLoginDetailsButton'),
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.0215,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
