import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/view_model/theme_view_model.dart';

class ChangeThemeTile extends StatelessWidget {
  const ChangeThemeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text("Dark Theme"),
      trailing: Switch.adaptive(
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
