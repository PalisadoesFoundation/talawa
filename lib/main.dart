import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as fs;
<<<<<<< HEAD
=======
import 'package:flutter_dotenv/flutter_dotenv.dart';
>>>>>>> upstream/develop
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:talawa/constants/quick_actions.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/hive_manager.dart';
import 'package:talawa/utils/app_localization.dart';
<<<<<<< HEAD
import 'package:talawa/view_model/base_view_model.dart';
=======
>>>>>>> upstream/develop
import 'package:talawa/view_model/connectivity_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/base_view.dart';

Future<void> main() async {
  // Returns an instance of the binding that implements WidgetsBinding.
  WidgetsFlutterBinding.ensureInitialized();

  final Directory dir = await path.getApplicationDocumentsDirectory();

  await HiveManager.initializeHive(dir: dir);

<<<<<<< HEAD
  setupLocator();
=======
  // Load environment variables from .env file
  try {
    await dotenv.load(fileName: ".env");
    debugPrint("Environment variables loaded");
  } catch (error) {
    debugPrint("No .env file found or error loading it: $error");
  }

  await setupLocator();

  final appConnectivity = locator<AppConnectivity>();
  await appConnectivity.initialise();
>>>>>>> upstream/develop

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
<<<<<<< HEAD

// ignore: avoid_void_async
  void initQuickActions() async {
=======
  Future<void> initQuickActions() async {
>>>>>>> upstream/develop
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
<<<<<<< HEAD
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
=======
                return Selector<AppTheme, ThemeData>(
                  selector: (_, appTheme) => appTheme.theme,
                  builder: (context, themeData, child) {
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
                      theme: themeData,
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
>>>>>>> upstream/develop
                  },
                );
              },
            );
          },
        );
      },
<<<<<<< HEAD
    );
  }
}

/// PageView is a scrollable list that works page by page.
///
/// DemoPageView is demo PageView of Talawa Mobile App.
class DemoPageView extends StatelessWidget {
  const DemoPageView({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<DemoViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title:
              Text(AppLocalizations.of(context)!.strictTranslate('Demo Page')),
        ),
        body: Container(
          child: Text(model.title),
        ),
      ),
=======
>>>>>>> upstream/develop
    );
  }
}

/// ViewModel uses property-based data binding to establish a connection.
///
/// between the ViewModel and the View, and drives the View changes
/// through the ViewModel. DemoViewModel is the ViewModel for DemoPageView.
class DemoViewModel extends BaseModel {
  /// Demo title to be used.
  final String _title = "Title from the viewMode GSoC branch";

  /// Getter function of the title.
  ///
  /// params:
  /// None
  /// returns:
  /// * `String`: title  of the model
  String get title => _title;
}
