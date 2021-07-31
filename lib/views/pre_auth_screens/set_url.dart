import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/custom_painters/language_icon.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
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
            key: const Key('SetUrlScreenScaffold'),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(
                            top: SizeConfig.safeBlockVertical! * 2),
                        child: IconButton(
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            size: 30,
                            semanticLabel: 'Join Organisation with QR',
                          ),
                          onPressed: () => model.scanQR(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.screenHeight! * 0.08),
                        child: CustomPaint(
                          key: const Key('LogoPainter'),
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
                        key: const Key('UrlInputField'),
                        controller: model.url,
                        focusNode: model.urlFocus,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        enableSuggestions: true,
                        validator: (value) {
                          final String? msg = Validator.validateURL(value!);
                          if (msg == null) {
                            return null;
                          }

                          return AppLocalizations.of(context)!.translate(msg);
                        },
                        onFieldSubmitted: (value) =>
                            AppLocalizations.of(context)!
                                .translate(Validator.validateURL(value)),
                        decoration: InputDecoration(
                            hintText:
                                'https://talawa-graphql-api.herokuapp.com/graphql',
                            labelText:
                                '${AppLocalizations.of(context)!.translate("Enter Organization URL")} *',
                            labelStyle: Theme.of(context).textTheme.subtitle1,
                            suffixIcon: InkWell(
                              key: const Key('VerifyButton'),
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
                                  AppLocalizations.of(context)!
                                      .strictTranslate("Verify"),
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
                        key: const Key('LoginButton'),
                        buttonLabel: AppLocalizations.of(context)!
                            .strictTranslate('Login'),
                        onTap: () async {
                          print("login");
                          await model.checkURLandNavigate('/login', '');
                        },
                        showArrow: true,
                        textColor: Theme.of(context)
                            .inputDecorationTheme
                            .focusedBorder!
                            .borderSide
                            .color,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryVariant,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.0215,
                      ),
                      RaisedRoundedButton(
                        key: const Key('SignUpButton'),
                        buttonLabel: AppLocalizations.of(context)!
                            .strictTranslate('Sign Up'),
                        onTap: () => model.checkURLandNavigate(
                            '/selectOrg', model.orgId),
                        showArrow: true,
                        textColor:
                            Theme.of(context).colorScheme.secondaryVariant,
                        backgroundColor: Theme.of(context)
                            .inputDecorationTheme
                            .focusedBorder!
                            .borderSide
                            .color,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.06,
                      ),
                      GestureDetector(
                        key: const Key('ChangeLanguage'),
                        onTap: () {
                          navigationService.pushReplacementScreen('/selectLang',
                              arguments: '0');
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: SizeConfig.safeBlockVertical! * 2),
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
                                AppLocalizations.of(context)!
                                    .strictTranslate('Change language'),
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
