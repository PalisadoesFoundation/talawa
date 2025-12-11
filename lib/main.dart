import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as fs;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:talawa/constants/quick_actions.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/hive_manager.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/base_view.dart';

Future<void> main() async {
  // Returns an instance of the binding that implements WidgetsBinding.
  WidgetsFlutterBinding.ensureInitialized();

  final Directory dir = await path.getApplicationDocumentsDirectory();

  await HiveManager.initializeHive(dir: dir);

  // Load environment variables from .env file
  await dotenv.load(fileName: ".env").then((value) {
    debugPrint("Environment variables loaded");
    debugPrint(dotenv.get('API_URL'));
  }).catchError((error) {
    debugPrint("Error loading environment variables: $error");
    throw Exception("Failed to load environment variables: $error");
  });

  await setupLocator();

  final appConnectivity = locator<AppConnectivity>();
  await appConnectivity.initialise();
  locator<GraphqlConfig>().getOrgUrl();

  // The runApp() function takes the given Widget and makes it the root of the widget tree.
  runApp(MyApp());
}

/// Main widget that sets up the quick actions, internationalization, routing , notifications.
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

/// The _MyAppState class extends the State.
///
/// All the coding related to state updation is inside this class.
class _MyAppState extends State<MyApp> {
  /// Initializing the Quickactions to enable them on long press of app icon in device.
  final quickActions = const QuickActions();

  /// Initializing the mainScreen window to 1 to show the events by default after app in opened.
  late int mainScreenQuickActionindex = 0;
  @override
  void initState() {
    // initState() is a method that is called once when the Stateful Widget
    // is inserted in the widget tree. We generally override this method if
    // we need to do some sort of initialization work like
    // registering a listener because, unlike build(), this method is called once.
    super.initState();

    initQuickActions();

    fs.SystemChrome.setPreferredOrientations(
      [
        fs.DeviceOrientation.portraitUp,
        fs.DeviceOrientation.portraitDown,
      ],
    );
  }

  /// It allows to manage and interact with the application’s home screen quick actions.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> initQuickActions() async {
    final bool userLoggedIn = await userConfig.userLoggedIn();
    if (userLoggedIn &&
        userConfig.currentUser.joinedOrganizations!.isNotEmpty) {
      quickActions.initialize((type) {
        if (type == ShortCutMenu.eventAction.type) {
          mainScreenQuickActionindex = 1;
        } else if (type == ShortCutMenu.feedAction.type) {
          mainScreenQuickActionindex = 0;
        } else if (type == ShortCutMenu.chatAction.type) {
          mainScreenQuickActionindex = 3;
        }
      });

      /// Registering quick action list in the app.zx
      quickActions.setShortcutItems(ShortCutMenu.quickActionsList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, langModel, child) {
        return BaseView<AppTheme>(
          onModelReady: (model) => model.initialize(),
          builder: (context, model, child) {
            return BaseView<AppConnectivity>(
              onModelReady: (connectivityModel) =>
                  connectivityModel.initialise(),
              builder: (context, connectivityModel, child) {
                return MaterialApp(
                  locale: langModel.appLocal,
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
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  title: 'Talawa',
                  theme: Provider.of<AppTheme>(context).theme,
                  debugShowCheckedModeBanner: false,
                  navigatorKey: navigationService.navigatorKey,
                  onGenerateRoute: router.generateRoute,
                  localeResolutionCallback: langModel.localeResoultion,
                  initialRoute: '/',
                  onGenerateInitialRoutes: (String initialRouteName) {
                    return [
                      router.generateRoute(
                        RouteSettings(
                          name: '/',
                          arguments: mainScreenQuickActionindex,
                        ),
                      ),
                    ];
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
