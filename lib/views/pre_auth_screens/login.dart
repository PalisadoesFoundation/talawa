// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

/// This is the login widget.
/// There are two input fiels. The first one takes in the email and
/// the second one takes in the password of the user.
/// There is also a "Forgot Password" text button, which directs to
/// the "recover password" screen when pressed.
/// At the bottom, there is a login button to initiate the login.
class Login extends StatefulWidget {
  const Login({required Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
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
                key: model.formKey,
                autovalidateMode: model.validate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Custom greeting text.
                    CustomRichText(
                      key: const Key('UrlPageText'),
                      words: model.greeting,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.05,
                    ),
                    //Input form for the email of the user.
                    TextFormField(
                      key: const Key('EmailInputField'),
                      controller: model.email,
                      focusNode: model.emailFocus,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const <String>[AutofillHints.email],
                      enableSuggestions: true,
                      validator: (value) {
                        final String? err = Validator.validateEmail(value!);
                        if (err != null) {
                          return AppLocalizations.of(context)!.translate(err);
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .translate("Email Hint"),
                        labelText:
                            '${AppLocalizations.of(context)!.translate("Enter your registered Email")} *',
                        labelStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.025,
                    ),
                    //Input form for the password of the user.
                    TextFormField(
                      key: const Key('PasswordInputField'),
                      controller: model.password,
                      focusNode: model.passwordFocus,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      enableSuggestions: true,
                      autofillHints: const <String>[AutofillHints.password],
                      obscureText: model.hidePassword,
                      validator: (value) {
                        final String? err = Validator.validatePassword(value!);
                        if (err != null) {
                          return AppLocalizations.of(context)!.translate(err);
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              model.hidePassword = !model.hidePassword;
                            });
                          },
                          icon: Icon(
                            model.hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        hintText:
                            AppLocalizations.of(context)!.translate('password'),
                        labelText:
                            '${AppLocalizations.of(context)!.translate("Enter your password")} *',
                        labelStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    //Option to recover the password if the user forgets his/her password.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            model.emailFocus.unfocus();
                            model.passwordFocus.unfocus();
                            navigationService.pushScreen('/recover');
                          },
                          child: Text(
                            '${AppLocalizations.of(context)!.translate("Forgot password")}?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                  color: const Color(0xFF4285F4),
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.086,
                    ),
                    //Button to initiate the login.
                    RaisedRoundedButton(
                      buttonLabel: AppLocalizations.of(context)!
                          .strictTranslate('Login'),
                      onTap: () => model.login(),
                      textColor: const Color(0xFF008A37),
                      key: const Key('LoginButton'),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.0215),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
