import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/lang_controller.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({required Key key, required this.selectedLangId})
      : super(key: key);
  final int selectedLangId;

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  late int selectedLangIndex;

  @override
  void initState() {
    selectedLangIndex = widget.selectedLangId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('SelectLanguageScreenScaffold'),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              child: Text(
                AppLocalizations.of(context)!
                    .strictTranslate('Select Language'),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.018,
            ),
            const CupertinoSearchTextField(
              key: Key('SearchField'),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.016,
            ),
            Expanded(
                child: ListView.builder(
                    key: const Key('LanguagesList'),
                    itemCount: languages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        key: Key(selectedLangIndex == index
                            ? 'Selected'
                            : 'NotSelected'),
                        onTap: () {
                          setState(() {
                            selectedLangIndex = index;
                          });
                        },
                        child: Container(
                          key: Key('LanguageItem$index'),
                          alignment: Alignment.centerLeft,
                          height: SizeConfig.screenHeight! * 0.063,
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth! * 0.06,
                          ),
                          decoration: BoxDecoration(
                              color: index == selectedLangIndex
                                  ? const Color(0xFFC4C4C4).withOpacity(0.15)
                                  : Colors.transparent),
                          child: index == 0
                              ? Row(
                                  key: const Key('LanguageItem'),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      languages[index].langName,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .strictTranslate('Default'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: const Color(0xFF4285F4)),
                                    ),
                                  ],
                                )
                              : Text(
                                  languages[index].langName,
                                  style: Theme.of(context).textTheme.headline6,
                                  key: const Key('LanguageItem'),
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
                key: const Key('NavigateToUrlPage'),
                onPressed: () async {
                  await Provider.of<AppLanguage>(
                    context,
                    listen: false,
                  ).changeLanguage(
                      Locale(languages[selectedLangIndex].langCode));
                  navigationService.pushScreen('/setUrl', arguments: '');
                },
                child: Text(
                  AppLocalizations.of(context)!.strictTranslate('Select'),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: 18,
                        color: const Color(0xFF008A37),
                      ),
                  key: const Key('SelectLangTextButton'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
