// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
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
    theme: TalawaTheme.lightTheme,
    darkTheme: TalawaTheme.darkTheme,
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

/// Module-level variables to store original rendering settings.
Size? _originalSize;
double? _originalDpr;

/// Sets up deterministic rendering for golden tests.
///
/// Locks the physical size and device pixel ratio to ensure consistent
/// rendering across different platforms and devices.
///
/// **Usage**:
/// ```dart
/// setUpAll(() => setUpGoldenTests());
/// ```
///
/// **params**:
///   None
///
/// **returns**:
///   None
void setUpGoldenTests() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  final view = binding.platformDispatcher.views.first;

  _originalSize = view.physicalSize;
  _originalDpr = view.devicePixelRatio;

  view.physicalSize = const Size(1080, 1920);
  view.devicePixelRatio = 1.0;
}

/// Tears down golden test setup and restores original rendering settings.
///
/// **Usage**:
/// ```dart
/// tearDownAll(() => tearDownGoldenTests());
/// ```
///
/// **params**:
///   None
///
/// **returns**:
///   None
void tearDownGoldenTests() {
  final view = TestWidgetsFlutterBinding.ensureInitialized()
      .platformDispatcher
      .views
      .first;

  if (_originalSize != null) {
    view.physicalSize = _originalSize!;
  }

  if (_originalDpr != null) {
    view.devicePixelRatio = _originalDpr!;
  }
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
  assert(
    widgetName.isNotEmpty,
    'widgetName must not be empty',
  );
  assert(
    variant.isNotEmpty,
    'variant must not be empty',
  );
  assert(
    theme.isNotEmpty,
    'theme must not be empty',
  );
  return 'goldens/${widgetName}_${variant}_$theme.png';
}
