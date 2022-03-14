import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/lang_switch.dart';
import 'package:talawa/widgets/theme_switch.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({Key? key}) : super(key: key);

  @override
  _AppSettingsPageState createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('AppSettingScaffold'),
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.strictTranslate('Settings'),
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            const ChangeThemeTile(),
            const LanguageTile(),
          ],
        ),
      ),
    );
  }
}
