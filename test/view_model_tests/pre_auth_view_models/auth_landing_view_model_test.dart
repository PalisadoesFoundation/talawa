import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/auth_landing_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';

/// This is a class for mock url for testing.
class AuthLandingMock extends StatelessWidget {
  const AuthLandingMock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Form(
        child: Container(),
      ),
      navigatorKey: navigationService.navigatorKey,
    );
  }
}

/// This is a class for mock url for testing.
///
/// **params**:
/// * `themeMode`: dark
///
/// **returns**:
/// * `Widget`: widget

Widget forTest({ThemeMode themeMode = ThemeMode.dark}) => BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        final model1 = AuthLandingViewModel();
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          theme: TalawaTheme.darkTheme,
          home: FloatingActionButton(
            onPressed: () {
              model1.initialise();
            },
          ),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
        );
      },
    );

Future<void> main() async {
  SizeConfig().test();

  late AuthLandingViewModel model;

  locator.registerSingleton<ActionHandlerService>(ActionHandlerService());

  setUp(() {
    dotenv.loadFromString(envString: '''API_URL=http://<IPv4>:4000/graphql''');
    registerServices();
    registerViewModels();
    model = AuthLandingViewModel();
  });
  tearDown(() {
    unregisterViewModels();
  });

  group('SetUrlViewModel Test -', () {
    testWidgets(
        'Check if checkURLandNavigate() is working fine when urlPresent is true',
        (tester) async {
      locator.registerSingleton(Validator());

      // Set URL and imageUrl in Hive box before testing - AuthLandingViewModel expects these to already be set
      final box = Hive.box('url');
      box.put(AuthLandingViewModel.urlKey, 'http://<IPv4>:4000/graphql');
      box.put(AuthLandingViewModel.imageUrlKey,
          'http://<IPv4>:4000/graphql/talawa/');

      await tester.pumpWidget(Form(child: Container()));

      await model.checkURLandNavigate('/', 'arguments');

      final captured = verify(
        (navigationService as MockNavigationService).pushDialog(captureAny),
      ).captured;
      expect(
        captured[0],
        isA<CustomProgressDialog>().having(
          (e) => e.key,
          'key',
          const Key('UrlCheckProgress'),
        ),
      );
      verify(navigationService.pop());
      verify(navigationService.pushScreen('/', arguments: 'arguments'));
      verify(graphqlConfig.getOrgUrl());
      expect(
          box.get(AuthLandingViewModel.urlKey), 'http://<IPv4>:4000/graphql');
      expect(
        box.get(AuthLandingViewModel.imageUrlKey),
        'http://<IPv4>:4000/graphql/talawa/',
      );
    });
    testWidgets('Check if initialize is working fine ', (tester) async {
      final model = AuthLandingViewModel();

      await tester.pumpWidget(const AuthLandingMock());

      model.initialise();
    });
    testWidgets('Check if initialize is working fine when we give url',
        (tester) async {
      final model = AuthLandingViewModel();

      await tester.pumpWidget(const AuthLandingMock());

      model.initialise();
    });

    testWidgets(
        'Check if checkURLandNavigate() is working fine when urlPresent is false',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      final service = MockValidator();

      locator.registerSingleton<Validator>(service);

      // Set URL in Hive box before testing
      final box = Hive.box('url');
      box.put(AuthLandingViewModel.urlKey, 'http://<IPv4>:4000/graphql');

      await tester.pumpWidget(Form(child: Container()));

      when(service.validateUrlExistence('http://<IPv4>:4000/graphql'))
          .thenAnswer((_) async => false);

      await model.checkURLandNavigate('/', 'arguments');

      verify(
        navigationService.showTalawaErrorSnackBar(
          "URL doesn't exist/no connection please check",
          MessageType.error,
        ),
      );

      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
    });

    testWidgets('Check if checkURLandNavigate() shows error when URL is null',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      locator.registerSingleton(Validator());

      // Clear URL from Hive box to trigger null URL error
      final box = Hive.box('url');
      box.delete(AuthLandingViewModel.urlKey);

      // Use minimal widget without localization to hit fallback strings
      await tester.pumpWidget(
        MaterialApp(
          home: Container(),
          navigatorKey: navigationService.navigatorKey,
        ),
      );
      await tester.pumpAndSettle();

      await model.checkURLandNavigate('/login', 'arguments');
      await tester.pumpAndSettle();

      verify(navigationService.pop());
      verify(
        navigationService.showTalawaErrorSnackBar(
          'No URL configured. Please set URL first.',
          MessageType.error,
        ),
      );
    });

    testWidgets('Check if checkURLandNavigate() shows error when URL is empty',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      locator.registerSingleton(Validator());

      // Set empty URL in Hive box
      final box = Hive.box('url');
      box.put(AuthLandingViewModel.urlKey, '');

      await tester.pumpWidget(forTest());
      await tester.pumpAndSettle();

      await model.checkURLandNavigate('/signup', 'arguments');
      await tester.pumpAndSettle();

      verify(navigationService.pop());
      verify(
        navigationService.showTalawaErrorSnackBar(
          'No URL configured. Please set URL first.',
          MessageType.error,
        ),
      );
    });

    testWidgets('Check if checkURLandNavigate() handles validation exception',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      final service = MockValidator();
      locator.registerSingleton<Validator>(service);

      // Set URL in Hive box before testing
      final box = Hive.box('url');
      box.put(AuthLandingViewModel.urlKey, 'http://<IPv4>:4000/graphql');

      // Use minimal widget without localization to hit fallback strings
      await tester.pumpWidget(
        MaterialApp(
          home: Container(),
          navigatorKey: navigationService.navigatorKey,
        ),
      );
      await tester.pumpAndSettle();

      // Mock validator to throw exception
      when(service.validateUrlExistence('http://<IPv4>:4000/graphql'))
          .thenThrow(Exception('Network error'));

      await model.checkURLandNavigate('/login', 'arguments');
      await tester.pumpAndSettle();

      verify(navigationService.pop());
      verify(
        navigationService.showTalawaErrorSnackBar(
          "Something went wrong!",
          MessageType.error,
        ),
      );

      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
    });

    testWidgets('Check if checkURLandNavigate() handles null validation result',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      final service = MockValidator();
      locator.registerSingleton<Validator>(service);

      // Set URL in Hive box before testing
      final box = Hive.box('url');
      box.put(AuthLandingViewModel.urlKey, 'http://<IPv4>:4000/graphql');

      // Use minimal widget without localization to hit fallback strings
      await tester.pumpWidget(
        MaterialApp(
          home: Container(),
          navigatorKey: navigationService.navigatorKey,
        ),
      );
      await tester.pumpAndSettle();

      // Mock validator to return null (validation failed but not false)
      when(service.validateUrlExistence('http://<IPv4>:4000/graphql'))
          .thenAnswer((_) async => null);

      await model.checkURLandNavigate('/login', 'arguments');
      await tester.pumpAndSettle();

      verify(navigationService.pop());
      verify(
        navigationService.showTalawaErrorSnackBar(
          "Something went wrong!",
          MessageType.error,
        ),
      );

      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
    });

    test('Check if checkURLandNavigate() uses fallback strings with no context',
        () async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      final service = MockValidator();
      locator.registerSingleton<Validator>(service);

      // Set URL in Hive box
      final box = Hive.box('url');
      box.put(AuthLandingViewModel.urlKey, 'http://<IPv4>:4000/graphql');

      // Don't pump any widget - context will be null
      // This will trigger fallback strings on lines 83, 85, 89

      // Mock validator to return false
      when(service.validateUrlExistence('http://<IPv4>:4000/graphql'))
          .thenAnswer((_) async => false);

      await model.checkURLandNavigate('/login', 'arguments');

      verify(navigationService.pop());
      verify(
        navigationService.showTalawaErrorSnackBar(
          "URL doesn't exist/no connection please check",
          MessageType.error,
        ),
      );

      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
    });

    testWidgets(
        'Check if checkURLandNavigate() uses fallback strings when no localization',
        (tester) async {
      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
      final service = MockValidator();
      locator.registerSingleton<Validator>(service);

      // Set URL in Hive box before testing
      final box = Hive.box('url');
      box.put(AuthLandingViewModel.urlKey, 'http://<IPv4>:4000/graphql');

      // Use minimal widget without AppLocalizations to trigger fallback strings
      await tester.pumpWidget(
        MaterialApp(
          home: Container(),
          navigatorKey: navigationService.navigatorKey,
        ),
      );
      await tester.pumpAndSettle();

      // Mock validator to return false to hit urlNotExistMessage fallback
      when(service.validateUrlExistence('http://<IPv4>:4000/graphql'))
          .thenAnswer((_) async => false);

      await model.checkURLandNavigate('/login', 'arguments');
      await tester.pumpAndSettle();

      verify(navigationService.pop());
      verify(
        navigationService.showTalawaErrorSnackBar(
          "URL doesn't exist/no connection please check",
          MessageType.error,
        ),
      );

      if (locator.isRegistered<Validator>()) {
        await locator.unregister<Validator>();
      }
    });
  });
}
