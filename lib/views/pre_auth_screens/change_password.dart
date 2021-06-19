import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';
import 'package:talawa/services/size_config.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({required Key key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  TextEditingController newPassword = TextEditingController();
  TextEditingController reNewPassword = TextEditingController();
  FocusNode newPasswordFocus = FocusNode();
  FocusNode reNewPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final text = [
      {
        'text': "${AppLocalizations.of(context)!.translate("Hello")}, ",
        'textStyle': Theme.of(context).textTheme.headline5
      },
      {
        'text': '${AppLocalizations.of(context)!.translate("User Name")} ',
        'textStyle':
            Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24)
      },
      {
        'text': "${AppLocalizations.of(context)!.translate("we've")} ",
        'textStyle': Theme.of(context).textTheme.headline5
      },
      {
        'text':
            '${AppLocalizations.of(context)!.translate("got you covered")} ',
        'textStyle': Theme.of(context).textTheme.headline5
      },
    ];
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
                    hintText:
                        AppLocalizations.of(context)!.translate('password'),
                    labelText:
                        '${AppLocalizations.of(context)!.translate("Enter new password")} *',
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
                    hintText:
                        AppLocalizations.of(context)!.translate('password'),
                    labelText:
                        '${AppLocalizations.of(context)!.translate("Re-Enter your password")} *',
                  )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.086,
              ),
              RaisedRoundedButton(
                buttonLabel:
                    '${AppLocalizations.of(context)!.translate("Change Password")} ',
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
