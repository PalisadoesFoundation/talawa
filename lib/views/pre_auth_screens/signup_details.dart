import 'package:flutter/material.dart';
import 'package:talawa/widgets/raised_roundedge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../size_config.dart';
import '../../textstyles.dart';

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({required Key key, required this.swipePage})
      : super(key: key);
  final Function swipePage;
  @override
  _SignUpDetailsState createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  FocusNode confirmFocus = FocusNode();
  bool hidePassword = true;

  List<Map<String, dynamic>> text = [
    /// Add textstyle after defining routes

    // ignore: unnecessary_string_escapes
    // {'text': "Let\'s ", 'textStyle': selectLanguageStyle},
    // {'text': 'get ', 'textStyle': selectLanguageStyle},
    // // ignore: unnecessary_string_escapes
    // {'text': "you ", 'textStyle': selectLanguageStyle},
    // {'text': 'SignUp ', 'textStyle': greetingStyle},
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! * 0.06,
            SizeConfig.screenHeight! * 0.01,
            SizeConfig.screenWidth! * 0.06,
            0.0),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
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
                decoration: InputDecoration(
                  hintText: 'Carlos',
                  labelText: 'Enter your last name',
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
                widget.swipePage();
                print('tapped');
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
    );
  }
}
