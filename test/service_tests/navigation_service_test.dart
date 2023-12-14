import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/talawa_error_dialog.dart';
import 'package:talawa/widgets/talawa_error_snackbar.dart';

/// This methods tries to cover all the cases which can be there in future.
///
/// **params**:
/// * `settings`: RouteSettings
///
/// **returns**:
/// * `Route<dynamic>`: Returns Route Type
Route<dynamic> _onGenerateTestRoute(RouteSettings settings) {
  if (settings.name == '/second-screen') {
    if (settings.arguments == null) {
      return MaterialPageRoute(builder: (context) => const SecondTestScreen());
    } else {
      if (settings.arguments is String) {
        return MaterialPageRoute(
          builder: (context) => SecondTestScreen(
            arguments: settings.arguments! as String,
          ),
        );
      } else if (settings.arguments is Function) {
        return MaterialPageRoute(
          builder: (context) => SecondTestScreen(
            onclick: settings.arguments! as VoidCallback,
          ),
        );
      } else if (settings.arguments is Map<String, dynamic>) {
        final map = settings.arguments! as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => SecondTestScreen(
            arguments: map['Argument'] as String,
            onclick: map['Function'] as VoidCallback,
          ),
        );
      }
    }
  }
  if (settings.name == '/first-screen') {
    if (settings.arguments == null) {
      return MaterialPageRoute(
        builder: (context) => FirstTestScreen(
          onClick: () {},
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => FirstTestScreen(
          onClick: () {},
          arguments: settings.arguments! as String,
        ),
      );
    }
  }
  if (settings.name == '/third-screen') {
    if (settings.arguments == null) {
      return MaterialPageRoute(builder: (context) => const ThirdTestScreen());
    } else {
      return MaterialPageRoute(
        builder: (context) => ThirdTestScreen(
          arguments: settings.arguments! as String,
        ),
      );
    }
  }
  return MaterialPageRoute(
    builder: (context) => FirstTestScreen(
      onClick: () {},
    ),
  );
}

/// HomeAppWidget.
class HomeApp extends StatefulWidget {
  const HomeApp({
    super.key,
    required this.onClick,
    required this.navigateorKey,
  });

  /// Navigator Key.
  final GlobalKey<NavigatorState> navigateorKey;

  /// On Click Void FUnction.
  final VoidCallback onClick;

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget.navigateorKey,
      initialRoute: '/',
      onGenerateRoute: _onGenerateTestRoute,
      home: FirstTestScreen(
        onClick: () {
          widget.onClick();
        },
      ),
    );
  }
}

/// TestScreen.
class FirstTestScreen extends StatefulWidget {
  const FirstTestScreen({super.key, required this.onClick, this.arguments});

  /// On Click Void Function.
  final VoidCallback onClick;

  /// Arguments.
  final String? arguments;

  @override
  State<FirstTestScreen> createState() => _FirstScrenState();
}

class _FirstScrenState extends State<FirstTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Button'),
              onPressed: () {
                widget.onClick();
              },
            ),
          ),
          const Text('First Screen'),
          Center(
            child: Text(widget.arguments == null ? 'null' : widget.arguments!),
          ),
        ],
      ),
    );
  }
}

/// Test Screens.
class SecondTestScreen extends StatefulWidget {
  const SecondTestScreen({super.key, this.arguments, this.onclick});

  /// Arguements.
  final String? arguments;

  /// a_line_ending_with_end_punctuation.
  ///
  /// more_info_if_required
  final VoidCallback? onclick;

  @override
  State<SecondTestScreen> createState() => _SecondTestScreenState();
}

class _SecondTestScreenState extends State<SecondTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(child: Text('Second Screen')),
          Center(
            child: Text(widget.arguments == null ? 'null' : widget.arguments!),
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.onclick != null) {
                widget.onclick?.call();
              }
            },
            child: const Text('Button 2'),
          ),
        ],
      ),
    );
  }
}

///Test Screen.
class ThirdTestScreen extends StatefulWidget {
  const ThirdTestScreen({super.key, this.arguments});

  ///arguements.
  final String? arguments;

  @override
  State<ThirdTestScreen> createState() => _ThirdTestScreenState();
}

