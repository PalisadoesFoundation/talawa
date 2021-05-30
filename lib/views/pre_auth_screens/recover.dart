import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/widgets/raised_roundedge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../size_config.dart';

class Recover extends StatefulWidget {
  const Recover({required Key key}) : super(key: key);

  @override
  _RecoverState createState() => _RecoverState();
}

class _RecoverState extends State<Recover> {
  TextEditingController email = TextEditingController();
  List<Map<String, dynamic>> text = [
    // ignore: unnecessary_string_escapes
    {
      'text': "Sit back relax, we'll ",
      'textStyle':
          Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
              .textTheme
              .headline5
    },
    {
      'text': 'Recover ',
      'textStyle':
          Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
              .textTheme
              .headline6!
              .copyWith(fontSize: 24)
    },
    // ignore: unnecessary_string_escapes
    {
      'text': "your password",
      'textStyle':
          Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
              .textTheme
              .headline5
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                  controller: email,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const <String>[AutofillHints.email],
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    hintText: 'test@test.org',
                    labelText: 'Enter your registered Email *',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                  )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.086,
              ),
              RaisedRoundedButton(
                buttonLabel: 'Recover Password',
                onTap: () {
                  print('tapped');
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
