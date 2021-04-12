import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:talawa/generated/l10n.dart';
import 'package:talawa/services/preferences.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({Key key}) : super(key: key);

  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  Preferences _pref;

  @override
  Widget build(BuildContext context) {
    _pref = Provider.of<Preferences>(context, listen: false);
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text("English"),
            onTap: () {
              setState(() {
                Locale locale = Locale('en');
                S.delegate.load(locale);
                _pref.setLocal(locale);
              });

              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("हिंदी"),
            subtitle: Text("Hindi"),
            onTap: () {
              setState(() {
                Locale locale = Locale('hi');
                S.delegate.load(locale);
                _pref.setLocal(locale);
              });

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
