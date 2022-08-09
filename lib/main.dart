import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/quick_actions.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// This is the main function. Future<Void> is a future result of an execution that returns no value. 
/// That would be typically the result of invoking the run method of a Runnable . 
/// A future represents the result of an asynchronous operation, and can have two states: 
/// uncompleted or completed.
Future<void> main() async {
  // Returns an instance of the binding that implements WidgetsBinding.
  WidgetsFlutterBinding.ensureInitialized();
  // Path to a directory where the application may place data that is user-generated.
  final Directory dir = await path.getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());
  await Hive.openBox<User>('currentUser');
  await Hive.openBox<OrgInfo>('currentOrg');
  await Hive.openBox('url');
  setupLocator();
  // The runApp() function takes the given Widget and makes it the root of the widget tree.
  runApp(MyApp());
}

/// The name of the Stateful Widget is MyApp which is called from the runApp() and extends a stateful widget. 
/// Stateful Widgets are dynamic widgets. They can be updated during runtime based on user action or data change. 
/// 
/// Learn more about Stateful widget [here](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html).
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

/// The _MyAppState class extends the State. All the coding related to state updation is inside this class.
class _MyAppState extends State<MyApp> {
  final quickActions = const QuickActions();
  late int mainScreenQuickActionindex = 0;
  @override
  void initState() {
    // initState() is a method that is called once when the Stateful Widget is inserted in the widget tree. 
    // We generally override this method if we need to do some sort of initialization work like 
    // registering a listener because, unlike build(), this method is called once.
    initQuickActions();
    super.initState();
  }

  // It allows to manage and interact with the application’s home screen quick actions.
  initQuickActions() async {
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
      quickActions.setShortcutItems(ShortCutMenu.quickActionsList);
    }
  }

  // The build method is called any time you call setState , your widget's dependencies update, 
  // or any of the parent widgets are rebuilt.
  @override
  Widget build(BuildContext context) {
    return BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, langModel, child) {
        return BaseView<AppTheme>(
          onModelReady: (model) => model.initialize(),
          builder: (context, model, child) {
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
              ],
              title: 'Talawa',
              theme: Provider.of<AppTheme>(context).isdarkTheme
                  ? TalawaTheme.darkTheme
                  : TalawaTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              navigatorKey: navigationService.navigatorKey,
              onGenerateRoute: router.generateRoute,
              localeResolutionCallback:
                  (Locale? locale, Iterable<Locale> supportedLocales) {
                if (locale == null) {
                  debugPrint("*language locale is null!!!");
                  return supportedLocales.first;
                }
                for (final Locale supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode ||
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
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
  }
}

/// PageView is a scrollable list that works page by page. DemoPageView is demo PageView of Talawa Mobile App.
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
    );
  }
}

/// ViewModel uses property-based data binding to establish a connection between the ViewModel and the View, 
/// and drives the View changes through the ViewModel. DemoViewModel is the ViewModel for DemoPageView.
class DemoViewModel extends BaseModel {
  final String _title = "Title from the viewMode GSoC branch";
  String get title => _title;
}
