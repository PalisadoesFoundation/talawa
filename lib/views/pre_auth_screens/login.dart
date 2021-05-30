import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/widgets/raised_roundedge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../size_config.dart';
import '../../textstyles.dart';

class Login extends StatefulWidget {
  const Login({required Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  List<Map<String, dynamic>> text = [
    // ignore: unnecessary_string_escapes
    {'text': "We\'re ", 'textStyle': selectLanguageStyle},
    {'text': 'Glad ', 'textStyle': greetingStyle},
    // ignore: unnecessary_string_escapes
    {'text': "you\'re ", 'textStyle': selectLanguageStyle},
    {'text': 'Back ', 'textStyle': greetingStyle},
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            locator<NavigationService>().pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.fromLTRB(
              SizeConfig.screenWidth! * 0.06,
              SizeConfig.screenHeight! * 0.2,
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
                  controller: email,
                  focusNode: emailFocus,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const <String>[AutofillHints.email],
                  enableSuggestions: true,
                  decoration: textInputDecoration.copyWith(
                    hintText: 'test@test.org',
                    labelText: 'Enter your registered Email *',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                  )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.025,
              ),
              TextFormField(
                  controller: password,
                  focusNode: passwordFocus,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  autofillHints: const <String>[AutofillHints.password],
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                    hintText: 'password',
                    labelText: 'Enter your password *',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      print('selected');
                      emailFocus.unfocus();
                      passwordFocus.unfocus();
                      locator<NavigationService>().pushScreen('/recover');
                    },
                    child: Text(
                      'Forgot password?',
                      style: languageDefaultStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.086,
              ),
              RaisedRoundedButton(
                buttonLabel: 'Login',
                onTap: () {
                  emailFocus.unfocus();
                  passwordFocus.unfocus();
                  print('tapped');
                  locator<NavigationService>()
                      .pushReplacementScreen('/mainScreen');
                },
                textColor: const Color(0xFF008A37),
                key: const Key('LoginButton'),
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
