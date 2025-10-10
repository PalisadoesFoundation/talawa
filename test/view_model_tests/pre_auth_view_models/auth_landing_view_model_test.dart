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
    dotenv.testLoad(fileInput: '''API_URL=http://<IPv4>:4000/graphql''');
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

      final box = Hive.box('url');
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
      await locator.unregister<Validator>();
      final service = MockValidator();

      locator.registerSingleton<Validator>(service);

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

      locator.unregister<Validator>();
    });
  });
}
