// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';
import 'package:talawa/widgets/signup_progress_indicator.dart';

/// This widget takes the user details for signup. The form includes first name, last name, email, password, and password confirmation inputs.
class SignUpDetails extends StatefulWidget {
  const SignUpDetails({required Key key, required this.selectedOrg})
      : super(key: key);
  final OrgInfo selectedOrg;
  @override
  _SignUpDetailsState createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignupDetailsViewModel>(
      onModelReady: (model) => model.initialise(widget.selectedOrg),
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset:
              true, // To allow the keyboard to not overlap the form
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                navigationService.pop();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 6),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SignupProgressIndicator(
                    key: const Key('SelectOrg'),
                    currentPageIndex: 1,
                  ),
                  Form(
                    key: model.formKey,
                    autovalidateMode: model.validate,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                            SizeConfig.screenWidth! * 0.06,
                            SizeConfig.screenWidth! * 0.05,
                            SizeConfig.screenWidth! * 0.06,
                            0.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomRichText(
                                key: const Key('UrlPageText'),
                                words: model.greeting,
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * 0.05,
                              ), //Input field for the first name of the user.
                              TextFormField(
                                key: const Key('FirstNameInputField'),
                                controller: model.firstName,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                autofillHints: const <String>[
                                  AutofillHints.givenName
                                ],
                                enableSuggestions: true,
                                validator: (value) {
                                  final String? msg =
                                      Validator.validateFirstName(
                                    value!,
                                  );
                                  if (msg == null) {
                                    return null;
                                  }
                                  return AppLocalizations.of(context)!
                                      .translate(
                                    Validator.validateFirstName(
                                      value,
                                    ),
                                  );
                                },
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!
                                      .translate('First Name Hint'),
                                  labelText:
                                      '${AppLocalizations.of(context)!.translate("Enter your first name")}*',
                                  labelStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * 0.015,
                              ), //Input field for the last name of the user.
                              TextFormField(
                                key: const Key('LastNameInputField'),
                                controller: model.lastName,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                autofillHints: const <String>[
                                  AutofillHints.familyName
                                ],
                                enableSuggestions: true,
                                validator: (value) {
                                  final String? msg =
                                      Validator.validateLastName(
                                    value!,
                                  );
                                  if (msg == null) {
                                    return null;
                                  }
                                  return AppLocalizations.of(context)!
                                      .translate(
                                    Validator.validateLastName(value),
                                  );
                                },
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(
                                    context,
                                  )!
                                      .translate('Last Name Hint'),
                                  labelText:
                                      '${AppLocalizations.of(context)!.translate("Enter your last name")}*',
                                  labelStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * 0.015,
                              ),
                              //Input field for the email of the user.
                              TextFormField(
                                key: const Key('signUpEmailField'),
                                controller: model.email,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                autofillHints: const <String>[
                                  AutofillHints.email
                                ],
                                enableSuggestions: true,
                                validator: (value) {
                                  final String? msg =
                                      Validator.validateEmail(value!);
                                  if (msg == null) {
                                    return null;
                                  }

                                  return AppLocalizations.of(context)!
                                      .translate(
                                    Validator.validateEmail(value),
                                  );
                                },
                                decoration: InputDecoration(
                                  hintText: 'test@test.org',
                                  labelText:
                                      '${AppLocalizations.of(context)!.translate("Enter your registered Email")}*',
                                  labelStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * 0.015,
                              ), //Input field for the password of the user.
                              TextFormField(
                                key: const Key('signuppassword'),
                                controller: model.password,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: model.hidePassword,
                                autofillHints: const <String>[
                                  AutofillHints.password
                                ],
                                enableSuggestions: true,
                                validator: (value) {
                                  final String? msg =
                                      Validator.validatePassword(
                                    value!,
                                  );
                                  if (msg == null) {
                                    return null;
                                  }

                                  return AppLocalizations.of(context)!
                                      .translate(
                                    Validator.validatePassword(value),
                                  );
                                },
                                onFieldSubmitted: (done) {
                                  FocusScope.of(context).requestFocus(
                                    model.confirmFocus,
                                  );
                                },
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        model.hidePassword =
                                            !model.hidePassword;
                                      });
                                    },
                                    icon: Icon(
                                      model.hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  hintText: AppLocalizations.of(context)!
                                      .translate('password'),
                                  labelText:
                                      '${AppLocalizations.of(context)!.translate("Enter your password")}*',
                                  labelStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * 0.015,
                              ), //Input field for the confirmation of the password of the user.
                              TextFormField(
                                controller: model.confirmPassword,
                                focusNode: model.confirmFocus,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.text,
                                enableSuggestions: true,
                                autofillHints: const <String>[
                                  AutofillHints.password
                                ],
                                obscureText: model.hidePassword,
                                validator: (value) {
                                  final String? msg =
                                      Validator.validatePasswordConfirm(
                                    model.password.text,
                                    value!,
                                  );
                                  if (msg == null) {
                                    return null;
                                  }
                                  return AppLocalizations.of(context)!
                                      .translate(
                                    Validator.validatePasswordConfirm(
                                      model.password.text,
                                      value,
                                    ),
                                  );
                                },
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .translate('password'),
                                  labelText:
                                      '${AppLocalizations.of(context)!.translate("Confirm your password")}*',
                                  labelStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * 0.086,
                              ),
                            ],
                          ),
                        ), //Sign up button.
                        RaisedRoundedButton(
                          buttonLabel: AppLocalizations.of(context)!
                              .strictTranslate('Next'),
                          onTap: model.signUp,
                          textColor: const Color(0xFF008A37),
                          key: const Key('SignUpLoginDetailsButton'),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
