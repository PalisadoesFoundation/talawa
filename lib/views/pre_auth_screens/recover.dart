// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

/// This class recovers the users password.
/// The users needs to enter his/her email and press on the button at the bottom to recover his/her password.
class Recover extends StatefulWidget {
  const Recover({required Key key}) : super(key: key);

  @override
  _RecoverState createState() => _RecoverState();
}

class _RecoverState extends State<Recover> {
  final TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final text = [
      {
        'text':
            "${AppLocalizations.of(context)!.translate("Sit back relax, we'll")} ",
        'textStyle': Theme.of(context).textTheme.headlineSmall
      },
      {
        'text': '${AppLocalizations.of(context)!.translate("Recover")} ',
        'textStyle':
            Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24)
      },
      {
        'text': AppLocalizations.of(context)!.translate("your password"),
        'textStyle': Theme.of(context).textTheme.headlineSmall
      },
    ];
    return Scaffold(
      key: const Key('RecoverScreenScaffold'),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
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
          //custom text at the top of the screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRichText(
                key: const Key('RecoverPageText'),
                words: text,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              //This form takes the email of the user as an input
              Form(
                key: formKey,
                child: TextFormField(
                  key: const Key('EmailInputField'),
                  controller: email,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const <String>[AutofillHints.email],
                  enableSuggestions: true,
                  validator: (email) => Validator.validateEmail(email!),
                  decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.translate("Email Hint"),
                    labelText:
                        '${AppLocalizations.of(context)!.translate("Enter your registered Email")} *',
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.086,
              ),
              //Button to initiate the process of recovering password.
              RaisedRoundedButton(
                buttonLabel: AppLocalizations.of(context)!
                    .strictTranslate('Recover Password'),
                onTap: () {
                  formKey.currentState!.validate();
                },
                textColor: const Color(0xFF008A37),
                key: const Key('RecoverButton'),
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
