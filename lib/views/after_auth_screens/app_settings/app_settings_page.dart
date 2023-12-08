// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/lang_switch.dart';
import 'package:talawa/widgets/theme_switch.dart';

/// AppSettingsPage is a widget that has mutable state _AppSettingsPageState.
class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key});

  @override
  _AppSettingsPageState createState() => _AppSettingsPageState();
}

/// _AppSettingsPageState is state which return a widget for talawa app setting page.
class _AppSettingsPageState extends State<AppSettingsPage> {
  @override
  Widget build(BuildContext context) {
    // Scaffold implements the basic Material Design visual layout structure.
    //Learn more about Scaffold class
    //[here](https://api.flutter.dev/flutter/material/Scaffold-class.html).
    return Scaffold(
      key: const Key('AppSettingScaffold'),
      // AppBar is a horizontal bar typically shown at the top of an app using the appBar property.
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        centerTitle: true,
        // title of the page in appBar property
        title: Text(
          // title text translation according to the app language.
          AppLocalizations.of(context)!.strictTranslate('Settings'),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => navigationService.pop(),
        ),
      ),
      // style of the AppBar.
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            ChangeThemeTile(),
            LanguageTile(),
          ],
        ),
      ),
    );
  }
}
