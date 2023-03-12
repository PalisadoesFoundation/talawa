// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/theme_view_model.dart';

/// This class enables theme switch.
/// It returns a ListTile which contains a Toggle button to switch between Dark and Light Themes.
class ChangeThemeTile extends StatelessWidget {
  const ChangeThemeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);
    return ListTile(
      key: const Key('ThemeSwitch'),
      contentPadding: EdgeInsets.zero,
      title: Text(AppLocalizations.of(context)!.strictTranslate("Dark Theme")),
      trailing: Switch(
        key: const Key('ToggleTheme'),
        autofocus: true,
        activeColor: Theme.of(context).colorScheme.primary,
        value: themeProvider.isdarkTheme,
        onChanged: (value) {
          final provider = Provider.of<AppTheme>(context, listen: false);
          provider.switchTheme(isOn: value);
        },
      ),
    );
  }
}
