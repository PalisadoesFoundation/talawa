import 'package:flutter/material.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';
import 'package:talawa/widgets/signup_progress_bar.dart';

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
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
              ),
              body: Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 6),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SignupProgressBar(
                              key: const Key('SelectOrg'), currentPageIndex: 1),
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
                                      0.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomRichText(
                                        key: const Key('UrlPageText'),
                                        words: model.greeting,
                                      ),
                                      SizedBox(
                                        height: SizeConfig.screenHeight! * 0.05,
                                      ),
                                      TextFormField(
                                          controller: model.firstName,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.text,
                                          autofillHints: const <String>[
                                            AutofillHints.givenName
                                          ],
                                          enableSuggestions: true,
                                          validator: (value) =>
                                              Validator.validateFirstName(
                                                  value!),
                                          decoration: InputDecoration(
                                            hintText: 'John',
                                            labelText: 'Enter your first name*',
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          )),
                                      SizedBox(
                                        height:
                                            SizeConfig.screenHeight! * 0.015,
                                      ),
                                      TextFormField(
                                          controller: model.lastName,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.text,
                                          autofillHints: const <String>[
                                            AutofillHints.familyName
                                          ],
                                          enableSuggestions: true,
                                          validator: (value) =>
                                              Validator.validateLastName(
                                                  value!),
                                          decoration: InputDecoration(
                                            hintText: 'Carlos',
                                            labelText: 'Enter your last name*',
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          )),
                                      SizedBox(
                                        height:
                                            SizeConfig.screenHeight! * 0.015,
                                      ),
                                      TextFormField(
                                          controller: model.email,
                                          textInputAction: TextInputAction.next,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          autofillHints: const <String>[
                                            AutofillHints.email
                                          ],
                                          enableSuggestions: true,
                                          validator: (value) =>
                                              Validator.validateEmail(value!),
                                          decoration: InputDecoration(
                                            hintText: 'test@test.org',
                                            labelText:
                                                'Enter your registered Email*',
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          )),
                                      SizedBox(
                                        height:
                                            SizeConfig.screenHeight! * 0.015,
                                      ),
                                      TextFormField(
                                          controller: model.password,
                                          textInputAction: TextInputAction.next,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: model.hidePassword,
                                          autofillHints: const <String>[
                                            AutofillHints.password
                                          ],
                                          enableSuggestions: true,
                                          validator: (value) =>
                                              Validator.validatePassword(
                                                  value!),
                                          onFieldSubmitted: (done) {
                                            FocusScope.of(context).requestFocus(
                                                model.confirmFocus);
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    model.hidePassword =
                                                        !model.hidePassword;
                                                  });
                                                },
                                                icon: Icon(model.hidePassword
                                                    ? Icons.visibility_off
                                                    : Icons.visibility)),
                                            hintText: 'Password',
                                            labelText: 'Enter your password*',
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          )),
                                      SizedBox(
                                        height:
                                            SizeConfig.screenHeight! * 0.015,
                                      ),
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
                                          validator: (value) =>
                                              Validator.validatePasswordConfirm(
                                                  model.password.text, value!),
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            labelText: 'Confirm your password*',
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          )),
                                      SizedBox(
                                        height:
                                            SizeConfig.screenHeight! * 0.086,
                                      ),
                                    ],
                                  ),
                                ),
                                RaisedRoundedButton(
                                  buttonLabel: 'Next',
                                  onTap: model.next,
                                  textColor: const Color(0xFF008A37),
                                  key: const Key('SignUpLoginDetailsButton'),
                                  backgroundColor: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ]),
                  )));
        });
  }
}
