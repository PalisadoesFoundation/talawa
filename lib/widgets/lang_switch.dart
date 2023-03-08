// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/language/language_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';

/// This widget enables language switch for "internationalizing our app".
class LanguageTile extends StatelessWidget {
  const LanguageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //AppLanguage enables to set up localized values for each locale that our app supports.
    //A locale is an identifier used to select a user's language and formatting preferences.
    //This represents a Unicode Language Identifier (i.e. without Locale extensions),
    //except variants are not supported.
    return Consumer<AppLanguage>(
      builder: (context, appLang, _) {
        final Language userLanguage = languages.firstWhere(
          (element) => element.langCode == appLang.appLocal.languageCode,
        );
        return ListTile(
          key: const Key('LanguageTile'),
          contentPadding: EdgeInsets.zero,
          title:
              Text(AppLocalizations.of(context)!.strictTranslate("Language")),
          trailing: TextButton(
            key: const Key('LanguageSelector'),
            onPressed: () {
              navigationService.pushReplacementScreen(
                '/selectLang',
                arguments: '0',
              );
            },
            child: Text(userLanguage.langName),
          ),
        );
      },
    );
  }
}
