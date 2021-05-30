import 'package:flutter/material.dart';
import 'package:talawa/custom_painters/language_icon.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/widgets/raised_roundedge_button.dart';
import 'package:talawa/widgets/rich_text.dart';
import '../../locator.dart';
import '../../size_config.dart';
import '../../textstyles.dart';

class SetUrl extends StatefulWidget {
  const SetUrl({required Key key}) : super(key: key);

  @override
  _SetUrlState createState() => _SetUrlState();
}

class _SetUrlState extends State<SetUrl> {
  TextEditingController url = TextEditingController();
  FocusNode urlFocus = FocusNode();
  List<Map<String, dynamic>> text = [
    {'text': 'Join ', 'textStyle': greetingStyle},
    {'text': 'and ', 'textStyle': selectLanguageStyle},
    {'text': 'Collaborate ', 'textStyle': greetingStyle},
    {'text': 'with     your ', 'textStyle': selectLanguageStyle},
    {'text': 'Organizations', 'textStyle': greetingSubStyle},
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! * 0.06,
            SizeConfig.safeBlockVertical! * 4,
            SizeConfig.screenWidth! * 0.06,
            0.0),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.08),
                child: CustomPaint(
                  size: Size(SizeConfig.screenWidth! * 0.6,
                      (SizeConfig.screenWidth! * 0.6).toDouble()),
                  painter: AppLogo(),
                ),
              ),
              CustomRichText(
                key: const Key('UrlPageText'),
                words: text,
              ),
              TextFormField(
                controller: url,
                focusNode: urlFocus,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                decoration: textInputDecoration.copyWith(
                    hintText:
                        'https://talawa-api-graphql.herokuapp.com/graphql',
                    labelText: 'Enter Organization URL *',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                    suffix: InkWell(
                      onTap: () {
                        print('tapped');
                      },
                      child: const Text(
                        'Verify',
                        style: urlVerifyStyle,
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.086,
              ),
              RaisedRoundedButton(
                buttonLabel: 'Login',
                onTap: () {
                  print('tapped');
                  urlFocus.unfocus();
                  locator<NavigationService>().pushScreen('/login');
                },
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
                onTap: () {
                  urlFocus.unfocus();
                  locator<NavigationService>().pushScreen('/signup');
                  print('tapped');
                },
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
                  locator<NavigationService>()
                      .pushReplacementScreen('/selectLang');
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
                      style: languageStyle.copyWith(
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
    );
  }
}
