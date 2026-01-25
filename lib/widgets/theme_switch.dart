import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/theme_view_model.dart';

/// This class enables theme switch.
class ChangeThemeTile extends StatelessWidget {
  const ChangeThemeTile({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final themeProvider = Provider.of<AppTheme>(context);
=======
>>>>>>> upstream/develop
    return ListTile(
      key: const Key('ThemeSwitch'),
      contentPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal!,
      ),
      title: Text(AppLocalizations.of(context)!.strictTranslate("Dark Theme")),
<<<<<<< HEAD
      trailing: Switch(
        key: const Key('ToggleTheme'),
        autofocus: true,
        activeColor: Theme.of(context).colorScheme.primary,
        value: themeProvider.isdarkTheme,
        onChanged: (value) {
          final provider = Provider.of<AppTheme>(context, listen: false);
          provider.switchTheme(isOn: value);
=======
      trailing: Selector<AppTheme, bool>(
        selector: (_, appTheme) => appTheme.isdarkTheme,
        builder: (context, isDarkTheme, child) {
          return Switch(
            key: const Key('ToggleTheme'),
            autofocus: true,
            activeColor: Theme.of(context).colorScheme.primary,
            value: isDarkTheme,
            onChanged: (value) {
              context.read<AppTheme>().switchTheme(isOn: value);
            },
          );
>>>>>>> upstream/develop
        },
      ),
    );
  }
}
