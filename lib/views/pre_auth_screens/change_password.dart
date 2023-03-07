// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

/// This widget lets the user change his/her password.
/// There are two input fields. The first one is for entering the new password, and the
/// second one is for re-entering the password for verification.
/// There is a raised button which finally updates the password when pressed.
class ChangePass extends StatefulWidget {
  const ChangePass({required Key key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController reNewPassword = TextEditingController();
  final FocusNode newPasswordFocus = FocusNode();
  final FocusNode reNewPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    //custom text variable (List).
    final text = [
      {
        'text': "${AppLocalizations.of(context)!.translate("Hello")}, ",
        'textStyle': Theme.of(context).textTheme.headlineSmall
      },
      {
        'text': '${AppLocalizations.of(context)!.translate("User Name")} ',
        'textStyle':
            Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24)
      },
      {
        'text': "${AppLocalizations.of(context)!.translate("we've")} ",
        'textStyle': Theme.of(context).textTheme.headlineSmall
      },
      {
        'text':
            '${AppLocalizations.of(context)!.translate("got you covered")} ',
        'textStyle': Theme.of(context).textTheme.headlineSmall
      },
    ];
    return Scaffold(
      key: const Key('ChangePassScreenScaffold'),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            navigationService.pop();
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
            0.0,
          ),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRichText(
                  key: const Key('ChangePageText'),
                  words: text,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),
                // Text field taking the input of the password
                TextFormField(
                  key: const Key('PassInputField'),
                  controller: newPassword,
                  focusNode: newPasswordFocus,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  autofillHints: const <String>[AutofillHints.password],
                  obscureText: true,
                  validator: (pass) => Validator.validatePassword(pass!),
                  decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.translate('password'),
                    labelText:
                        '${AppLocalizations.of(context)!.translate("Enter new password")} *',
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.025,
                ),
                // Text field taking the input of the password again for verification
                TextFormField(
                  key: const Key('PassRepeatInputField'),
                  controller: reNewPassword,
                  focusNode: reNewPasswordFocus,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  autofillHints: const <String>[AutofillHints.password],
                  obscureText: true,
                  validator: (pass) => Validator.validatePasswordConfirm(
                    pass!,
                    newPassword.text,
                  ),
                  decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.translate('password'),
                    labelText:
                        '${AppLocalizations.of(context)!.translate("Re-Enter your password")} *',
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.086,
                ),
                // Button for changing the password
                RaisedRoundedButton(
                  buttonLabel:
                      '${AppLocalizations.of(context)!.translate("Change Password")} ',
                  onTap: () {
                    formKey.currentState!.validate();
                    newPasswordFocus.unfocus();
                    reNewPasswordFocus.unfocus();
                  },
                  textColor: const Color(0xFF008A37),
                  key: const Key('ChangePasswordButton'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.0215,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
