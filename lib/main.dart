//Flutter Packages are imported here
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//Pages are imported here
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/groups_controller.dart';
import 'package:talawa/controllers/lang_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/controllers/signup_login_controller.dart';
import 'package:talawa/controllers/url_controller.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/controllers/news_feed_controller.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/loghelper.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/login_signup/set_url_page.dart';
import 'controllers/auth_controller.dart';
import 'controllers/org_controller.dart';
import 'router.dart' as router;

Preferences preferences = Preferences();
LogHelper logHelper = LogHelper();
Future<void> main() async {
  //ensuring weather the app is being initialized or not
  WidgetsFlutterBinding.ensureInitialized();
  final AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  setupLocator();
  await logHelper.init(); // To intialise FlutterLog
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
            create: (_) => GraphQLConfiguration()),
        ChangeNotifierProvider<OrgController>(create: (_) => OrgController()),
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<Preferences>(create: (_) => Preferences()),
        ChangeNotifierProvider.value(value: AppLanguage()),
        ChangeNotifierProvider<CommentHandler>(create: (_) => CommentHandler()),
        ChangeNotifierProvider<GroupController>(
            create: (_) => GroupController()),
        ChangeNotifierProvider<NewsFeedProvider>(
            create: (_) => NewsFeedProvider()),
        ChangeNotifierProvider<UrlController>(create: (_) => UrlController()),
        ChangeNotifierProvider<SignupLoginController>(
            create: (_) => SignupLoginController()),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(
      builder: (context, appLang, _) => GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: MaterialApp(
          locale: appLang.appLocal,
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('es', 'ES'),
            const Locale('fr', 'FR'),
            const Locale('hi', 'IN'),
            const Locale('zh-CN', 'CN'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          title: UIData.appName,
          theme: ThemeData(
            primaryColor: UIData.primaryColor,
            fontFamily: UIData.quickFont,
            primarySwatch: UIData.primaryColor as MaterialColor,
          ),
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.generateRoute,
          home: FutureBuilder(
            future: preferences.getUserId(),
            initialData: "Initial Data",
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data.toString() == "Initial Data") {
                return Scaffold(
                  body: Container(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                throw FlutterError(
                    'There is some error with "${snapshot.data}"\n');
              } else if (snapshot.data != null) {
                return const HomePage();
              }
              return UrlPage();
            },
          ),
        ),
      ),
    );
  }
}
