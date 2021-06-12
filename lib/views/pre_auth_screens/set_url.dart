import 'package:flutter/material.dart';
import 'package:talawa/custom_painters/language_icon.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/pre_auth_view_models/set_url_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

class SetUrl extends StatefulWidget {
  const SetUrl({required Key key, required this.uri}) : super(key: key);
  final String uri;

  @override
  _SetUrlState createState() => _SetUrlState();
}

class _SetUrlState extends State<SetUrl> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SetUrlViewModel>(
        onModelReady: (model) => model.initialise(inviteUrl: widget.uri),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              margin: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth! * 0.06,
                  SizeConfig.safeBlockVertical! * 4,
                  SizeConfig.screenWidth! * 0.06,
                  0.0),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Form(
                  key: model.formKey,
                  autovalidateMode: model.validate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.screenHeight! * 0.08),
                        child: CustomPaint(
                          size: Size(SizeConfig.screenWidth! * 0.6,
                              (SizeConfig.screenWidth! * 0.6).toDouble()),
                          painter: AppLogo(),
                        ),
                      ),
                      CustomRichText(
                        key: const Key('UrlPageText'),
                        words: model.greeting,
                      ),
                      TextFormField(
                        controller: model.url,
                        focusNode: model.urlFocus,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        enableSuggestions: true,
                        validator: (value) => Validator.validateURL(value!),
                        onFieldSubmitted: (value) =>
                            Validator.validateURL(value),
                        decoration: InputDecoration(
                            hintText:
                                'https://talawa-api-graphql.herokuapp.com/graphql',
                            labelText: 'Enter Organization URL *',
                            labelStyle: Theme.of(context).textTheme.subtitle1,
                            suffixIcon: InkWell(
                              onTap: () {
                                model.urlFocus.unfocus();
                                model.validate = AutovalidateMode.always;
                                model.formKey.currentState!.validate();
                              },
                              child: Container(
                                height: 48,
                                width: 48,
                                alignment: Alignment.center,
                                child: Text(
                                  'Verify',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.086,
                      ),
                      RaisedRoundedButton(
                        buttonLabel: 'Login',
                        onTap: () => model.checkURLandNavigate('/login', ''),
                        showArrow: true,
                        textColor: const Color(0xFF008A37),
                        key: const Key('LoginButton'),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.0215,
                      ),
                      RaisedRoundedButton(
                        buttonLabel: 'Sign Up',
                        onTap: () =>
                            model.checkURLandNavigate('/selectOrg', '-1'),
                        showArrow: true,
                        textColor: Colors.white,
                        key: const Key('SignUpButton'),
                        backgroundColor: const Color(0xFF008A37),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.08,
                      ),
                      GestureDetector(
                        onTap: () {
                          locator<NavigationService>().pushReplacementScreen(
                              '/selectLang',
                              arguments: '0');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPaint(
                              size: Size(
                                  SizeConfig.screenWidth! * 0.125,
                                  (SizeConfig.screenWidth! * 0.125 * 0.5)
                                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                              painter: LanguageIcon(),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Change language',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.8)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
