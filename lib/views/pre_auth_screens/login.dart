import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

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
                child: Form(
                  key: model.formKey,
                  autovalidateMode: model.validate,
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
                      ),
                      TextFormField(
                          controller: model.email,
                          focusNode: model.emailFocus,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const <String>[AutofillHints.email],
                          enableSuggestions: true,
                          validator: (value) => Validator.validateEmail(value!),
                          decoration: InputDecoration(
                            hintText: 'test@test.org',
                            labelText: 'Enter your registered Email *',
                            labelStyle: Theme.of(context).textTheme.subtitle1,
                          )),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.025,
                      ),
                      TextFormField(
                          controller: model.password,
                          focusNode: model.passwordFocus,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          enableSuggestions: true,
                          autofillHints: const <String>[AutofillHints.password],
                          obscureText: model.hidePassword,
                          validator: (value) =>
                              Validator.validatePassword(value!),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    model.hidePassword = !model.hidePassword;
                                  });
                                },
                                icon: Icon(model.hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
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
                              model.emailFocus.unfocus();
                              model.passwordFocus.unfocus();
                              locator<NavigationService>()
                                  .pushScreen('/recover');
                            },
                            child: Text(
                              'Forgot password?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 14,
                                      color: const Color(0xFF4285F4)),
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
                          model.login();
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
            ),
          );
        });
  }
}
