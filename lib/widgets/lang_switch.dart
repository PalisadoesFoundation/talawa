import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/language/language_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(builder: (context, appLang, _) {
      final Language userLanguage = languages.firstWhere(
          (element) => element.langCode == appLang.appLocal.languageCode);
      return ListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text("Language"),
        trailing: TextButton(
          onPressed: () {
            navigationService.pushReplacementScreen('/selectLang',
                arguments: '0');
          },
          child: Text(userLanguage.langName),
        ),
      );
    });
  }
}
