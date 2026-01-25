// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talawa/utils/app_localization.dart';

/// Helper function to wrap widgets with MaterialApp for golden tests.
///
/// **params**:
/// * `child`: The widget to wrap
/// * `themeMode`: The theme mode (light or dark)
///
/// **returns**:
/// * `Widget`: A MaterialApp wrapping the child widget
Widget themedWidget(Widget child, {ThemeMode themeMode = ThemeMode.light}) {
  return MaterialApp(
    themeMode: themeMode,
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    localizationsDelegates: const [
      AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: const Locale('en'),
    home: Scaffold(
      body: child,
    ),
  );
}

/// Generates a consistent golden file name.
///
/// **params**:
/// * `widgetName`: The name of the widget being tested
/// * `variant`: The variant of the test (e.g., 'with_data', 'empty_state')
/// * `theme`: The theme mode ('light' or 'dark')
///
/// **returns**:
/// * `String`: The golden file name
String goldenFileName(String widgetName, String variant, String theme) {
  return 'goldens/${widgetName}_${variant}_$theme.png';
}
