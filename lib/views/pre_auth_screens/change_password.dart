import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/widgets/raised_roundedge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../size_config.dart';
import '../../textstyles.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({required Key key}) : super(key: key);

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  TextEditingController newPassword = TextEditingController();
  TextEditingController reNewPassword = TextEditingController();
  FocusNode newPasswordFocus = FocusNode();
  FocusNode reNewPasswordFocus = FocusNode();
  List<Map<String, dynamic>> text = [
    // ignore: unnecessary_string_escapes
    {
      'text': "Hello, ",
      'textStyle':
          Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
              .textTheme
              .headline5
    },
    {
      'text': 'User Name ',
      'textStyle':
          Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
              .textTheme
              .headline6!
              .copyWith(fontSize: 24)
    },
    // ignore: unnecessary_string_escapes
    {
      'text': "we\'ve ",
      'textStyle':
          Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
              .textTheme
              .headline5
    },
    {
      'text': 'got you covered ',
      'textStyle':
          Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
              .textTheme
              .headline5
    },
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
            color: Colors.black,
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
                  controller: newPassword,
                  focusNode: newPasswordFocus,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  autofillHints: const <String>[AutofillHints.password],
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password',
                    labelText: 'Enter new password *',
                  )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.025,
              ),
              TextFormField(
                  controller: reNewPassword,
                  focusNode: reNewPasswordFocus,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  autofillHints: const <String>[AutofillHints.password],
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password',
                    labelText: 'Re-Enter your password *',
                  )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.086,
              ),
              RaisedRoundedButton(
                buttonLabel: 'Change Password ',
                onTap: () {
                  newPasswordFocus.unfocus();
                  reNewPasswordFocus.unfocus();
                  print('tapped');
                },
                textColor: const Color(0xFF008A37),
                key: const Key('Change Password Button'),
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
