import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({required Key key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
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
              child: SizedBox(
                height: SizeConfig.screenHeight! * 0.045,
                child: FittedBox(
                  child: Text(
                    AppLocalizations.of(context)!
                        .strictTranslate('Select Language'),
                    style: Theme.of(context).textTheme.headline5,
                    key: const Key('Select Language'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.018,
            ),
            // const CupertinoSearchTextField(
            //   key: Key('SearchField'),
            // ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.016,
            ),
            Expanded(
                child: ListView.builder(
                    key: const Key('LanguagesList'),
                    itemCount: languages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        key: Key(Provider.of<AppLanguage>(context)
                                    .appLocal
                                    .languageCode ==
                                languages[index].langCode
                            ? 'Selected'
                            : 'NotSelected'),
                        onTap: () async {
                          await Provider.of<AppLanguage>(
                            context,
                            listen: false,
                          ).changeLanguage(
                            Locale(languages[index].langCode),
                          );
                        },
                        child: Consumer<AppLanguage>(
                          builder: (context, appLang, _) {
                            return Container(
                              key: Key('LanguageItem$index'),
                              alignment: Alignment.centerLeft,
                              height: SizeConfig.screenHeight! * 0.063,
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth! * 0.06,
                              ),
                              decoration: BoxDecoration(
                                  color: languages[index].langCode ==
                                          appLang.appLocal.languageCode
                                      ? const Color(0xFFC4C4C4)
                                          .withOpacity(0.15)
                                      : Colors.transparent),
                              child: index == 0
                                  ? Row(
                                      key: const Key('LanguageItem'),
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          languages[index].langName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .strictTranslate('Default'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  color:
                                                      const Color(0xFF4285F4)),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      languages[index].langName,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      key: const Key('LanguageItem'),
                                    ),
                            );
                          },
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
                  Provider.of<AppLanguage>(context, listen: false)
                      .selectLanguagePress();
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
