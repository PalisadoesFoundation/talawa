import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/constants/contants.dart';
import 'package:talawa/services/navigation_service.dart';

import '../../locator.dart';
import '../../size_config.dart';
import '../../textstyles.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({required Key key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! * 0.06,
            SizeConfig.safeBlockVertical! * 4,
            SizeConfig.screenWidth! * 0.06,
            0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenWidth! * 0.06),
              child: const Text(
                'Select Language',
                style: selectLanguageStyle,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.018,
            ),
            const CupertinoSearchTextField(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.016,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: SizeConfig.screenHeight! * 0.063,
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth! * 0.06,
                          ),
                          decoration: BoxDecoration(
                              color: index == selected
                                  ? const Color(0xFFC4C4C4).withOpacity(0.15)
                                  : Colors.transparent),
                          child: index == 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      languages[index],
                                      style: languageStyle,
                                    ),
                                    const Text(
                                      'Default',
                                      style: languageDefaultStyle,
                                    ),
                                  ],
                                )
                              : Text(
                                  languages[index],
                                  style: languageStyle,
                                ),
                        ),
                      );
                    })),
            const Divider(
              color: Color(0xffe5e5e5),
            ),
            Container(
              height: SizeConfig.screenHeight! * 0.08,
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  print('selected');
                  locator<NavigationService>().pushScreen('/setUrl');
                },
                child: const Text(
                  'Select',
                  style: languageSelectStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