class _ThirdTestScreenState extends State<ThirdTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Third Screen'),
          Center(
            child: Text(widget.arguments == null ? 'null' : widget.arguments!),
          ),
        ],
      ),
    );
  }
}

///Error Widget.
class TalawaErrorWidget extends StatelessWidget {
  const TalawaErrorWidget({
    super.key,
    required this.navigationService,
    required this.onClick,
  });

  ///Navigation Service.
  final NavigationService navigationService;

  ///OnClick void Function.
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationService.navigatorKey,
      navigatorObservers: [],
      locale: const Locale('en'),
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
        const Locale('fr', 'FR'),
        const Locale('hi', 'IN'),
        const Locale('zh', 'CN'),
        const Locale('de', 'DE'),
        const Locale('ja', 'JP'),
        const Locale('pt', 'PT'),
      ],
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
        body: TextButton(
          child: const Text('Open'),
          onPressed: () {
            onClick();
          },
        ),
      ),
    );
  }
}

///Tests Navigation Service.
///
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  SizeConfig().test();
  group('Navigation Services Tests', () {
    late NavigationService navigationService;
    late GlobalKey<NavigatorState> mockKey;
    setUp(() {
      navigationService = NavigationService();
      mockKey = navigationService.navigatorKey;
    });
    testWidgets('pushScreen() test without arguments',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () async {
            await navigationService.pushScreen('/second-screen');
          },
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('Second Screen'), findsOneWidget);
      expect(find.textContaining('null'), findsOneWidget);
    });
    testWidgets('pushScreen() test with arguments', (tester) async {
      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () async {
            await navigationService.pushScreen(
              '/second-screen',
              arguments: 'Hello Talawa',
            );
          },
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('Second Screen'), findsOneWidget);
      expect(find.textContaining('Hello Talawa'), findsOneWidget);
    });
    testWidgets('popAndPushScreen() test without arguments', (tester) async {
      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () async {
            await mockKey.currentState!.pushNamed('/second-screen');
          },
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      final initialPageLength = mockKey.currentState!.widget.pages.length;
      navigationService.popAndPushScreen('/first-screen');
      await tester.pumpAndSettle();
      final finalPageLength = mockKey.currentState!.widget.pages.length;
      expect(find.textContaining('null'), findsOneWidget);
      expect(find.textContaining('First Screen'), findsOneWidget);
      expect(finalPageLength, initialPageLength);
    });
    testWidgets('popAndPushScreen() test with arguments', (tester) async {
      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () async {
            await mockKey.currentState!.pushNamed('/second-screen');
          },
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      final initialPageLength = mockKey.currentState!.widget.pages.length;
      navigationService.popAndPushScreen(
        '/first-screen',
        arguments: 'Hello Talawa',
      );
      await tester.pumpAndSettle();
      final finalPageLength = mockKey.currentState!.widget.pages.length;
      expect(find.textContaining('Hello Talawa'), findsOneWidget);
      expect(find.textContaining('First Screen'), findsOneWidget);
      expect(finalPageLength, initialPageLength);
    });
    testWidgets('pushReplacementScreen() test without arguments',
        (tester) async {
      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () async {
            await mockKey.currentState!.pushNamed(
              '/second-screen',
              arguments: mockKey.currentState!.pushNamed('/first-screen'),
            );
          },
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      navigationService.pushReplacementScreen('/first-screen');
      await tester.pumpAndSettle();
      expect(find.textContaining('null'), findsOneWidget);
      expect(find.textContaining('First Screen'), findsOneWidget);
    });
    testWidgets('pushReplacementScreen() test with arguments', (tester) async {
      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () async {
            await mockKey.currentState!.pushNamed(
              '/second-screen',
              arguments: mockKey.currentState!.pushNamed('/first-screen'),
            );
          },
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      navigationService.pushReplacementScreen(
        '/first-screen',
        arguments: 'Hello Talawa',
      );
      await tester.pumpAndSettle();
      expect(find.textContaining('Hello Talawa'), findsOneWidget);
      expect(find.textContaining('First Screen'), findsOneWidget);
    });
    testWidgets('removeAllAndPush() test without arguments', (tester) async {
      ///Function To test.
      ///
      /// **params**:
      ///   None
      ///
      /// **returns**:
      ///   None
      void functionToTest() {
        navigationService.removeAllAndPush(
          '/third-screen',
          '/second-screen',
        );
      }

      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () async {
            await mockKey.currentState!.pushNamed(
              '/second-screen',
              arguments: functionToTest,
            );
          },
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('null'), findsOneWidget);
      expect(find.textContaining('Third Screen'), findsOneWidget);
      expect(mockKey.currentState!.widget.pages.length, 0);
    });
    testWidgets('removeAllAndPush() test with arguments', (tester) async {
      void functionToTest() {
        navigationService.removeAllAndPush(
          '/third-screen',
          '/second-screen',
          arguments: 'Hello Talawa',
        );
      }

      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () async {
            await mockKey.currentState!.pushNamed(
              '/second-screen',
              arguments: functionToTest,
            );
          },
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('Hello Talawa'), findsOneWidget);
      expect(find.textContaining('Third Screen'), findsOneWidget);
      expect(mockKey.currentState!.widget.pages.length, 0);
    });
    testWidgets('pushDialog() test', (tester) async {
      Widget testDialog() {
        return const AlertDialog(
          title: Text('Test Dialog'),
          content: Text('This is a test dialog.'),
        );
      }

      void functionForOnClick() {
        navigationService.pushDialog(testDialog());
      }

      await tester.pumpWidget(
        HomeApp(navigateorKey: mockKey, onClick: functionForOnClick),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.byWidget(testDialog()), findsOneWidget);
      await tester.tap(find.byType(FirstTestScreen), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.byWidget(testDialog()), findsOneWidget);
    });
    testWidgets('showSnackBar() test with default duration', (tester) async {
      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () {
            navigationService.showSnackBar('Hello Talawa');
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('Hello Talawa'), findsOneWidget);
      final snackBarFinder = find.byType(SnackBar);
      final snackBarWidget = tester.widget<SnackBar>(snackBarFinder);
      expect(snackBarWidget.behavior, equals(SnackBarBehavior.floating));
      expect(snackBarWidget.duration, equals(const Duration(seconds: 2)));
    });
    testWidgets('showSnackBar() test with custom duration', (tester) async {
      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () {
            navigationService.showSnackBar(
              'Hello Talawa',
              duration: const Duration(seconds: 3),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('Hello Talawa'), findsOneWidget);
      final snackBarFinder = find.byType(SnackBar);
      final snackBarWidget = tester.widget<SnackBar>(snackBarFinder);
      expect(snackBarWidget.behavior, equals(SnackBarBehavior.floating));
      expect(snackBarWidget.duration, equals(const Duration(seconds: 3)));
    });
    testWidgets('showTalawaErrorSnackBar() test', (tester) async {
      const String errorMessage = 'Error Message';
      await tester.pumpWidget(
        TalawaErrorWidget(
          navigationService: navigationService,
          onClick: () {
            navigationService.showTalawaErrorSnackBar(
              errorMessage,
              MessageType.error,
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
      expect(find.byType(TalawaErrorSnackBar), findsOneWidget);
      final snackBarFinder = find.byType(SnackBar);
      final snackBarWidget = tester.widget<SnackBar>(snackBarFinder);
      expect(
        snackBarWidget.duration,
        equals(const Duration(milliseconds: errorMessage.length * 80)),
      );
      expect(
        snackBarWidget.backgroundColor,
        const Color.fromRGBO(65, 65, 66, 1),
      );
    });
    testWidgets('showTalawaErrorDialog() test with custom duration',
        (tester) async {
      await tester.pumpWidget(
        TalawaErrorWidget(
          navigationService: navigationService,
          onClick: () {
            navigationService.showTalawaErrorDialog(
              'Hello Talawa',
              MessageType.error,
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
      expect(find.byType(TalawaErrorDialog), findsOneWidget);
      await tester.tap(find.byType(TalawaErrorWidget), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.byType(TalawaErrorDialog), findsOneWidget);
    });
    testWidgets('pop() method test', (tester) async {
      await tester.pumpWidget(
        HomeApp(
          navigateorKey: mockKey,
          onClick: () {
            navigationService.pop();
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(mockKey.currentState!.canPop(), false);
    });
  });
}
