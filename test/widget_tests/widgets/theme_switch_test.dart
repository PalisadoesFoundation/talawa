// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/widgets/theme_switch.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

Widget createApp() {
  return const MaterialApp(
    home: Scaffold(
      body: ChangeThemeTile(),
    ),
  );
}

class LocalizationsInj extends StatelessWidget {
  const LocalizationsInj({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      home: child,
    );
  }
}

void main() {
  testSetupLocator();
  locator<SizeConfig>().test();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Tests for theme_switch widget', () {
    testWidgets("Testing the widget", (tester) async {
      final mockAppTheme = getAndRegisterAppTheme();

      when(mockAppTheme.isdarkTheme).thenReturn(true);

      await tester.pumpWidget(
        ChangeNotifierProvider<AppTheme>.value(
          value: mockAppTheme,
          child: const LocalizationsInj(
            child: Scaffold(
              body: ChangeThemeTile(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      final listTileFinder = find.byType(ListTile).first;
      final listTile = tester.firstWidget(listTileFinder);
      expect((listTile as ListTile).contentPadding, EdgeInsets.zero);
      expect((listTile.trailing! as Switch).autofocus, true);
      expect((listTile.trailing! as Switch).value, true);

      final switchWidget = listTile.trailing! as Switch;
      switchWidget.onChanged!.call(true);
      verify(mockAppTheme.switchTheme(isOn: true));
    });
  });
}
