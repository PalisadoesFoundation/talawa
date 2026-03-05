// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/widgets/theme_switch.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';
import '../helpers/test_locator.dart';
import 'golden_test_helpers.dart';

Widget buildChangeThemeTile({
  required bool isDarkTheme,
  required ThemeMode themeMode,
}) {
  final mockAppTheme = MockAppTheme();
  // Tell the mock what to return — no late fields, no SharedPreferences
  when(mockAppTheme.isdarkTheme).thenReturn(isDarkTheme);

  return ChangeNotifierProvider<AppTheme>.value(
    value: mockAppTheme,
    child: themedWidget(
      const ChangeThemeTile(),
      themeMode: themeMode,
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    testSetupLocator();
    SizeConfig().test();
    setUpGoldenTests();
  });

  setUp(() => registerServices());
  tearDown(() => unregisterServices());
  tearDownAll(() => tearDownGoldenTests());

  group('ChangeThemeTile Golden Tests', () {
    // switch OFF (light mode active)
    testWidgets('switch_off - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildChangeThemeTile(isDarkTheme: false, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(ChangeThemeTile),
        matchesGoldenFile(goldenFileName('theme_switch', 'switch_off', 'light')),
      );
    });

    testWidgets('switch_off - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildChangeThemeTile(isDarkTheme: false, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(ChangeThemeTile),
        matchesGoldenFile(goldenFileName('theme_switch', 'switch_off', 'dark')),
      );
    });

    // switch ON (dark mode active)
    testWidgets('switch_on - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildChangeThemeTile(isDarkTheme: true, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(ChangeThemeTile),
        matchesGoldenFile(goldenFileName('theme_switch', 'switch_on', 'light')),
      );
    });

    testWidgets('switch_on - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildChangeThemeTile(isDarkTheme: true, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(ChangeThemeTile),
        matchesGoldenFile(goldenFileName('theme_switch', 'switch_on', 'dark')),
      );
    });
  });
}
