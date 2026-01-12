import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/utils/app_localization.dart';

/// Helper function to wrap a widget with MaterialApp, theme, and localization.
///
/// This function creates a MaterialApp widget with the specified theme mode,
/// applying Talawa's light and dark themes along with necessary localization
/// delegates for proper widget rendering in golden tests.
///
/// **params**:
/// * `child`: The widget to be wrapped with theme and localization.
/// * `mode`: The theme mode to apply (ThemeMode.light or ThemeMode.dark).
///
/// **returns**:
/// * `Widget`: A MaterialApp widget with theme and localization configured.
Widget themed(Widget child, ThemeMode mode) => MaterialApp(
      themeMode: mode,
      theme: TalawaTheme.lightTheme,
      darkTheme: TalawaTheme.darkTheme,
      localizationsDelegates: const [
        AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      home: Scaffold(body: child),
    );
