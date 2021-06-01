import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';
import 'package:talawa/services/size_config.dart';

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
  late List<Map<String, dynamic>> text;

  @override
  Widget build(BuildContext context) {
    text = [
      {'text': "We're ", 'textStyle': Theme.of(context).textTheme.headline5},
      {
        'text': 'Glad ',
        'textStyle':
            Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24)
      },
      {'text': "you're ", 'textStyle': Theme.of(context).textTheme.headline5},
      {
        'text': 'Back ',
        'textStyle':
            Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24)
      },
    ];
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
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
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
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 14, color: const Color(0xFF4285F4)),
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
