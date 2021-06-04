import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/custom_painters/language_icon.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/set_url_view_model.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/base_view.dart';

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
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          model.url.text = widget.uri;
          return Scaffold(
            body: Container(
              margin: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth! * 0.06,
                  SizeConfig.safeBlockVertical! * 4,
                  SizeConfig.screenWidth! * 0.06,
                  0.0),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child: Form(
                key: model.formKey,
                autovalidateMode: model.validate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const ChangeLanguage(),
                    CustomRichText(
                      key: const Key('UrlPageText'),
                      words: model.greeting,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: model.url,
                            focusNode: model.urlNode,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            enableSuggestions: true,
                            // validator: (value) => Validator.validateURL(value!),
                            // onFieldSubmitted: (value) => Validator.validateURL(value),
                            decoration: InputDecoration(
                              hintText:
                                  'https://talawa-api-graphql.herokuapp.com/graphql',
                              labelText: 'Enter Organization URL *',
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            model.verifyURL();
                          },
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            child: !model.isBusy
                                ? Text(
                                    model.verified ? 'Verified' : 'Verify',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                  )
                                : const CircularProgressIndicator(),
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.086,
                    ),
                    model.verified
                        ? Column(
                            children: [
                              RaisedRoundedButton(
                                buttonLabel: 'Login',
                                onTap: () =>
                                    model.navigateTo(Routes.loginScreen),
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
                                    model.navigateTo(Routes.signupDetailScreen),
                                showArrow: true,
                                textColor: Colors.white,
                                key: const Key('SignUpButton'),
                                backgroundColor: const Color(0xFF008A37),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * 0.08,
                              ),
                            ],
                          )
                        : Container(),
                    const ChangeLanguage()
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().pushReplacementScreen('/mainScreen');
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
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.8)),
          )
        ],
      ),
    );
  }
}
