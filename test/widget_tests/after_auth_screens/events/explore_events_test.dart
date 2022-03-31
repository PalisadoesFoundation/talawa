import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';

Widget createExploreEventPage(
    {ThemeMode themeMode = ThemeMode.light, required ThemeData theme}) {
  return BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (ctx, langModel, child) => MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: [
              const AppLocalizationsDelegate(isTest: true),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            key: const Key('Root'),
            themeMode: themeMode,
            theme: theme,
            home: const Scaffold(
              body: ExploreEvents(
                key: Key('ExploreEvents'),
              ),
            ),
            navigatorKey: navigationService.navigatorKey,
            onGenerateRoute: router.generateRoute,
          ));
}

main() {
  setUp(() {
    registerViewModels();
    locator<SizeConfig>().test();

    registerServices();
  });
  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });

  // group('Testing Layout', () {
  //   testWidgets('Explore Events layout', (tester) async {
  //     await tester
  //         .pumpWidget(createExploreEventPage(theme: TalawaTheme.lightTheme));
  //     await tester.pumpAndSettle();
  //     expect(find.byKey(const Key('ExploreEventsAppBar')), findsOneWidget);
  //   });
  // });
}
